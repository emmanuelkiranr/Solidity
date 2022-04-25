// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract IterableMapping {
    /** In array we can get size of array and iterate through each element using for loop; but we 
    cannot do these in mapping; unless we internally keep track of all the keys in the 
    mapping  */
    // Build an iteratable mapping
    mapping(address => uint) public balances; // Mapping that represent balance of an address

    // To keep track of size of mapping and get all elts we need new data
    // we need a mapping that keeps track whether a key is inserted or not, the key for this mapping is address

    /* The inserted mapping uses the address key of balances mapping as its key to store a bool value. */
    mapping(address => bool) public inserted; 
    /**  when we insert new data into the balances mapping, inside the mappping inserted we'll
     set the address that we just inserted into the balances mapping to true
     
     we also need to keep track of all of the keys that we inserted into an array,since the key type is address so 
     we'll create an array of addresses*/

     address[] public keys;

    //  First fn is to set the balance of the mapping balances
    function set(address _key, uint _val) external {
        // first thing is to update the balance mapping

        // balances[msg.sender] = 123;

        balances[_key] = _val;

        // Next keep track of this key and check whether it is newly inserted or not
        /**If newly inserted we'll append to the array of keys - so we'll have an array of keys(addresses) which we can use to get
         all of the values stored in the balances mapping */

        if (!inserted[_key]) { // inserted[_key] != true
                inserted[_key] = true;
                keys.push(_key);
                /** If the _key is not in the inserted mapping, then insert the key to it and push the inserted _key to the 
                key array*/
            }
        }
        /** This fn helps us get the size of the mapping and iterate through all of the keys in the mapping. So we'll be able to 
        get all the values stored in the mapping balances */

    
    function getSize() external view returns (uint size) {
        // Get the size of the balances mapping
         size = keys.length;
    }

    // Get all the value of the balances mapping using for loop

    function first() external view returns(uint){
        // address addr = keys[0];
        // return balances[addr];
        return balances[keys[0]]; 
        /** Keys[0] will return the first address that was inserted [and stored in keys array]. 
        Using it we can get the uint value that was stored in the balances  */
    }

    function last() external view returns (uint) { 
        return balances[keys[keys.length - 1]];
    }

    function value(uint _i) external view returns(uint) {
        return balances[keys[_i]];
    }

}