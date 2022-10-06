// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract X {
    function foo() public pure virtual returns(string memory) {
        return "X";
    }

    function bar() public pure virtual returns(string memory) {
        return "X";
    }

    function x() public pure returns(string memory) {
        return "X";
    }
}

contract Y is X{
    function foo() public pure virtual override returns(string memory) {
        return "Y";
    }

    function bar() public pure virtual override returns(string memory) {
        return "Y";
    }
    function y() public pure returns(string memory) {
        return "Y";
    }
}

contract Z is X, Y { // order is important or else wont compile - most base like to derived
    function foo() public pure override(X, Y) returns(string memory) { // since this is inherited from multiple ctrt
        return "Z";
    }

    function bar() public pure override(Y, X) returns(string memory) { // order don't matter
        return "Z";
    }
}