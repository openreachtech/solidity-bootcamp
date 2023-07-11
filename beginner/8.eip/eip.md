# EIPについて

### EIPとは
- EIPとはEthereum Improvement Proposals（イーサリアム改善提案）の略称です。
- イーサリアムの新しい機能やプロセスに関する提案を議論する場
- コミュニティの 「信頼できる情報源」として機能し、標準化された規格が掲示される
  👉 **インターネットにおけるRFCのようなもの**

### EIPのカテゴリ
- Core:       Ethereumの仕組みに対する改善提案でバージョンアップを伴う
- Networking: ネットワークレイヤーに関する改善提案（P2P、Lightクライアント等）
- Interface:  主にEthereumのAPI仕様に関する改善提案
- ERC:        コントラクトの標準規格に関する提案 👉 **これがコントラクト開発に関わってくる！**

### 代表的なERC
- ERC20
  - Ethereum上で動作する仮想通貨を作るための規格
    - この仮想通貨は別名 Fungible Token （代替性トークン）と呼ぶ
      - 後述のNone Fungible Tokenと対比される
  - 代表的なもの
     - UniswapのUNI
     - ChainlinkのLINK
- ERC721(NFT)
  - Ethereum上で動作するNFTを作るための規格
    - NFTとは Non Fungible Token （非代替性トークン）の略称
    - 代替できないトークンとは、つまり「固有の唯一無二なトークン」👉 **証明書やアート作品のようなもの**
    - ビットコインや米ドルのように１枚が同等の価値を持ち代替可能なFungible Tokenと異なり、固有の価値を持つ

### 参考
- [イーサリアム改善提案(EIP)入門](https://ethereum.org/ja/eips/#what-are-eips)
- [EIP Types](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-1.md#eip-types)
