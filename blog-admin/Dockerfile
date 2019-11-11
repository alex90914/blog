FROM java:8-jdk
MAINTAINER alex90914@qq.com

RUN mkdir -pv /app
RUN echo "Asia/Shanghai" > /etc/timezone
ADD target/blog-admin-2.0.1.Beta.jar  /app/blog-admin-2.0.1.Beta.jar
EXPOSE 8085
CMD ["java","-jar","-Xms128m","-Xmx128m","/app/blog-admin-2.0.1.Beta.jar","--spring.profiles.active=test"]


