// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// OpenZeppelinのERC20コントラクト
import "github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.1/contracts/token/ERC20/ERC20.sol";

/**
 * @title SimpleERC20
 * @dev ERC20トークン
 */
contract SimpleToken is ERC20 {
    // オーナーを保持する変数
    address public owner;
    
    // トークン名とシンボルを定義
    string private constant tokenName = "Simple Token";
    string private constant tokenSymbol = "STK";

    // オーナーであるかの事前チャックを行う
    modifier onlyOwner {
        require(msg.sender == owner, "only owner can call");
        _;
    }

    // トークン名とシンボルをデプロイ時に指定
    constructor() ERC20(tokenName, tokenSymbol) {
        owner = msg.sender;
        // deployerに千枚のトークンを発行する
        _mint(owner, 1_000 * 10**18);
    }

    /**
     * @dev トークンを発行する関数
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
