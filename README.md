# catatsuy_org_settings

## Application

  * [catatsuy/catatsuy_org](https://github.com/catatsuy/catatsuy_org)
  * [catatsuy/catatsuy_blog](https://github.com/catatsuy/catatsuy_blog)

## TLS certificate

```sh
sudo systemctl daemon-reload
sudo systemctl enable dehydrated-cron.timer dehydrated-cron-ecdsa.timer nginx-restart.timer
sudo systemctl start dehydrated-cron.timer dehydrated-cron-ecdsa.timer nginx-restart.timer
```
