// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// OpenZeppelinのNFTコントラクト
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.1/contracts/token/ERC721/ERC721.sol";

/**
 * @title SimpleNFT
 * @dev NFT
 */
contract SimpleNFT is ERC721 {
    // オーナーを保持する変数
    address public owner;
    
    // NFT名とシンボルを定義
    string private constant tokenName = "Simple NFT";
    string private constant tokenSymbol = "SNFT";

    // オーナーであるかの事前チャックを行う
    modifier onlyOwner {
        require(msg.sender == owner, "only owner can call");
        _;
    }

    // NFT名とシンボルをデプロイ時に指定
    constructor() ERC721(tokenName, tokenSymbol) {
        owner = msg.sender;
        // deployerにID=1のトークンを発行する
        _mint(owner, 1);
    }

    /**
     * @dev NFTを発行する関数
     */
    function mint(address to, uint256 tokenId) public onlyOwner {
        _mint(to, tokenId);
    }
}
