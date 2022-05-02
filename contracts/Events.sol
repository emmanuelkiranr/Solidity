// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Events {
    // Events allows us to write data to the blockchain - these data cannot be later retrieved by the smart contract
    /** purpose of events is to log that something happened - so use for those cases where we use a 
    state variable to write data to blockchain and then we dont retrieve it 
     event <name of event>*/

    event Log(string msg, uint256 val);

    /**To search for a particular event by the parameter that was logged then we use the keyword index */
    event IndexedLog(address indexed sender, uint256 val);

    // To log this event to the blockchain

    function logEvent() external {
        /**This is a transactional fn since we are logging data to blockchain  */
        /**emit <event name to log> */
        emit Log("Hello World", 123);

        // logging indexed log
        emit IndexedLog(msg.sender, 123);
        /**say x calls this fn 10 times then msg.sender will be alice and bob 20 times then msg.sender will be
        bob. Since we have the keyword indexed in the address parameter, so instead of searching all logs for
        IndexedLog and then filtering out for alice using web3 we'll be able to find all of the logs in IndexedLog
        that was emitted by alice.
        So indexed helps us to quickly search for logs by the parameters. And only upto 3 parameters can be indexed
        in an event */
    }

    event Message(address indexed _from, address indexed _to, string msg);

    function sendMsg(address _to, string calldata _msg) external {
        emit Message(msg.sender, _to, _msg);
    }
    /** This msg is public and anyone can see it, to send a msg we have to pay for the fn each time we send a msg */
}
