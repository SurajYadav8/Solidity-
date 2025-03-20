// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./Simple Storage.sol";


contract AddFiveStorage is SimpleStorage {

   //override
   //virtual override

   function store(uint256 _newNumber) public override {
       favoriteNumber = _newNumber +5;  
   }
}