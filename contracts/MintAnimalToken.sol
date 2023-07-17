// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol"; 
//NFT를 정의할 때 필요(interface의 정의 -> erc721)

contract MintAinmalToken is ERC721Enumerable{
    constructor() ERC721("h662Animals", "HAS") {}

    mapping (uint256 => uint256) public animalTypes; // front uint256 = animalTokenID, back uint256 = animalTypes


    function mintAnimalToken() public {
        uint256 animalTokenId = totalSupply() + 1; //랜덤 생성

        uint256 animalType = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, animalTokenId))) % 5 + 1;
        // 랜덤 생성한 id값이

        animalTypes[animalTokenId] = animalType;
        //animalTypes로 들어감감

        _mint(msg.sender, animalTokenId); //msg.sender - > 메세지를 실행한 사람 , animalTokenId -> 유일 값 , NFT 증명 값
        
    }
}