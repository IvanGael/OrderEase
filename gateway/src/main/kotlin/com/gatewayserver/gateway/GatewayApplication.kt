package com.gatewayserver.gateway

/*import org.springdoc.core.GroupedOpenApi
import org.springdoc.core.SwaggerUiConfigParameters*/
import org.springdoc.core.models.GroupedOpenApi
import org.springdoc.core.properties.SwaggerUiConfigParameters
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.client.discovery.EnableDiscoveryClient
import org.springframework.cloud.gateway.route.RouteDefinition
import org.springframework.cloud.gateway.route.RouteDefinitionLocator
import org.springframework.cloud.gateway.route.RouteLocator
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Lazy
import org.springframework.web.reactive.function.server.HandlerFunction
import org.springframework.web.reactive.function.server.RequestPredicates
import org.springframework.web.reactive.function.server.RouterFunction
import org.springframework.web.reactive.function.server.RouterFunctions
import org.springframework.web.reactive.function.server.ServerResponse
import java.net.URI

@EnableDiscoveryClient
@SpringBootApplication
class GatewayApplication

fun main(args: Array<String>) {
	runApplication<GatewayApplication>(*args)
}

@Bean
fun routeLocator(builder: RouteLocatorBuilder): RouteLocator? {
	return builder.routes().build()
}


@Bean
@Lazy(false)
fun apis(swaggerUiConfigParameters: SwaggerUiConfigParameters, locator: RouteDefinitionLocator): List<GroupedOpenApi>? {
	val groups: MutableList<GroupedOpenApi> = ArrayList()
	val definitions = locator.routeDefinitions.collectList().block()!!
	for (definition in definitions) {
		println("id: " + definition.id + "  " + definition.uri.toString())
	}
	definitions.stream().filter { routeDefinition: RouteDefinition ->
		routeDefinition.id.matches(".*-service".toRegex())
	}.forEach { routeDefinition: RouteDefinition ->
		val name = routeDefinition.id.replace("-service", "")
		swaggerUiConfigParameters.addGroup(name)
		groups.add(GroupedOpenApi.builder().pathsToMatch("/$name/**").group(name).build())
	}
	return groups
}

