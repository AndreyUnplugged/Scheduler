package com.up.scheduler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;


@Component
public class Task {
    Logger logger = LoggerFactory.getLogger("scheduler");
    @Value("${execute-command}")
    private String execFile;



    @Scheduled(cron = "${cron-expression}")
    public void task() throws IOException {
        Runtime.getRuntime().exec(execFile);
        logger.info("Dump was created");
    }
}
