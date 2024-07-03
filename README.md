
Citrea is an innovative layer 2 solution for Bitcoin, leveraging zk-proofs to enable fast, secure, and private transactions. By utilizing a zkEVM (Zero-Knowledge Ethereum Virtual Machine) of type 2, Citrea enhances Bitcoin's capabilities with scalable smart contracts. The network, currently in its testnet phase, combines the robust security of Bitcoin with the efficiency of zk-rollups. This allows for high transaction throughput, confidentiality, and seamless interoperability with other blockchains, aiming to bring scalable and secure decentralized applications to the Bitcoin ecosystem. 

Check the official doc :https://docs.citrea.xyz/technical-specs/introduction if you want to deep dive. 
![GQI72jfakAA5w2B](https://github.com/0xpatatedouce/scriptcitrea/assets/123324096/217689b0-a6a9-4790-8794-e97865778def)



Check the Hardware Requirements:

A Linux/Mac/Windows system with a configuration of

8 GB Ram 

256 GB SSD (NVMe recommended) 

4 core CPU 

25+ Mbps network connection 

satisfies the minimum requirements to run a Citrea node.

I use Ubuntu 22.04.  

Now install the configurable setup with my script :
```bash
cd $HOME && curl -o citrea.sh https://raw.githubusercontent.com/0xpatatedouce/scriptcitrea/main/citrea.sh && bash citrea.sh
```
Change directory to the citrea directory and open a new screen :
```
cd citrea && screen -S citrea  
```
Now you can run the node
```
./target/release/citrea --da-layer bitcoin --rollup-config-path configs/devnet/rollup_config.toml --genesis-paths configs/devnet/genesis-files
```
<img width="1248" alt="Capture d’écran 2024-06-30 à 11 29 37" src="https://github.com/0xpatatedouce/scriptcitrea/assets/123324096/6f0953a6-8324-4f02-a2a2-0945ec0cec32">

If you want to retrieve your screen use this command:
```
screen -x citrea
```

You can use Crtl + c to stop the node 

Optional : Control your node with Systemd

If systemd is not install:
```
sudo apt-get install systemd -y
```

```
nano /etc/systemd/system/citrea.service
```

```
[Unit]
Description=Citrea Fullnode
After=network-online.target

[Service]
Type=simple
ExecStart=/root/citrea/target/release/citrea --da-layer bitcoin --rollup-config-path /root/citrea/configs/devnet/rollup_config.toml --genesis-paths /root/citrea/configs/devnet/genesis-files
Restart=always
RestartSec=5
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
```
Save and exit (Ctrl + X, then Y, then Enter)


```
systemctl enable citrea.service
```

```
systemctl start citrea.service
```

```
You can verify the status of the service 
```
systemctl status citrea.service
```

```
journalctl -u citrea.service -f
```

Optional : setup your own RPC 

open theses ports: 
```
sudo apt install ufw -y
ufw allow ssh 
ufw allow http 
ufw allow 31244
ufw allow 31245
ufw allow 8080
ufw allow 80
ufw allow 22/tcp
ufw allow 80/tcp
ufw enable
```

now install nginx
```
sudo apt install nginx -y
```

open a file to configure your rpc 
```
sudo nano /etc/nginx/sites-available/citrea-rpc
```

paste this code, just replace the 0.0.0.0 with your address IP
```
server {
    listen 8080;
    server_name 0.0.0.0;

    location / {
        proxy_pass http://localhost:12346;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

Save and exit (Ctrl + X, then Y, then Enter).

Move the file 
```
sudo ln -s /etc/nginx/sites-available/citrea-rpc /etc/nginx/sites-enabled/
```

verify if nginx work well 
```
sudo nginx -t
```

Enable the service 
```
sudo systemctl enable nginx
```

Start the service 
```
sudo systemctl start nginx 
```

You can verify the status of the service 
```
sudo systemctl status nginx
```

You can try this curl command to see if the rpc work, you should have a result like this 
```
Curl -X POST --header "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"citrea_syncStatus","params":[], "id":78}' http://167.86.111.173:80
```

![Capture d’écran 2024-07-02 233535](https://github.com/0xpatatedouce/scriptcitrea/assets/123324096/9487e4af-227c-436c-9368-22fe42c514ce)

![Capture d’écran 2024-07-02 234032](https://github.com/0xpatatedouce/scriptcitrea/assets/123324096/02e11e59-99d9-4017-834e-429e50b27dde)


If you encounter any issue you can send me a DM on my tweeter or you can go on the Citrea discord :

https://x.com/0xpatatedouce

https://discord.com/invite/citrea

Thanks you to have used and read my guide!
