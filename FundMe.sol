//get funds from users
//withdraw funds
//set the minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract FundMe {

    uint256 minimumUsd = 5;

    function fund() public payable {
        require(msg.value > minimumUsd, "didn't have enough amount");
    }

    function withdraw() public {

    }
    
    function getPrice () public {

    }
    function conversion () public {
        
    }
}