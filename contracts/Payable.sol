// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Payable {
    address payable public owner; // This address can send and receive ether

    constructor() {
        owner = payable(msg.sender);
    }
    function deposit() payable external {} // we can send ether to this function

    // Helper fn to get the balance of this contract
    function getBal() external view returns(uint) {
        return (address(this).balance);
    }
}