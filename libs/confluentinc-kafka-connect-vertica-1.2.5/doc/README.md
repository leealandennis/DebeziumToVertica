# Installation

I am unable to ship the jar for Vertica with the package. You will need to download this on your own.
You can download them directly from the [HPE Vertica Downloads](https://my.vertica.com/download/vertica/client-drivers/) page.

##

## Development

For development the jar must be installed in the maven repository.

### Locally

```bash
mvn install:install-file -DgroupId=com.hp.vertica -DartifactId=vertica-jdbc -Dversion=7.1.2-0 -Dpackaging=jar -Dfile=
```

# Configuration

## VerticaSinkConnector

The VerticaSinkConnector utilizes the VerticaCopyStream of the JDBC SDK to write data to Vertica.

```properties
name=connector1
tasks.max=1
connector.class=io.confluent.vertica.VerticaSinkConnector

# Set these required values
vertica.password=
vertica.database=
vertica.host=
vertica.username=
```

| Name                      | Description                                                                                                         | Type     | Default      | Valid Values                                                                    | Importance |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|----------|--------------|---------------------------------------------------------------------------------|------------|
| vertica.database          | The database on the Vertica system. This is used to build the JDBC url.                                             | string   |              |                                                                                 | high       |
| vertica.host              | The Vertica host to connect to. This is used to build the JDBC url.                                                 | string   |              |                                                                                 | high       |
| vertica.password          | The password to authenticate to Vertica with.                                                                       | password |              |                                                                                 | high       |
| vertica.username          | The username to authenticate to Vertica with.                                                                       | string   |              |                                                                                 | high       |
| stream.builder.cache.ms   | The amount of time in milliseconds to cache the stream builder objects that are used to define the table structure. | int      | 300000       | [1000,...,2147483647]                                                           | high       |
| vertica.buffer.size.bytes | The buffer for the input stream that is used by the Vertica Copy Stream.                                            | int      | 1048576      |                                                                                 | high       |
| vertica.timeout.ms        | The timeout for completing the write to Vertica.                                                                    | int      | 60000        | [10000,...,2147483647]                                                          | high       |
| vertica.compression       | The type of compression for the data load.                                                                          | string   | UNCOMPRESSED | ValidEnum{enum=VerticaCompressionType, allowed=[UNCOMPRESSED, BZIP, GZIP, LZO]} | medium     |
| vertica.load.method       | The method for loading data.                                                                                        | string   | AUTO         | ValidEnum{enum=VerticaLoadMethod, allowed=[AUTO, DIRECT, TRICKLE]}              | medium     |
| vertica.port              | The Vertica port to connect to. This is used to build the JDBC url.                                                 | int      | 5433         | ValidPort{start=1025, end=65535}                                                | medium     |
| expected.records          | The expected number of records the connector will process each time.                                                | int      | 10000        |                                                                                 | low        |
| expected.topics           | The expected number of topics the connector will process in a poll.                                                 | int      | 500          |                                                                                 | low        |
