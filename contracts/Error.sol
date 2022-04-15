// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

/* when we call a fn in a contract there are 3 ways to throw an error require, revert, assert. 
When an error is thrown inside a transaction the gas is refunded, state variables which are 
updated, will are reverted
In solidity 0.8 we can use custom error to save gas*/
contract Error {
    function testRequire(uint256 _i) public pure {
        /* Require is used to validate input and access control - controlling who gets to call the
        fn. */
        // we require input i to be less than or equal to 10.
        require(_i <= 10, "i > 10"); // input validation; checks condition, if false throws error msg.
        // require(cond, "if not print this")
        // more code if cond passes
    }

    function testRevert(uint256 _i) public pure {
        if (_i > 10) {
            revert("i > 10");
        }
        /**revert is better option if your condition to check is nested in a lot of if statements
        if (_i > 1) {
            // code
            if(_i > 2) {
                // more code
                if (_i > 10) {
                revert("i > 10"); 
                }
            }
        }*/
    }

    /* assert is used to check for conditions that should always be true. If condition evaluates to false then it means there might be
        a bug in the smart contract */

    uint256 public num = 123;

    function testAssert() public view {
        assert(num == 123); // if not then there is a bug in contract
    }

    function foo() public {
        // accidently update num
        num = 456;
    } // now if we call testAssert() after foo() then assert will no longer be true

    function foo(uint256 _i) public {
        num += 1;
        require(_i < 10);
    }

    /* If I pass 13 then the state variable will be updated and since 13 > 10 the check fails; so whatever update was made to the state variable
    will be undone */

    // custom error is cheaper than to use require with some error msg - longer the error msg the more gas it uses
    // right now it can only be used with revert so transform the below require code to revert custom error
    // declaring custom error - error <name of custom error>
    // error MyError();
    // inside the custom error we can log data
    error MyError(address caller, uint256 i); // we log the caller of the function and the input that was passed in

    // My_Error(msg.sender, _i) since msg.sender is not a local but a global variable so change the function to view type

    // function customError(uint _i) public pure {
    //     require(_i <= 10, "i > 10");
    // }
    function customError(uint256 _i) public view {
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }
}
