
# GUIDE POUR EXÉCUTER LE FULLNODE CITREA :


# Introduction à citrea :

Citrea est une solution innovante de couche 2 pour Bitcoin, tirant parti des zk-proofs pour permettre des transactions rapides, sécurisées et privées. En utilisant un zkEVM (Zero-Knowledge Ethereum Virtual Machine) de type 2, Citrea améliore les capacités de Bitcoin avec des contrats intelligents évolutifs. Le réseau, actuellement dans sa phase de développement, combine la sécurité robuste du Bitcoin avec l’efficacité des zk-rollups. Cela permet un débit de transaction élevé, la confidentialité et une interopérabilité transparente avec d’autres blockchains, Le but est d’apporter des applications décentralisées, sécurisées et évolutives à l’écosystème Bitcoin. 

La documentation officielle: https://docs.citrea.xyz/technical-specs/introduction

![GQI72jfakAA5w2B](https://github.com/0xpatatedouce/scriptcitrea/assets/123324096/217689b0-a6a9-4790-8794-e97865778def)

# Installer et exécuter le nœud :

## Vérifier les exigences matérielles :

Vous aurez besoin d'un système exploitation Linux/Mac/Windows avec une configuration de

- **8 Go de RAM 
- **SSD 256 Go (NVMe recommandé) 
- **CPU 4 cœurs 
- **25+ Mbps de connexion réseau 

Voici les exigences minimales pour exécuter un nœud Citrea.

Personnellement utilise Ubuntu 22.04.

## Maintenant, installez la configuration configurable et exécutez le nœud avec mon script :
```bash
cd $HOME && curl -o citrea.sh https://raw.githubusercontent.com/0xpatatedouce/scriptcitrea/main/citrea.sh && bash citrea.sh
```

## Changez de répertoire pour le répertoire citrea et ouvrez un nouvel écran :
```
cd citrea && screen -S citrea  
```

## Vous pouvez maintenant exécuter le nœud :
```
./target/release/citrea --da-layer bitcoin --rollup-config-path configs/devnet/rollup_config.toml --genesis-paths configs/devnet/genesis-files
```

<img width="1248" alt="Capture d’écran 2024-06-30 à 11 29 37" src="https://github.com/0xpatatedouce/scriptcitrea/assets/123324096/6f0953a6-8324-4f02-a2a2-0945ec0cec32">

## Si vous voulez retourner dans votre écran, utilisez la commande suivante :
```
screen -x citrea
```

Vous pouvez utiliser Crtl + c pour arrêter le nœud 



