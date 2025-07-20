package com.anhee.filter;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.anhee.service.IserviceMgmt;
import com.anhee.service.JwtService;

import io.jsonwebtoken.io.IOException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AppFilter extends OncePerRequestFilter {

    @Autowired
    private JwtService jwtService;

    @Autowired
    IserviceMgmt userDetailsService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) 
            throws ServletException, IOException, java.io.IOException {
        
        String path = request.getServletPath();
        
        // Skip filtering for auth endpoints and static resources
        if (path.startsWith("/api/auth") || path.startsWith("/error") || 
            path.startsWith("/resources") || path.startsWith("/static")) {
            try {
				filterChain.doFilter(request, response);
			} catch (java.io.IOException | ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            return;
        }

        String token = getTokenFromHeader(request);
        
        if (token != null) {
            try {
                String username = jwtService.extractUsername(token);
                UserDetails userDetails = userDetailsService.loadUserByUsername(username);
                
                if (jwtService.validateToken(token, userDetails)) {
                    // Set authentication
                    UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
                        userDetails, null, userDetails.getAuthorities());
                    auth.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(auth);
                    
                    // Auto-route based on role for specific entry points
                    if (shouldAutoRoute(path)) {
                        String role = getHighestAuthority(userDetails.getAuthorities());
                        String dashboardPath = "/api/" + role.toLowerCase() + "/dashboard";
                        request.getRequestDispatcher(dashboardPath).forward(request, response);
                        return;
                    }
                }
            } catch (Exception e) {
                // Handle invalid token
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid token");
                return;
            }
        }
        
        filterChain.doFilter(request, response);
    }

    private String getTokenFromHeader(HttpServletRequest request) {
        String header = request.getHeader("Authorization");
        if (header != null && header.startsWith("Bearer ")) {
            return header.substring(7);
        }
        return null;
    }

    private boolean shouldAutoRoute(String path) {
        // Auto-route for these entry points
        return path.equals("/") || 
               path.equals("/dashboard") ||
               path.equals("/home") ||
               path.equals("/chef") || 
               path.equals("/customer") ||
               path.equals("/kitchen") ||
               path.equals("/deliveryboy");
    }

    private String getHighestAuthority(Collection<? extends GrantedAuthority> authorities) {
        return authorities.stream()
                .findFirst()
                .map(GrantedAuthority::getAuthority)
                .map(auth -> auth.replace("ROLE_", ""))
                .orElseThrow(() -> new RuntimeException("No authorities found"));
    }
}