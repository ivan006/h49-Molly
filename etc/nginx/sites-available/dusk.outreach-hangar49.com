server {
        listen 80;
        listen [::]:80;

        root /var/www/dusk.outreach-hangar49.com/public;
        index index.html index.htm index.nginx-debian.html;

        server_name dusk.outreach-hangar49.com www.dusk.outreach-hangar49.com;

        location / {
                try_files $uri $uri/ =404;
        }
}
