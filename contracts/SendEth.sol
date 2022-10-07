// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SendEth {
    constructor() payable { // send eth while deploying the contrach

    }

    // receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123); // Reverts if the fn call fails
    }
        // "amount": "123",
		// "gas": "2260"

    function sendViaSend(address payable _to) external payable {
        bool success = _to.send(123);
        require(success, "Send Failed");
    }
        //"amount": "123",
		// "gas": "2260"

    function sendViaCall(address payable _to) external payable {
        // (bool success, string memory bytes) = call{value: 123}("");
        (bool success, ) = _to.call{value: 123}("");
        require(success, "Send Failed");
    }
        //"amount": "123",
		// "gas": "6524"

    function getBalance() external view returns(uint) {
        return(address(this).balance);
    }

}

contract ReceiveEth {

    event Log(uint amount, uint gas);
    receive() external payable {
        emit Log(msg.value, gasleft()); // returns the amount of gas sent
    } // 2300 Gas will be sent for this code execution (for transfer and send) the gasleft will return how much
    // gas is left after this code execution
}