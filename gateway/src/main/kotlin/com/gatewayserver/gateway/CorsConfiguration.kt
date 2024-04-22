package com.gatewayserver.gateway

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.http.HttpMethod
import org.springframework.http.HttpStatus
import org.springframework.web.cors.reactive.CorsUtils
import org.springframework.web.server.ServerWebExchange
import org.springframework.web.server.WebFilter
import org.springframework.web.server.WebFilterChain
import reactor.core.publisher.Mono

@Configuration
class CorsConfiguration {
    companion object {
        private const val ALLOWED_HEADERS =
            "X-Requested-With, Content-Type, Authorization, Origin, Accept, Access-Control-Request-Method, Access-Control-Request-Headers, Access-Control-Allow-Credentials" // "x-requested-with, authorization, Content-Type, Content-Length, Authorization, credential, X-XSRF-TOKEN";
        private const val ALLOWED_METHODS = "GET, PUT, POST, DELETE, OPTIONS, PATCH"
        private const val ALLOWED_ORIGIN = "*"
        private const val MAX_AGE = "7200" //2 hours (2 * 60 * 60)
    }

    @Bean
    fun corsFilter(): WebFilter {
        return WebFilter { ctx: ServerWebExchange, chain: WebFilterChain ->
            val request = ctx.request
            if (CorsUtils.isCorsRequest(request)) {
                val response = ctx.response
                val headers = response.headers
                headers.add("Access-Control-Allow-Origin", ALLOWED_ORIGIN)
                headers.add("Access-Control-Allow-Methods", ALLOWED_METHODS)
                headers.add(
                    "Access-Control-Max-Age",
                    MAX_AGE
                ) //OPTION how long the results of a preflight request (that is the information contained in the Access-Control-Allow-Methods and Access-Control-Allow-Headers headers) can be cached.
                headers.add("Access-Control-Allow-Headers", ALLOWED_HEADERS)
                headers.add("Access-Control-Allow-Credentials", "true")
                if (request.method === HttpMethod.OPTIONS) {
                    response.statusCode = HttpStatus.OK
                    return@WebFilter Mono.empty<Void?>()
                }
            }
            chain.filter(ctx)
        }
    }

}