package visa.config;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan(basePackages={"visa"},excludeFilters={@Filter(type=FilterType.ANNOTATION,value=EnableWebMvc.class)})
public class RootConfig {
	
	@Bean
	public DataSource dataSource(){
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost/wolfman?useConfigs=maxPerformance&characterEncoding=utf8");
		dataSource.setUsername("travelogix");
		dataSource.setPassword("travelogix");
		return dataSource;
	}
	
	@Bean
	@Autowired
	public JdbcTemplate jdbcTemplate(DataSource dataSource){
		return new JdbcTemplate(dataSource);
	}
	
	@Bean
	@Autowired
	public NamedParameterJdbcTemplate namedParameterJdbcTemplate(DataSource dataSource){
		return new NamedParameterJdbcTemplate(dataSource);
	}
}
