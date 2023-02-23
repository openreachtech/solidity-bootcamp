# NFTについて

*代表的なインターフェース*
#### name: Token名を返す
```solidity
function name() public view returns (string _name);
```

#### symbol: Tokenのシンボルを返す
```solidity
function symbol() public view returns (string _symbol);
```

#### ownerOf: トークンの保有者を返す
```solidity
function ownerOf(uint256 _tokenId) public view returns (address);
```

#### transfer: トークンを移転する
```solidity
function transferFrom(address _from, address _to, uint256 _tokenId) public payable;
```

#### approve: 他人に自分のトークンの移転権限を与える
```solidity
function approve(address _approved, uint256 _tokenId) public payable;
```

*ライブラリ*
- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)という信頼性の高いデファクトスタンダート的なライブラリを使います
  - 👉 コントラクトは全世界に公開されるためハッキングの対象になりやすいです。なので、信頼のおけるライブラリを使うのが鉄則です
  - 実際のコードを読解
    - [/contracts/token/ERC721/ERC721.sol](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.1/contracts/token/ERC721/ERC721.sol)

*参考*
- [ERC-721: Non-Fungible Token Standard](https://eips.ethereum.org/EIPS/eip-721)
