// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/** When we use dynamic datatype as a variable we need to declare its data location.
Data location - storage, memory and calldata
    Storage - variable is state variable 
    memory - data is loaded onto memory 
    calldata - like memory, but can be used only for fn inputs 
    
    Storage to update data and memory to read data */

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping (address => MyStruct) public myStructs;

    function insert() external {
        myStructs[msg.sender] = MyStruct({foo : 123, text : "bar"});
        // To modify a struct first thing is to declare it as storage - Only if we need to read it use memory
        MyStruct storage myStruct = myStructs[msg.sender]; 
        /** Here we are getting MyStruct struct from the mapping mySturcts that is stored at msg.sender. 
        Here we're telling solidity that the variable we're gonna use should point back to the storage, meaning
        the state variable */
        myStruct.text = "foo"; // This change is saved

        // Just to read
        MyStruct memory readOnly = myStructs[msg.sender]; 
        /** This will build MyStruct stored at msg.sender to memory. We can also modify the variable but
        since data is loaded into memory, after fn execution this change will not be saved.*/
        readOnly.foo =456; // This change is not saved



    }
        /**When writing fn both for input and output we'll use memory and calldata. eg we can pass an uint[] as input uint[] memory _name, then 
        we need to declare the data location. Likewise we can also return a dynamic data type, in that case we want to declare
        the return type as memory */

     function insert(uint[] memory y, string memory s) external returns (MyStruct memory){
        myStructs[msg.sender] = MyStruct({foo : 123, text : "bar"});
        MyStruct storage myStruct = myStructs[msg.sender]; 
        
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender]; 
        readOnly.foo =456;

        return readOnly;
    }

    // Returning an uint array 

    function insert(uint[] memory y, string memory s) external returns (uint[] memory){
        myStructs[msg.sender] = MyStruct({foo : 123, text : "bar"});
        MyStruct storage myStruct = myStructs[msg.sender]; 
        
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender]; 
        readOnly.foo =456;

        /**For eg we'll inititalize an uint[] in memory and return it */

        uint[] memory memArray = new uint[](3);// This array will be loaded into memory so only fixed size is possible

        memArray[0] = 234;
        return memArray;
    }

    // Calldata is only used for fn inputs since it has a potential to save gas
    /** Datatype declared as calldata are non modifiable - means we cannot change the values inside it , it can save gas when you
    pass this input into another fn */

    function insert(uint[] calldata y, string calldata s) external returns (uint[] memory){
        myStructs[msg.sender] = MyStruct({foo : 123, text : "bar"});
        MyStruct storage myStruct = myStructs[msg.sender]; 
        
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender]; 
        readOnly.foo =456;

        internal(y);

        uint[] memory memArray = new uint[](3);
        memArray[0] = 234;
        return memArray;
    }
// eg calldata - this fn internal takes in input an uint[] from the input over here(above fn)
    function internal(uint[] calldata y) private {

    }
    function internal(uint[] memory y) private {
        /** If internal() was memory the solidity would do is take this input(prev fn) and when it passes on to this fn
        then its gonna copy each elt in this uint[] so it will be creating a new uint array inside the memory and then pass it onto
        here(this fn) but if we declared this fn as calldata then there is one less copying to do - it takes y from input and 
        passes it into the internal fn without copying it */

    }
/**Use storage to load dynamic data that you will update if you only need to read the  data or modify it without saving it
onto the blockchain then use memory , for fn inputs use call data to save gas.
Whenever the input (insert fn) is passed to another fn it saves gas by avoiding copies */
}