mTLS Spring Boot Demo Server
====================

start by creating client and server p12 certs and trust stores by:

```bash
cd ./src/main/resources
bash ./gencrt.sh
```

Note the server cert and trust store are separate files in this example
and we're not using JKS formats.

Run the server:

```bash
./gradlew bootRun
```

Access the server from a client and not the failure due to mTLS not succeeding
due to an `alert bad certificate` error.

```bash
curl -k https://localhost:8443 
```

Now tell cURL to identify itself with a cert from a CA the server trusts:

```bash
curl -k --cert-type P12 --cert src/main/resources/client.p12:changeit https://localhost:8443 
```
