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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AppFilter extends OncePerRequestFilter {

    @Autowired
    private JwtService jwtService;

    @Autowired
    IserviceMgmt userDetailsService;

    private static final String AUTH_COOKIE_NAME = "auth_token";
    
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) 
            throws ServletException, IOException, java.io.IOException {
        
        String path = request.getServletPath();
        
        if (path.startsWith("/api/auth") || path.startsWith("/error") || 
                path.startsWith("/resources") || path.startsWith("/static") ||
                path.equals("/favicon.ico")) {
                filterChain.doFilter(request, response);
                return;
            }

        String token = getTokenFromHeader(request);
        if (token == null) {
            token = getTokenFromCookie(request);
        }
        
        if (token != null) {
            try {
            	
            	
            	//checking token expired or not 
            	 if (jwtService.isTokenExpired(token)) {
            		 
            		 System.err.println("AppFilter.doFilterInternal() token expired condtion exicuted ....");
                     // Token expired - send 401
                     SecurityContextHolder.clearContext();
                     response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                     response.getWriter().write("Token expired");
                     return;
                 }
            	
            	
            	
            	
            	
            	
                String username = jwtService.extractUsername(token);
                UserDetails userDetails = userDetailsService.loadUserByUsername(username);
                
                if (jwtService.validateToken(token, userDetails)) {
                    UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
                        userDetails, null, userDetails.getAuthorities());
                    auth.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(auth);
                    
                    if (shouldAutoRoute(path)) {
                        String role = getHighestAuthority(userDetails.getAuthorities());
                        String dashboardPath = "/api/" + role.toLowerCase() + "/dashboard";
                        request.getRequestDispatcher(dashboardPath).forward(request, response);
                        return;
                    }
                }
            } catch (Exception e) {
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

    private String getTokenFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (AUTH_COOKIE_NAME.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    private boolean shouldAutoRoute(String path) {
        return path.equals("/") || path.equals("/dashboard") ||
               path.equals("/home") || path.equals("/chef") || 
               path.equals("/customer") || path.equals("/kitchen") ||
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