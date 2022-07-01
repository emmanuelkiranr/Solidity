// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/**Structs allow us to express multiple choices eg bool - true and false. 
If we need to express more choices then use Enum */

contruct Enum {
    enum ShippingStatus {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }
    // indexed from 0
    
    // Using enum as state variable
    ShippingStatus public status;

    //  eg of combining enums with other datatypes

    // Using inside a struct
    struct Order {
        address buyer,
        ShippingStatus status; // status will be the enum status that we defined
    }
    // Array of Order / array of struct
    Order[] public orders;


    // returning enum from a fn

    function get() view returns(ShippingStatus){
        return status;
    }

    // Taking enum as input and setting the status to the enum from input

    function set(ShippingStatus _status) external {
        status =_status;
    } 

    // update enum to a specific enum

    function setSpecific() external {
        status = ShippingStatus.Canceled;
    }

    // Reset enum to default value using delete
    function reset() external {
        delete status; // This will reset the status state variable which is a enum to its default value ie the first item defined inside the enum
    }

    // ---------------------------------------//
    // enum Status {
    //     orderConfirmed, // 0
    //     shipped, // 1 
    //     arrived, // 2
    //     delivered // 3
    // }

    // struct Product {
    //     string name;
    //     uint ID;
    //     Status stat;        
    // }

    // Product[] public prod;
    // Status public stat;

    // function addProd() public {
    //     prod.push(Product("Iphone 13 pro", 101010, Status.shipped));
    // }

    // function defaultStatus() public {
    //     stat = Status.orderConfirmed;
    // }

    // function setStatus(Status _i) public {
    //     stat = _i;
    // }

    // function reset() public {
    //     delete stat;
    // }

    // function getStatus() public view returns(Status) {
    //     return stat;
    // } 
}