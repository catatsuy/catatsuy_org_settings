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

## nftables

```bash
sudo apt install nftables
sudo systemctl enable --now nftables

sudo nft -c -f /etc/nftables.conf
sudo systemctl restart nftables
sudo nft list ruleset
```

## apt upgrade

```bash
% sudo apt-mark hold nginx
```
