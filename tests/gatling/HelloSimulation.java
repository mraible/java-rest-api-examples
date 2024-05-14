package com.okta.developer;

import static io.gatling.javaapi.core.CoreDsl.*;
import static io.gatling.javaapi.http.HttpDsl.*;

import io.gatling.javaapi.core.*;
import io.gatling.javaapi.http.*;

public class HelloSimulation extends Simulation {

    String TOKEN = System.getenv().get("TOKEN");
    String URL = System.getenv().get("URL");

    HttpProtocolBuilder httpProtocol =
        http.baseUrl(URL)
            .authorizationHeader("Bearer " + TOKEN)
            .acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
            .acceptLanguageHeader("en-US,en;q=0.5")
            .acceptEncodingHeader("gzip, deflate")
            .userAgentHeader(
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/119.0"
            );

    ScenarioBuilder scn = scenario("Test URL scenario").exec(
        http("Hello").get("/hello")
    );

    {
        setUp(
            scn.injectOpen(rampUsersPerSec(10).to(200).during(120))
        ).assertions(
            global().successfulRequests().percent().gt(90.0)
        ).protocols(httpProtocol);
    }
}
