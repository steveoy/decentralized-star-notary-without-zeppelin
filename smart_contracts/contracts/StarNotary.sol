pragma solidity >=0.4.0 <0.6.0;
import './ERC721Token.sol'; 
import { ConcatHelper } from "./ConcatHelper.sol";
contract StarNotary is ERC721Token {  
    
    struct Star { 
        string name;
        bytes ra;
        bytes dec;
        bytes mag;
        string story;
    } 


    mapping(uint256 => Star) public tokenIdToStarInfo;

    mapping(uint256 => uint256) public starsForSale;

    mapping(bytes => uint256) public tokenIdByCoordinates;


    function IsStarExist(bytes _starCoordinateHash) public returns (uint256){
        return tokenIdByCoordinates[_starCoordinateHash];
    }

    function createStar(string _name, bytes _ra, bytes _dec, bytes _mag, string _story
    , uint256 _tokenId) public { 

        bytes memory coordinates = ConcatHelper.concat(_ra,_dec,_mag);
        bytes starCoordinateHash = sha256(coordinates); 

        require(IsStarExist(starCoordinateHash) == bytes32(0));
        Star memory newStar = Star(_name, _ra, _dec, _mag, _story);

        tokenIdToStarInfo[_tokenId] = newStar;

        ERC721Token.mint(_tokenId);
    }

    function putStarUpForSale(uint256 _tokenId, uint256 _price) public { 
        require(this.ownerOf(_tokenId) == msg.sender);

        starsForSale[_tokenId] = _price;
    }

    function buyStar(uint256 _tokenId) public payable { 
        require(starsForSale[_tokenId] > 0);

        uint256 starCost = starsForSale[_tokenId];
        address starOwner = this.ownerOf(_tokenId);

        require(msg.value >= starCost);

        clearPreviousStarState(_tokenId);

        transferFromHelper(starOwner, msg.sender, _tokenId);

        if(msg.value > starCost) { 
            msg.sender.transfer(msg.value - starCost);
        }

        starOwner.transfer(starCost);
    }

    function clearPreviousStarState(uint256 _tokenId) private {
        //clear approvals 
        tokenToApproved[_tokenId] = address(0);

        //clear being on sale 
        starsForSale[_tokenId] = 0;
    }
}