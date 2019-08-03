FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

# Workspace
WORKDIR /Users/hienle/Documents/shared

# ADD .jar under target from host
# into this image
ADD target/selenium-docker.jar 			selenium-docker.jar
ADD target/selenium-docker-tests.jar 	selenium-docker-tests.jar
ADD target/libs							libs

# in case of any other dependency like .csv / .json / .xls
# please ADD that as well

# ADD suite files
ADD book-flight-module.xml				book-flight-module.xml
ADD search-module.xml					search-module.xml

# ADD health check script
ADD healthcheck.sh                      healthcheck.sh

# BROWSER
# HUB_HOST
# MODULE

ENTRYPOINT sh healthcheck.sh

#ENTRYPOINT java -cp selenium-docker.jar:selenium-docker-tests:jar:libs/* -DBROWSER=$BROWSER -DHUB_HOST=$HUB_HOST org.testng.TestNG $MODULE

# ADD health check script
#ADD healthcheck.sh                      healthcheck.sh

# BROWSER
# HUB_HOST
# MODULE

#ENTRYPOINT sh healthcheck.sh

# docker run -it --entrypoint=/bin/sh -v /Users/hienle/Documents/shared/test-output:/Users/hienle/Documents/shared/test-output lhien11/selenium-docker
# java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* org.testng.TestNG search-module.xml
# 127.0.0.1
# 192.168.1.3
# 192.168.1.1

# java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* -DHUB_HOST=192.168.1.3 org.testng.TestNG search-module.xml
# docker run -e HUB_HOST=192.168.1.3 -e MODULE=../search-module.xml lhien11/selenium-docker
# docker run -e HUB_HOST=192.168.1.3 -e MODULE=book-flight-module.xml -v /Users/hienle/Documents/shared/test-output:/Users/hienle/Documents/shared/test-output lhien11/selenium-docker
# ~/workspace/seleniumdocker$
#

# jenkin pw
# a0ad5e8efb5049f3984066d0ce851539
# ebfa3394a5d44153a42dfcae57ec6cbe
# 8b9e9d957e184c73939e6ac127bc7de8