#
#    Copyright 2016-2020 the original author or authors.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#


FROM openjdk:11.0.5-jdk-slim
MAINTAINER Forest Keepers <Jeroen.knoops@philips.com>

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y \
      git \
      wget \
      curl \
      bash && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean 

RUN addgroup --system java && \
    adduser --system --group java

RUN mkdir /app
RUN chown java:java /app

USER java

WORKDIR /app

#ADD REPO .
#ADD TAGS .

ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport"

COPY target/mybatis-spring-boot-jpetstore-2.0.0-SNAPSHOT.jar /app

ENTRYPOINT ["java","-jar","/app/mybatis-spring-boot-jpetstore-2.0.0-SNAPSHOT.jar"]
