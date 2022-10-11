#!/bin/bash

# # Azure App Service setup
# #laravel
# fix .env file
# run php artisan key:generate
# run php artisan migrate

# #nginx
# fix /etc/nginx/sites-available/default 
# run service nginx reload
# ensure .htaccess file is in root of webapp

# <IfModule mod_rewrite.c>
#     RewriteEngine on
#     RewriteBase /
#     RewriteRule ^(.*)$ /public/$1 [NC,L,QSA]
# </IfModule>


## make sure you've copied the default file from the nginx site-enabled and edited the root directory to /home/site/wwwroot/public 
# copy editied default file to nginx sites available dir
cp /home/site/default /etc/nginx/sites-available/default
# restart nginx
service nginx reload

# create .env file in wwwroot from .env.example file
cd /home/site/wwwroot && cp -n .env.example .env 
# generate key
php artisan key:generate