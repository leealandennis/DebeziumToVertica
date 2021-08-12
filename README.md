# Getting Started

## Starting services

Simple as `docker-compose up`

## Deploying Source Connector

1. Open a new terminal window
2. `docker exec -it connect hostname -I` --> this will give you the ip address of the connect service through docker
2. Make sure service is started with the command `curl http://{IP FROM PREVIOUS STEP}:8083`
3. `curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://{IP FROM PREVIOUS STEP}:8083/connectors/ -d @source.json`

## Deploying Sink Connector
1. `curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://{IP FROM PREVIOUS STEP}:8083/connectors/ -d @sink.json`

# Testing

You can now make changes to mysql and they should all show up in vertica. Couple things to note:

1. Schema changes will apply to vertica if made in mysql, but only once a record is added/updated in mysql
2. When updated a record in mysql a NEW record will be added to vertica but this is expected. Vertica should 
very rarely update values. The proper solution in vertica to this problem is to use topk tables.
