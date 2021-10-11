// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "hardhat/console.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address Erc20TokenAddress;
    IERC20 Ierc20;

    constructor(address _Erc20TokenAddress) ERC721("CakeToken", "CkT") {
        Erc20TokenAddress = _Erc20TokenAddress;
        Ierc20 = IERC20(_Erc20TokenAddress);
    }

    function createToken(string memory tokenURI) public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(Erc20TokenAddress, true);
        return newItemId;
    }
    
    function TransferCake(address recipient, uint amount) external {
        
       //  transferFrom(msg.sender, recipient, tokenId);
        Ierc20.transferFrom(msg.sender,recipient,amount);
        
    }
}



    

