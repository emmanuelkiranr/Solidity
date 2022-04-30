// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ToDoList {
    struct ToDo {
        string description;
        bool status;
    }

    ToDo[] public todos;

    function createTodo(string calldata _description) external {
        // since the input we receive is directly saved to struct without modifing we dont need any copy so use calldata
        todos.push(ToDo({description: _description, status: false}));
    }

    function updateTodo(string calldata _newDescription, uint256 _index)
        external
    {
        todos[_index].description = _newDescription;
        /**In an array of struct if we are updating just one field then use this method. If we are updating
        multiple fields then use the method below. Since for multiple field update using the above method 
        means we will be accessing the array of struct each time we update a field in it, where as the below 
        will just access the array of struct once and then for updating the field it just access the field 
        using the dot(.) operater and not the array of struct*/

        // ToDo storage todo = todos[_index];
        // todo.description = _newDescription;
    }

    function changeStatus(uint256 _index) external {
        todos[_index].status = !todos[_index].status; // flipping b/w true and false
    }

    function getTodo(uint256 _index)
        external
        view
        returns (string memory, bool)
    {
        ToDo memory todo = todos[_index];
        /** Declaring todo as storage means it doesent do a copy here[ie while declaring a 
        structure variable - todo], it does only one copy while it returns
        But declaring todo as memory means it does a copy once over here[ie while declaring 
        a structure variable - todo] and once while returning it, so two copies*/
        return (todo.description, todo.status);
    }
}
