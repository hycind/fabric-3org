rm -rf channel-artifacts/
rm -rf crypto-config/

cryptogen generate --config=./crypto-config.yaml

mkdir channel-artifacts

configtxgen -profile OrdererGenesis -outputBlock ./channel-artifacts/genesis.block

configtxgen -profile BanksABChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID aclsbchannel

configtxgen -profile BanksABChannel -outputAnchorPeersUpdate ./channel-artifacts/CLSBankMSPanchors.tx -channelID aclsbchannel -asOrg CLSBankMSP
configtxgen -profile BanksABChannel -outputAnchorPeersUpdate ./channel-artifacts/BankAMSPanchors.tx -channelID aclsbchannel -asOrg BankAMSP
configtxgen -profile BanksABChannel -outputAnchorPeersUpdate ./channel-artifacts/BankBMSPanchors.tx -channelID aclsbchannel -asOrg BankBMSP
