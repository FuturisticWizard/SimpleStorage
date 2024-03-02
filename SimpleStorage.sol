//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    // Basic value types : boolean, uint (unsigned integer), int (signed integer), address, bytes
    bool hasFavoriteNumber = false;
    // FavoriteNumber gets initialized to 0 if no value is assigned. with public it creates a getter function. Public means that variable can be called from any other external contracts
    uint myfavoriteNumber; // 0

    //uint256[] listOfFavoriteNumbers; // array [0,12,55]

    // creating struct Person
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Create empty  public dynamic array
    Person[] public listOfPeople;
    
    // mapping every string/name to one number 
    mapping(string => uint256) public nameToFavoriteNumber;

    //static array (up to 3) 
    //Person[3] public listOfPeople;

    // Creating variable myFriend using struct Person, myFriend favoriteNumber is 7 and name is "Pat"
    // Person public pat = Person({favoriteNumber: 7,name: "Pat"});

    // Store function store the variable on blockchain, it needs to update the state of blockchainb so to do it we have to send transaction , which creates a gas cost
    function store(uint256 _favoriteNumber) public {
            myfavoriteNumber = _favoriteNumber;

    }

    // view means we are going to only read state from a blockchain and its costless, 
    // you cant modifiy the state of blockchain inside view functions !!!
    // pure function disallow modifing state and even reading from state or storage
    function retrive() public view returns(uint256) {
        return myfavoriteNumber;
    }
    // Creating addPerson public function that can add pereson to listOfPeople array
    // calldata - temporary memory, variable can't be modified
    // memory - temporary memory, variable can be modified 
    // storage - permament memory, can't be modified 
    // Since string is an array of bytes, you have to tell solidity where to store the value
    // Solidity needs  to be told where to store structs , mappings, and arrays
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // Adds someone to array listOfPeople
        listOfPeople.push(Person(_favoriteNumber, _name));
        // Add somebody to nameToFavoriteNumber mapping
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }





} 