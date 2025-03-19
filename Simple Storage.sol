
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SimpleStorage {

    uint256 favoriteNumber;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    Person public Pat = Person(18, "Pat");


    uint256[] listOfFavoriteNumbers;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;

    }

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
}