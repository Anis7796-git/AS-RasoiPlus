package com.anhee.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.anhee.filter.AppFilter;
import com.anhee.service.IserviceMgmt;

import lombok.SneakyThrows;

@Configuration
@EnableWebSecurity
public class AppSecurityConfigurer {

	@Autowired
	private IserviceMgmt service;
	
	
	@Autowired private AppFilter jwtfilter;

	@Bean
	public BCryptPasswordEncoder pwdEncoder() {

		return new BCryptPasswordEncoder();
	}

//	@SneakyThrows
//	@Bean
//	public SecurityFilterChain security(HttpSecurity http) {
//		
//		http.authorizeHttpRequests((req)
//				->req.requestMatchers("/login","/register").permitAll()
//				.anyRequest().authenticated()).httpBasic(Customizer.withDefaults())
//		.formLogin(Customizer.withDefaults());
//		return http.build();
//	}	

	
	
	@Bean
	public DaoAuthenticationProvider authProvider() {
		DaoAuthenticationProvider authprovider = new DaoAuthenticationProvider();

		authprovider.setPasswordEncoder(pwdEncoder());
		authprovider.setUserDetailsService(service);
		return authprovider;
	}

	
	
	@SneakyThrows
	@Bean
	public AuthenticationManager authenticationManager(AuthenticationConfiguration config) {
		return config.getAuthenticationManager();
	}

	
	
	
	@SneakyThrows
	@Bean
	public SecurityFilterChain security(HttpSecurity http) throws Exception {
	    http
	        .authorizeHttpRequests(auth -> auth
	            .requestMatchers(
	                "/api/auth/**",
	                "/error",
	                "/front/login","/favicon.ico",
	                "/WEB-INF/pages/**",
	                "/loginRegister",
	                "/swagger-ui/**",
	                "/v3/api-docs/**"
	            ).permitAll()
	            .requestMatchers("/", "/dashboard", "/home", "/chef", "/customer", "/kitchen", "/deliveryboy").authenticated()
	            .requestMatchers("/api/chef/**").hasRole("CHEF")
	            .requestMatchers("/api/customer/**").hasRole("CUSTOMER")
	            .requestMatchers("/api/kitchen/**").hasRole("KITCHEN")
	            .requestMatchers("/api/deliveryboy/**").hasRole("DELIVERYBOY")
	            .anyRequest().authenticated()
	        )
	        .sessionManagement(session -> session
	            .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
	        )
	        .addFilterBefore(jwtfilter, UsernamePasswordAuthenticationFilter.class)
	        .csrf().disable();
//	        .csrf(csrf -> csrf
//	        	    .csrfTokenRepository(new HttpSessionCsrfTokenRepository())
//	        	    .requireCsrfProtectionMatcher(new AntPathRequestMatcher("/addMenu", "POST"))
//	        		.ignoringRequestMatchers("/api/auth/**","/customer/editprofile") // Exclude auth endpoints if needed
//	                );
	    
	    return http.build();
	}
	
	
//	    @Bean
//	    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//	        http
//	            .authorizeHttpRequests(auth -> auth
//	                .requestMatchers(
//	                    "/front/login",
//	                    "/perform_login",
//	                    "/resources/**",
//	                    "/static/**",
//	                    "/css/**",
//	                    "/js/**",
//	                    "/images/**",
//	                    "/favicon.ico",
//	                    "/error","/WEB-INF/pages/loginRegister.jsp"
//	                ).permitAll()
//	                .anyRequest().authenticated()
//	            )
//	            .formLogin(form -> form
//	                .loginPage("/front/login")
//	                .loginProcessingUrl("/perform_login")
//	                .defaultSuccessUrl("/home", true)
//	                .failureUrl("/front/login?error=true")
//	                .permitAll()
//	            )
//	            .logout(logout -> logout
//	                .logoutUrl("/perform_logout")
//	                .logoutSuccessUrl("/front/login?logout=true")
//	                .permitAll()
//	            )
//	            .sessionManagement(session -> session
//	                .invalidSessionUrl("/front/login")
//	                .maximumSessions(1)
//	            );
//
//	        return http.csrf().disable().build();
//	    }
//
	    @Bean
	    public WebSecurityCustomizer webSecurityCustomizer() {
	        return (web) -> web.ignoring().requestMatchers(
	            "/resources/**",
	            "/static/**",
	            "/css/**",
	            "/js/**",
	            "/images/**",
	            "/webjars/**"
	        );
	    }
	
}
