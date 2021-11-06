### [doc](https://blog.pavelsklenar.com/how-to-create-pkcs-12-for-your-application/)

#### Create your own self-signed SSL certificate
```
openssl req -x509 -newkey rsa:4096 -keyout myPrivateKey.pem -out myCertificate.crt -days 3650 -nodes
openssl pkcs12 -export -out IdentityCenter.p12 -inkey myPrivateKey.pem -in myCertificate.crt
```

#### Create a certificate using the Certificate Signing Request
```
openssl req -new -newkey rsa:4096 -keyout myPrivateKey.pem -out request.csr -nodes
openssl req -new -key myPrivateKey.pem -out request.csr
openssl pkcs12 -export -out keyStore.p12 -inkey privateKey.pem -in certificate.crt -certfile CA.crt
```

### [doc](https://slproweb.com/products/Win32OpenSSL.html)
```
openssl pkcs12 -in chester.pfx -nocerts -nodes -out private_pc.key
从密钥对中提取私钥(头部格式：-----BEGIN RSA PUBLIC KEY-----）
openssl rsa -in  private_pc.key -out private.pem
从密钥对提取公钥(头部格式：-----BEGIN PUBLIC KEY-----）
openssl rsa -in private_pc.key -pubout -out public.key
```