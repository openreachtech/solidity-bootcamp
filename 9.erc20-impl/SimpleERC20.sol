// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.1/contracts/token/ERC20/ERC20.sol";

contract SimpleERC20 is ERC20 {
    // オーナーを保持する変数
    address public owner;
    
    string private constant tokenName = "SimpleERC20";
    string private constant tokenSymbol = "STK";

    // オーナーであるかの事前チャックを行う
    modifier onlyOwner {
        require(msg.sender == owner, "only owner can call");
        _;
    }

    constructor() ERC20(tokenName, tokenSymbol) {
        owner = msg.sender;
        _mint(msg.sender, 1_000 * 10**18);

    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
