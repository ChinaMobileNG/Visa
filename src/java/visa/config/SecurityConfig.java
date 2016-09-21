package visa.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
@SuppressWarnings("deprecation")
@Configuration
@EnableWebMvcSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
	DataSource dataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth
		.jdbcAuthentication()
		.dataSource(dataSource)
		.usersByUsernameQuery("select username,password,enabled from users where username=?")
		.authoritiesByUsernameQuery("select username,authority from users where username=?");
		//.passwordEncoder(new StandardPasswordEncoder("53cr3t"));
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		//super.configure(http);
		http
		.formLogin()
		.loginPage("/login")
		.failureUrl("/login?failed=true")
		.and()
		.csrf()
		.disable()
		.authorizeRequests()
		.antMatchers("/traveller/**").hasAnyAuthority("ROLE_TRAVELLER","ROLE_ADMIN")
		.antMatchers("/visaprocess/**").hasAnyAuthority("ROLE_ADMIN")
		.antMatchers("/").authenticated()
		.anyRequest().permitAll();
		//super.configure(http);
	}
}
