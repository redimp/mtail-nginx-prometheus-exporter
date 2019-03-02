# mtail-nginx-prometheus-exporter

nginx metrics exporter for prometheus using [mtail](https://github.com/google/mtail).


## nginx configuration

Define the log format for nginx in e.g. `/etc/nginx/conf.g/mtail.conf`:

```
log_format mtail '$server_name $remote_addr - $remote_user [$time_local] '
                 '"$request" $status $bytes_sent $request_time'
                 '"$http_referer" "$http_user_agent" "$content_type"';
```

In the `server {` block add e.g.

```
access_log /var/log/nginx/access_mtail.log mtail;
```

Make sure the path matches the command in the `docker-compose.yml`.

## run

```
docker-compose up -d
```

You can test it with e.g.
```
curl --silent localhost:3093/metrics | grep http
```

## configure prometheus

```
  - job_name: nginx-exporter
    static_configs:
      - targets: ['localhost:3093']
```
