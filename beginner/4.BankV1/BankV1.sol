// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Bank
 * @dev 引出しできるようETHを入金＆なバンクコントラクト
 *      - 入力値のバリデーション（require）
 *      - グローバル変数（msg.value, msg.sender）
 *      - プレコンパイル関数（transfer）
 */
contract BankV1 {
    uint256 public balance;

    /**
     * @dev ETHを入金
     */
    function deposit() public payable {
        uint256 amount = msg.value;
        balance += amount;
    }

    /**
     * @dev ETHを引出す
     */
    function withdraw(uint256 amount) public {
        require(amount <= balance, "too much withdrawal");
        balance -= amount;

        address payable receiver = payable(msg.sender);
        receiver.transfer(amount);
    }
}
