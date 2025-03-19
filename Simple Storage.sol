
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SimpleStorage {

    uint256 favoriteNumber;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }
    mapping (string => uint256 ) public nametofavoriteNumber;

    Person[] public community;


    uint256[] listOfFavoriteNumbers;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;

    }

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        community.push(Person( _favoriteNumber, _name));
        nametofavoriteNumber[_name] = _favoriteNumber;
    }
}