// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Structs {
    /** Structs allows to group data together - collection of different types combined together to create a new type.
        - creating a structure
        - Declaring a structure variable
        - Initializing structure members*/
    // defining struct of cars
    struct Car {
        string model;
        uint year;
        address owner;
    }

    // Combining struct with other datatypes and declaring a state variable
// we can use struct as a state variable
Car public car;
// we can also create an array of struct
Car[] public cars;
// we can define a mapping from the owner to cars 
mapping (address => Car[]) public carsByOwner;

// initialize a struct - 3 ways
function examples() external {
    // 1. Simiilar to how we would execute a fn - we put all the parameters into paranthesis - order matters
    // creating a variable of type struct car (Car) inside memory so this Car variable will only exist when this fn is called

    Car memory toyota = Car("Toyota", 1990, msg.sender); 

    // 2. By passing key value pairs inside the paranthesis - order doesnt matter
    Car memory lambo = Car({model: "Lamborghini", year: 1980, owner: msg.sender}); 
    // Car memory lambo = Car({year: 1980, model: "Lamborghini", owner: msg.sender}); 

    // 3. Just define and the struct will have a default value cause variables in solidity hava a default value
    Car memory tesla; // -model - empty string, year - 0, owner - address(0)
    // adding data
    tesla.model = "Tesla";
    tesla.year = 2010;
    tesla.owner = msg.sender;
    /** When we call this fn it'll initialize the struct in memory so the fn will execute and
    after execution these structs will be gone
    To get structs from the smart contract after execution put these in a state variables
    
    we'll push these structs into the cars array  - array of structure*/
    cars.push(toyota);
    cars.push(lambo);
    cars.push(tesla);
    /** Once this part is executed our struct will be stored in the cars array
    we don't really need to initialize a struct as memory and then save it into a state variable, we can do it in one single line
     */

// Create a struct and push it immediately into the array
    cars.push(Car("Ferrari", 2020, msg.sender)); // - equivalent to initializing a car in memory and then pushing it to the cars array

// Once stored in a state variable to get it and update it.
    Car memory _car = cars[0]; // since we just need the car from the state variable and read it, and no modification, then we can decalare as memory  
// _car has access to model year and owner that is stored in the elt of the cars array
  
    _car.model; //to avoid name conflict with state variable car
    _car.year;
    _car.owner;

    // update
    /**To modify the year of the car - first thing is to change the keyword memory to storage 
    since memory means we are loading this data(_car) onto memory, so if we modify anything on 
    memory then once the fn is done executing nothing will change whereas storage means we want to 
    update the variables stored inside the smart contrat */
    Car storage _car = cars[0]; 
    _car.year = 1999;   
    /**This will update the car stored in the cars arrays first element and update the year to 1999
    Once this fn is done executing this change will be saved */
    
    /** We can also use the keyword delete to reset the field stored in a struct */

    delete _car.owner; // this will reset the owner of the car to the default value ie address(0)

    /**we can also call delete on a struct to reset all the data stored in a struct */
    delete cars[1]; // - this will delete the cars struct that is stored in the cars array the first elt, meaning that whatever is stored inside cars[1] will be reset to default value

    /**after this Car struct stored here (cars[1]) will have a empty string, year will be 0, owner 0 address */
}

}