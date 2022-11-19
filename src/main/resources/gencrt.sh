keytool -genkeypair -alias server -keyalg RSA -keysize 4096 -validity 365 -dname "CN=Server,OU=Server,O=Examples,L=,S=CA,C=U" -keypass changeit -keystore server.p12 -storeType PKCS12 -storepass changeit

keytool -genkeypair -alias client -keyalg RSA -keysize 4096 -validity 365 -dname "CN=Client,OU=Server,O=Examples,L=,S=CA,C=U" -keypass changeit -keystore client.p12 -storeType PKCS12 -storepass changeit

# export public keys

keytool -exportcert -alias client -file client.cer -keystore client.p12 -storepass changeit

keytool -exportcert -alias server -file server.cer -keystore server.p12 -storepass changeit

# import public keys to trust stores.

keytool -importcert -keystore client-truststore.p12 -alias server-public -file server.cer -storepass changeit -noprompt

keytool -importcert -keystore server-truststore.p12 -alias client-public -file client.cer -storepass changeit -noprompt
