// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract GlobalVariables {
    /*Global variables store info such as blockchain txns and the account that
    store the function*/
    function globalVars() external view returns(address, uint, uint) {
        address sender = msg.sender; // Since this stores address its datatype is address
        /* This global variable stores the address that called this fn
        say I call the globalVars fn with my account ie public address of metamask 
        then msg.sender will store that public address*/

        uint timestamp = block.timestamp; // this stores the unix time stamp of when this fn was called
        // datatype of uint timestamp is uint

        uint blockNum = block.number; // this stores the current block number, datatype is uint
        return(sender, timestamp, blockNum);
    }
}