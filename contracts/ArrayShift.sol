// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayShift {
    uint256[] public array;

    function example() public {
        array = [1, 2, 3];
        delete array[1]; // [1, 0, 3]
        /**Deleting an elt from an array doesnt actually remove the element, it just resets it to its default value */
    }

    // Remove an element from the array and shrink its length by shifting
    // [1, 2, 3] -- remove(1) -> [1, 3, 3] --> [1,3]
    // Shift all elts to the left then pop the last element
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    /* we copied elts from right to left - starting at the element one right to the one that we want 
        to remove and after we're done copying each elt we remove the last elt */

    // edge case - [1] -- remove(0) --> [1] --> []

    function remove(uint256 _index) public {
        require(_index < array.length, "index out of bound"); // check index < array length

        // copy elts from right to left starting from the index to remove
        for (uint256 i = _index; i <= array.length - 1; i++) {
            array[i] = array[i + 1];
        } // we'll have an array that has elts from right shifted to left starting form the index position of the elt to be removed

        array.pop();
    }

    /**When fn test() is called the array is initialized [The scope of this array is not local to this fn cause its declaration is done outside the fn so 
    its a state variable] */
    function test() external {
        array = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        /**Since the remove fn is public we can access it from inside other fns in the smart contract 
                   - external - to access the fn once contract is deployed
                   - public - to access the fn from other fns etc in the smart contract */
        assert(array[0] == 1);
        assert(array[1] == 2);
        assert(array[1] == 4);
        assert(array[3] == 5);
        assert(array.length == 4);

        array = [1];
        remove(0);
        // []
        assert(array.length == 0);
    }
}
