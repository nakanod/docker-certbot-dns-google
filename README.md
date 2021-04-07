# Before using

1. This requires docker and docker-compose, install them and run docker daemon.
2. Create a GCP service account that has edit permission to Google Cloud DNS, and generate its credentials file.

# Setup

Pull the container image, create an environment file as `.env` , and put the credentials file as `google-credentials-file` .

```sh
cd docker-certbot-dns-google/
docker-compose pull

cat > .env << _EOF_
USERID=$(id -u)
GROUPID=$(id -g)
_EOF_

cp -p /path/to/your/google/credentials/file ./google-credentials-file
```

# Run

This is an example of obtaining a wildcard certificate.
Cerfiticates and a private key are created in `config` directory if it was successfully.

```sh
docker-compose run --rm certbot-dns-google certbot certonly -m admin@example.com -d "*.example.com,example.com"
```
