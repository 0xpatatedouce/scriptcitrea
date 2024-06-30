Citrea is an innovative layer 2 solution for Bitcoin, leveraging zk-proofs to enable fast, secure, and private transactions. By utilizing a zkEVM (Zero-Knowledge Ethereum Virtual Machine) of type 2, Citrea enhances Bitcoin's capabilities with scalable smart contracts. The network, currently in its testnet phase, combines the robust security of Bitcoin with the efficiency of zk-rollups. This allows for high transaction throughput, confidentiality, and seamless interoperability with other blockchains, aiming to bring scalable and secure decentralized applications to the Bitcoin ecosystem.





```bash
cd $HOME && curl -o citrea.sh https://raw.githubusercontent.com/0xpatatedouce/scriptcitrea/main/citrea.sh && bash citrea.sh
```

```
cd citrea && screen -S citrea  
```

```
./target/release/citrea --da-layer bitcoin --rollup-config-path configs/devnet/rollup_config.toml --genesis-paths configs/devnet/genesis-files
```

```
screen -x citrea
```