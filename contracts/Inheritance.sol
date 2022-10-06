// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract A {
    function foo() public pure virtual returns(string memory) {
        return "A";
    }

    function bar() public pure virtual returns(string memory) {
        return "A";
    }

    function bass() public pure returns(string memory) {
        return "A";
    }
}

contract B is A{
    function foo() public pure virtual override returns(string memory) {
        return "B";
    }

    function bar() public pure virtual override returns(string memory) {
        return "B";
    }
}

contract C is B {
    function foo() public pure override returns(string memory) {
        return "C";
    }

    function bar() public pure override returns(string memory) {
        return "C";
    }
}