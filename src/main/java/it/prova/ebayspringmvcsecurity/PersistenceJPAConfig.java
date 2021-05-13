package it.prova.ebayspringmvcsecurity;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = "it.prova.ebayspringmvcsecurity.repository")
public class PersistenceJPAConfig {

}
