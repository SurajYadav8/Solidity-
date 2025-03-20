

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./Simple Storage.sol";

contract StorageFactory{

    SimpleStorage[] public listofSimpleStorageContract;
    
     function createSimpleStorageContract() public {
         SimpleStorage newSimpleStorageContract = new SimpleStorage();
         listofSimpleStorageContract.push(newSimpleStorageContract);
     }

     function sfStore(uint256 _simplestorageIndex, uint256 _newSimpleStorageNumber) public{
        SimpleStorage mySimpleStorage = listofSimpleStorageContract[_simplestorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
     }
     function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return listofSimpleStorageContract[_simpleStorageIndex].retrieve();
     }
}