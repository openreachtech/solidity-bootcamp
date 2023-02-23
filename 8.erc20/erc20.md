# ERC20について

## 代表的なインターフェース
#### name: Token名を返す
```solidity
function name() public view returns (string)
```

#### symbol: Tokenのシンボルを返す
```solidity
function symbol() public view returns (string)
```

#### balanceOf: トークンの保有数を返す
```solidity
function balanceOf(address _owner) public view returns (uint256 balance)
```

#### transfer: 自分のトークンを移転する
```solidity
function transfer(address _to, uint256 _value) public returns (bool success)
```

#### transferFrom: 他人のトークンを移転する
```solidity
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
```

#### approve: 他人に自分のトークンの移転権限を与える
```solidity
function approve(address _spender, uint256 _value) public returns (bool success)
```

## ライブラリ
- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)という信頼性の高いデファクトスタンダート的なライブラリを使います
  - 👉 コントラクトは全世界に公開されるためハッキングの対象になりやすいです。なので、信頼のおけるライブラリを使うのが鉄則です
  - 実際のコードを読解
    - [/contracts/token/ERC20/ERC20.sol](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.1/contracts/token/ERC20/ERC20.sol)

## 参考
- [ERC-20: Token Standard](https://eips.ethereum.org/EIPS/eip-20)
