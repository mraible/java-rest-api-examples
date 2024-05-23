# -c is concurrent clients
# -n is the number of requests to run in the test
# -k is keep alive i.e., perform multiple requests within one HTTP session
# -s is timeout (default is 30 seconds)
ulimit -n 10000
ab -H Authorization:"Bearer $TOKEN" -c 1000 -k -n 5000 -s 120 $URL/hello

# Gitpod Standard: 4 cores, 8 GB RAM

# http $URL/hello Authorization:"Bearer $TOKEN"

# ==========================================
# Imperative Results
# ==========================================
# Micronaut: 66.28 requests per second, 15.087 [ms] time per request, 75.435 [s] time for tests
# Quarkus: 126.93 rps, 7.879 tpr, 39.393
# Spring Boot: 125.4 rps, 7.972 tpr, 39.860
# Helidon: 367.95 rps, 2.718 tpr, 13.589

# ==========================================
# Reactive Results
# ==========================================
# Micronaut: 69.10 rps, 14.471 tpr, 72.354
# Quarkus: 218.88, 4.569, 22.843
# Spring Boot: 69.02, 14.488, 72.442
# Helidon: 70.29, 14.226, 71.131
