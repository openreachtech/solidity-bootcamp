// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title SimpleStorage
 * @dev 値を格納するできるようなストレージコントラクト
 */
contract SimpleStorage {
    uint256 data;

    /**
     * @dev 初期値をセット
     */
    constructor(uint256 data_) {
        data = data_;
    }

    /**
     * @dev 値を格納（Setter）
     */
    function set(uint256 newData) public {
        data = newData;
    }

    /**
     * @dev 格納した値を取得（Getter）
     */
    function get() public view returns(uint256) {
        return data;
    }
}
