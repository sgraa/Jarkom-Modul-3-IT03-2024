
service nginx start

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

mkdir /etc/nginx/supersecret
htpasswd -c -b /etc/nginx/supersecret/.htpasswd secmart kcksit03


echo '
    upstream worker { # (ip_hash, least_conn, hash $request_uri consistent)
    #hash $request_uri consistent;
    #least_conn;
    #ip_hash;
    server 10.65.1.2;
    server 10.65.1.3;
    server 10.65.1.4;
}

 server {
        listen 80;
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                allow 10.65.1.37;
                allow 10.65.1.67;
                allow 10.65.2.203;
                allow 10.65.2.207;
                deny all;
                proxy_pass http://worker;
                auth_basic "Restricted Access";
                auth_basic_user_file /etc/nginx/supersecret/.htpasswd;
        }

        location /dune {
                proxy_pass https://www.dunemovie.com.au/;
                proxy_set_header Host www.dunemovie.com.au;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
        }
} ' > /etc/nginx/sites-available/lb_php

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

#echo 'upstream pekerja { #(round-robin(default), ip_hash, least_conn, hash $request_uri consistent)
#    least_conn;
#    server 10.65.2.2:8001;
#    server 10.65.2.3:8002;
#    server 10.65.2.4:8003;
#}

#server {
#    listen 80;
#    server_name atreides.it03.com;

#    location / {
#        proxy_pass http://pekerja;
#    }
#}
#' > /etc/nginx/sites-available/laravel-fff

#ln -s /etc/nginx/sites-available/laravel-fff /etc/nginx/sites-enabled/

service nginx restart