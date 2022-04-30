// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SimpleStorage {
    // App that stores a string
    string public text;

    // 24497

    // Input - "Emmanuel"
    // calldata - 44561
    // memory - 45043
    function setText(string calldata _text) external {
        text = _text;
    }

    function getText() external view returns (string memory) {
        return text;
        // 24549
        /** when we call this fn solidity will copy the state variable text into memory and return it as 
        a string loaded onto memory */
    }
}
