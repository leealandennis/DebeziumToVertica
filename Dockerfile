FROM debezium/connect:1.6

# Deploy Vertica JDBC Driver
RUN cd /kafka/libs && curl -sO https://www.vertica.com/client_drivers/10.1.x/10.1.1-0/vertica-jdbc-10.1.1-0.jar