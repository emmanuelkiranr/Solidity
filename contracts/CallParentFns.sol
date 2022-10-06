// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract E {
    event Log(string message);
    function foo() public virtual {
        emit Log("E.foo");
    }

    function boo() public virtual {
        emit Log("E.boo");
    }
}

contract F is E {
    function foo() public virtual override { // firstly emits F.foo and calls contract E's foo fn and emits E.foo
        emit Log("F.foo");
        E.foo(); // This calls the function foo in the contract E and emits E.foo as event
    }

    function boo() public virtual override {
        emit Log("F.boo");
        super.boo(); // This calls the function boo in the contract E and emits E.boo as event
        // super is used in multiple inheritance ie if F inherits from multiple contracts then it will call ALL parents
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }
    function boo() public virtual override {
        emit Log("G.boo");
        super.boo();
    }
}

contract H is F, G {
    function foo() public override(F, G) {
        F.foo(); // will call ctrt F and emit F.foo which then calls E.foo() and emits E.foo
    }
    function boo() public override(F, G) {
        super.boo(); // will call the boo() in both F and G so F.boo is emited then G.boo then since both
        // these contracts have super in them they will call and emit E.boo (only once)
    }
}


