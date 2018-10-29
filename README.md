# Decentralized Star Notary Dapp

Notarizing ownership of digital assets by implementing a Star notary smart contarct and utilizing the concept of non-fungible tokens (ERC721)

![Demo](https://i.imgur.com/s786MV6.gif)

## Project Overview
The goal is to allow users to notarize star ownership using their blockchain identity (Metamask wallet). Below are the steps taken to develop this Dapp:

| - | Description |
| ------- | ----------- |
| [Part 1](#usage) | implementing StarNotary smart contract with functions to support proof of existence (i.e. notarization) |
| Part 2 | Testing smart contracts code coverage |
| Part 3 | Deploying smart contracts on a public test network (Rinkeby) |
| Part 4 | interacting with StarNotar smart contract |

### Installation
Ensure that you have installed npm with version 5.0+ on your system.

Install global dependencies
```bash
$ npm install -g ganache-cli truffle
$ npm install -g http-server
```

Then install package dependecies
```bash
$ npm install 
```
### Usage
After installing run [Ganache](https://github.com/trufflesuite/ganache-cli) CLI for testing and development
```bash
$ ganache-cli
```

 run [http-server](https://www.npmjs.com/package/http-server) in terminal:
```bash
$ http-server
```

Make sure you have Metamask working in browser then navigate to http://localhost:8080 for interacting with the contract.


