
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

I use a Ubuntu 22.04.  

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

If you encounter any issue you can send me a DM on my tweeter or you can go on the Citrea discord :

https://x.com/0xpatatedouce

https://discord.com/invite/citrea

Thanks you to have used and read my guide!
