package com.registreserver.registre

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer

@EnableEurekaServer
@SpringBootApplication
class RegistreApplication

fun main(args: Array<String>) {
	runApplication<RegistreApplication>(*args)
}
