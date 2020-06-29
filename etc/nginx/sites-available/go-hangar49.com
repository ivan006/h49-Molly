server {
  listen 80;
  listen [::]:80;
  server_name go-hangar49.com;

  root /var/www/html/go-hangar49.com/;

  location ~ /.well-known/acme-challenge {
    allow all;
  }
}
