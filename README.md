# Before using

1. This requires docker and docker-compose, install them and run docker daemon.
2. Create GCP service account and credentials file that have edit permission to Google DNS.

# Setup

Pull the container image, Create an environment file as `.env` and put the credentials file as `google-credentials-file` .

```sh
cd docker-certbot-dns-google/
docker-compose pull

cat > .env << _EOF_
USERID=$(id -u)
GROUPID=$(id -g)
_EOF_

cp -p /path/to/google/credentials/file ./google-credentials-file
```

# Run

Obtain a wildcard certificate example.
Files are created in `config` directory if command was successfully.

```sh
docker-compose run --rm certbot-dns-google certbot certonly -m admin@example.com -d "*.example.com,example.com"
```
