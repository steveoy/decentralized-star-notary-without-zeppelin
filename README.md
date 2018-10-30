# Decentralized Star Notary Dapp

Notarizing ownership of digital assets by implementing a Star notary smart contarct and utilizing the concept of non-fungible tokens (ERC721)

![Demo](https://i.imgur.com/s786MV6.gif) 

## Project Overview
The goal is to allow users to notarize star ownership using their blockchain identity (Metamask wallet). Below are the steps taken to develop this Dapp:

| - | Description |
| ------- | ----------- |
| [Step 1](#implementation) | implementing StarNotary smart contract with functions to support proof of existence (i.e. notarization) |
| [Step 2](#testing) | Testing smart contracts code coverage |
| [Step 3](#depolyment) | Deploying smart contracts on a public test network (Rinkeby) |
| [Step 4](#interaction-with-smart-contart) | interacting with StarNotar smart contract |

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

### Implementation
This Smart contract implements the ERC-721 or ERC721Token interface. NFTs are used here to support proof of existence for unique stars and their metadata.
Star uniqueness was acheived based on coordinates; two stars with the same coordinates are not permitted.

#### Star uniqueness
Storing a hash value of star coordinates by concatenating all 3 variables into one bytes variable. After that storing this hash into mapping key
```javascript
bytes memory coordinates = abi.encodePacked(_ra,_dec,_mag);
bytes32 starCoordinateHash = sha256(coordinates);
```

#### Star Lookup
Lookup is done by "the concatenated coordinates" where tokenID value should exist ( tokenID != uint256(0) ) 
```javascript
mapping(bytes32 => uint256) public tokenIdByCoordinates;
```

#### Star tokenID
End-users shouldn't be provided the capability of generating their own star tokenIDs otherwise this might cause an overwriting of existing claimed stars. To resolve this issue, `claimStar()` will generate tokenID based on starCoordinateHash; and since we are maintaining the uniqueness of every star coordinates thus tokenID will be unique too:
```javascript
uint256 starID = uint256(generateStarCoordinatesHash(_ra,_dec,_mag));
```


### Testing
```bash
$ truffle test
```
![Testing](https://i.imgur.com/4jIfzVO.gif)


### Depolyment
Smart contract is deployed on on the Ethereum RINKEBY test network. By utilizing Infura and truffle-hdwallet-provider, a migration script is written and executed:
```bash
$ truffle migrate -f 2 --network rinkeby
```
* __Transaction ID__: 0x31d7948ae1ed66fdf6201ab8c6b9ef159cef35d45c8b66904759fd2f564d99f5
* __Contract address__: 0xa0e2aeb9e94051adefce53fb131d5c5f3fb7da22

You can view Transaction ID and Contract ID from Etherscan blockchain explorer as well as smart contract code deployed on:
_https://rinkeby.etherscan.io/address/0xa0e2aeb9e94051adefce53fb131d5c5f3fb7da22#code_

### Interaction with smart contart
* Claim a new star
__Transaction ID__: [0x746ab7bf7bf689429fb8c642c7ae1d94f7bc11b25628edf7175291ebf9517107](https://rinkeby.etherscan.io/tx/0x746ab7bf7bf689429fb8c642c7ae1d94f7bc11b25628edf7175291ebf9517107)
![Demo](https://i.imgur.com/s786MV6.gif)

* Put star up for sale
__Transaction ID__: [0x78f2ed71223a86046efba37d413ee22a3a6a7e5ab78b73278d35e818f8cff120](https://rinkeby.etherscan.io/tx/0x78f2ed71223a86046efba37d413ee22a3a6a7e5ab78b73278d35e818f8cff120)
![Demo](https://i.imgur.com/3Q8ChbS.gif)

* Lookup a star by ID using `tokenIdToStarInfo()`

![GettingStarInfo](https://i.imgur.com/0fvdrhZ.gif)