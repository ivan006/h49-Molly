server {
listen 80;
root /var/www/html/dusk.outreach-hangar49.com;
index index.html index.htm index.nginx-debian.html index.php;
server_name dusk.outreach-hangar49.com;

location ~ \.php$ {
fastcgi_split_path_info ^(.+\.php)(/.+)$;
fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
fastcgi_index index.php;
include fastcgi_params;
fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
fastcgi_intercept_errors off;
fastcgi_buffer_size 16k;
fastcgi_buffers 4 16k;
fastcgi_connect_timeout 600;
fastcgi_send_timeout 600;
fastcgi_read_timeout 600;
}

location / {
try_files $uri $uri/ =404;
}
}
