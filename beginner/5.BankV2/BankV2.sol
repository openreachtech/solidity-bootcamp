// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Bank
 * @dev 引出しできるようETHを入金＆なバンクコントラクト
 *      <追加機能>
 *      - 複数人からの入金をサポート
 *      <学習内容>
 *      - map型
 *      - event
 */
contract BankV2 {
    // 複数人の入金額を保持するMap(depositter address => deposited amount)
    mapping(address => uint256) public balacneMap;

    // イベントを定義
    event Deposited(address indexed customer, uint256 amount);
    event Withdrawn(address indexed customer, uint256 amount);

    /**
     * @dev ETHを入金
     */
    function deposit() public payable {
        address customer = msg.sender;
        uint256 amount = msg.value;
        balacneMap[customer] += amount;

        // Depositのeventを発行
        emit Deposited(customer, amount);
    }

    /**
     * @dev ETHを引出す
     */
    function withdraw(uint256 amount) public {
        address customer = msg.sender;
        require(amount <= balacneMap[customer], "too much withdrawal");
        balacneMap[customer] -= amount;

        address payable receiver = payable(msg.sender);
        receiver.transfer(amount);

        // Withdrawのeventを発行
        emit Withdrawn(customer, amount);
    }
}
