package com.onmyown.resumeapp.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ApplicationListener implements ServletContextListener{

    private static final Logger log = LoggerFactory.getLogger(ApplicationListener.class);

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        log.info("Application started");

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        log.info("Application destroyed");

    }
}
