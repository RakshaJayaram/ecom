package com.niit.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.model.Cart;

import com.niit.model.Category;
import com.niit.model.Orders;
import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.model.User;

@Configuration
@EnableTransactionManagement
@ComponentScan("com")
@PropertySource(value={"classpath:h2.properties","classpath:oracle.properties"})
//@PropertySource(value="classpath:h2.properties")
public class DBConfig {
	
	@Value("${h2.dc}")
	//@Value("${oracle.dc}")
	String driverClass;
	
	@Value("${h2.url}")
	//@Value("${oracle.url}")
	String url;
	
	@Value("${h2.un}")
	//@Value("${oracle.un}")
	String username;
	
	@Value("${h2.pwd}")
	//@Value("${oracle.pwd}")
	String password;
	
	@Bean("dataSource")
	public DataSource getH2DataSource() {
		DriverManagerDataSource driverMgrDataSource = new DriverManagerDataSource();
		driverMgrDataSource.setDriverClassName(driverClass);
		driverMgrDataSource.setUrl(url);
		driverMgrDataSource.setUsername(username);
		driverMgrDataSource.setPassword(password);
		return driverMgrDataSource;

	}
	
	/*@Bean("dataSource")
	public DataSource getH2DataSource() {
		DriverManagerDataSource driverMgrDataSource = new DriverManagerDataSource();
		driverMgrDataSource.setDriverClassName("org.h2.Driver");
		driverMgrDataSource.setUrl("jdbc:h2:tcp://localhost/~/flower");
		driverMgrDataSource.setUsername("sa");
		driverMgrDataSource.setPassword("");
		return driverMgrDataSource;

	}
*/
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory() {
		Properties hibernateProperties = new Properties();
		hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
		hibernateProperties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		hibernateProperties.put("hibernate.show_sql",true);

		LocalSessionFactoryBuilder localSessionFacBuilder = new LocalSessionFactoryBuilder(getH2DataSource());
		localSessionFacBuilder.addProperties(hibernateProperties);
		localSessionFacBuilder.addAnnotatedClass(Category.class);
		localSessionFacBuilder.addAnnotatedClass(Product.class);
		localSessionFacBuilder.addAnnotatedClass(Supplier.class);
		localSessionFacBuilder.addAnnotatedClass(Cart.class);
		
		localSessionFacBuilder.addAnnotatedClass(Orders.class);
		localSessionFacBuilder.addAnnotatedClass(User.class);
		//localSessionFacBuilder.scanPackages("");
		SessionFactory sessionFactory = localSessionFacBuilder.buildSessionFactory();
		System.out.println("Session Factory Object Created");
		System.out.println(sessionFactory);
		return sessionFactory;
	}

	@Bean(name="hibernatetransactionmanager")
	public HibernateTransactionManager getHibernateTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager hibernateTranMgr = new HibernateTransactionManager(sessionFactory);
		return hibernateTranMgr;
	}
/*	@Autowired
	@Bean(name="ordersDaoImpl")
	public OrdersDaoImpl getOrdersData(SessionFactory sessionFac)
	{
		return new OrdersDaoImpl(sessionFac);
	}*/
	
	
}
