// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**Arrays in solidity can be dynamic or fixed size
- Initialization
- Insert (push), get, update, delete, pop, length 
- Creating array in memory 
- Returning array from fn */
contract Array {
    // Initializing a dynamic[variable size] array as a state variable
    uint256[] public nums = [1, 2, 3];
    // Fixed size arrat
    uint256[5] public numsFixed = [4, 5, 6, 7, 8];

    // Operations
    function examples() external {
        nums.push(4); // Insert 4 to the end of nums array state variable => [1, 2, 3, 4]
        // uint256 x = nums[1];
        // Access array elements with index
        // Update an element in the array
        nums[2] = 777; // [1, 2, 777, 4]
        // delete an element from the array - even after deletion length of the array remains same
        delete nums[1]; // This will delete the element at index 1 and set it to the default value 0 => [1, 0, 777, 4]
        // Pop - to shrink size of array - remove last element from the array
        nums.pop(); // [1, 0, 777]
        // Length of the array
        // uint256 len = nums.length;

        // create array in memory - update or get value
        uint256[] memory arr = new uint256[](5); // array in memory are of fixed size so push an pop operations wont work
        // update
        arr[1] = 123;
    }

    // Function to return an array - not recommended for the same reason as to keep the for loops small, the bigger the array, the more gas it will use [For executing bigger arrays more gas will be consumed and there will not be any left to execute the return array function]
    function returnArray() external view returns (uint256[] memory) {
        // memory tells solidity that we want to copy the state variables nums into memory then return it
        return nums;
    }
}
