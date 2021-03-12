# Setup

create env file and google-credentials

```sh
cd docker-certbot-dns-google/

cat > .env << _EOF_
USERID=$(id -u)
GROUPID=$(id -g)
_EOF_

cp -p /path/to/google/credentials/file ./google-credentials-file
```

# Run

```sh
docker-compose run --rm certbot-dns-google certbot certonly -m admin@example.com -d "*.example.com,example.com"
```
