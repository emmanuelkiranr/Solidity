// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayReplaceLast {
    // [1, 2, 3, 4] -- remove(1) --> [1, 4, 3]
    // [1, 4, 3] -- remove(2) --> [1, 4]
    /** Replace the element you want to remove with the last element and remove the last element. 
    More gas efficient than Array shifting; but here the order of array is not preserved.
    This method doesnt shift array elts. Just requires 2 operations replacing the elt to remove and 
    removing the last elt(so we are not shifting we are shuffling around the array elts) */
    uint256[] public arr;

    function remove(uint256 _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4];
        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}
