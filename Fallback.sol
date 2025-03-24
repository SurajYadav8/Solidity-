// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Fallback {
    uint256 result;

    receive() external payable {
        result = 1;
     }
     
     fallback() external payable{
        result = 2;
     }
}