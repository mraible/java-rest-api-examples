# -c is concurrent clients
# -n is the number of requests to run in the test
# -k is keep alive i.e., perform multiple requests within one HTTP session
# ulimit -n 10000
ab -H Authorization:"Bearer $TOKEN" -c 5000 -k -n 10000 $URL/hello

# Gitpod: 4 cores, 8 GB RAM

# http $URL/hello Authorization:"Bearer $TOKEN"

# ==========================================
# Imperative Results
# ==========================================
# Micronaut: 2 failed, 106.22 requests per second, 9.414 [ms] time per request
# Quarkus: 2 failed, 104.09 rps, 9.607 tpr
# Spring Boot: 0 failed, 101.21 rps, 9.880 tpr
# Helidon: Total of 7725 requests completed

# ==========================================
# Reactive Results
# ==========================================
# Micronaut: Total of 2145 requests completed
# Quarkus: Total of 6015 requests completed
# Spring Boot: Total of 9173 requests completed
# Helidon: 0 failed, 106.07 rps, 9.427 [ms] time per request
