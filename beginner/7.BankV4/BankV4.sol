// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Bank
 * @dev 引出しできるようETHを入金＆なバンクコントラクト
 *      <追加機能>
 *      - 手数料を徴収する
 *    　  - オーナーのみ手数料を引き出せる
 *      <学習内容>
 *      - 事前バリデーション（modifier）
 */
contract BankV4 {
    // 複数人の入金額を保持するMap(depositter address => deposited amount)
    mapping(address => uint256) public balacneMap;

    // オーナーを保持する変数
    address payable public owner;

    // 履歴の型を定義するStruct
    struct History {
        address customer;
        uint256 amount;
        bool    isDeposited;
        uint    timestamp; // block.timestamp
    }

    // 履歴を入れる配列
    History[] public histories;

    // イベントを定義
    event Deposited(address indexed customer, uint256 amount);
    event Withdrawn(address indexed customer, uint256 amount);
    event FeeWithdrawn(uint256 amount);

    // オーナーであるかの事前チャックを行う
    modifier onlyOwner {
        require(msg.sender == owner, "only owner can call");
        _;
    }

    // オーナーをセット
    constructor() {
        owner = payable(msg.sender);
    }

    /**
     * @dev ETHを入金
     */
    function deposit() public payable {
        address customer = msg.sender;
        uint256 amount = msg.value;
        balacneMap[customer] += amount;

        // 履歴を残す
        History memory history = History(
            customer,
            amount,
            true,
            block.timestamp
        );
        histories.push(history);

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

        // 手数料を徴収する
        uint256 fee = amount / 10; // 10%
        uint256 leftAmount = amount - fee;

        address payable receiver = payable(msg.sender);
        receiver.transfer(leftAmount);

        // 履歴を残す
        History memory history = History(
            customer,
            amount,
            false,
            block.timestamp
        );
        histories.push(history);

        // Withdrawのeventを発行
        emit Withdrawn(customer, amount);
    }

    /**
     * @dev 手数料を引き出す
     */
    function withdrawFee(uint256 amount) public onlyOwner {
        require(amount <= address(this).balance, "too much withdrawal");

        owner.transfer(amount);

        emit FeeWithdrawn(amount);
    }
    
}
