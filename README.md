# Nginx Web Server
1) nginx to service website content
2) php-fpm to load php content
3) memcached to load cached for dynamic and static content

# Sample output of services running in container:
## ++
> root@dockerserverdemo:~/docker_images# docker ps
CONTAINER ID   IMAGE                                 COMMAND                  CREATED          STATUS                    PORTS                                   NAMES
3acb97874154   sudhams483/nginx_php_memcache:20.04   "/bin/sh -c ./root/s…"   29 minutes ago   Up 29 minutes (healthy)   0.0.0.0:8097->80/tcp, :::8097->80/tcp   nginx-php
> root@dockerserverdemo:~/docker_images# docker exec -ti nginx-php bash
> root@3acb97874154:/# ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0   2608   548 ?        Ss   14:42   0:00 /bin/sh -c ./root/start_services.sh
root           7  0.0  0.0   3976  3040 ?        S    14:42   0:00 /bin/bash ./root/start_services.sh
root           8  0.0  0.0   3976  1964 ?        S    14:42   0:00 /bin/bash ./root/start_services.sh
root          16  0.0  0.1 193256  6704 ?        Ss   14:42   0:00 php-fpm: master process (/etc/php/7.4/fpm/php-fpm.conf)
root          17  0.0  0.2  55280 11732 ?        S    14:42   0:00 nginx: master process nginx -g daemon off;
www-data      18  0.0  0.2 193256 11164 ?        S    14:42   0:00 php-fpm: pool www
www-data      19  0.0  0.2 193256 11244 ?        S    14:42   0:00 php-fpm: pool www
www-data      20  0.0  0.1  55924  5136 ?        S    14:42   0:00 nginx: worker process
root         490  0.3  0.0   4244  3348 pts/0    Ss   15:11   0:00 bash
root         498  0.0  0.0   5896  2908 pts/0    R+   15:11   0:00 ps aux
> root@3acb97874154:/#
## ++

### References: https://docs.docker.com/config/containers/multi-service_container/
