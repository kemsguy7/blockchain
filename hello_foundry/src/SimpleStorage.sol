// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; // Solidity Version

contract SimpleStorage {
    // favoriteNumber gets intialized to 0 if not

    uint256 public favoriteNumber; // 0

    // uint256[] listOfFavoriteNumbers;
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    //dynamic array which indicates that the array can grow in size
    Person[] public listOfPeople; // []

    //static array can only have a max number of 3 items
    //Person[3] public listOfPeople; //[]

    Person public pat = Person({favoriteNumber: 7, name: "Pat"});

    // chealsea -> 232
    mapping(string => uint256) public nameToFavoriteNumber;

    //store the favorite number
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrive() public view returns (uint256) {
        return favoriteNumber;
    }

    //calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
