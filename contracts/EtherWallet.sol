// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract EtherWallet {
    // Anyone will be able to send eth to this contract but only the owner will be able to send it out of this contract
    address payable public immutable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function withdraw(uint _amount) external onlyOwner {
        // To save gas we can replace state variables with variables inside memory
        // owner.transfer(_amount); replaced with msg.sender
        payable(msg.sender).transfer(_amount);
        // (bool success, ) = _amount.call{value: _amount}("");
        // require(success, "Transaction failed");
    }

    function getBalance() external view returns(uint) {
        return(address(this).balance);
    }
}