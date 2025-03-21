//get funds from users
//withdraw funds
//set the minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";
contract FundMe {

    using PriceConverter for uint256;

    address[] public Funders;
    mapping(address => uint256 ) public addressToAmountFunders;
    
    uint256 minimumUsd = 5e18;

    function fund() public payable {
        require(msg.value.conversion() > minimumUsd, "didn't have enough amount");
        Funders.push(msg.sender);
        addressToAmountFunders[msg.sender] = addressToAmountFunders[msg.sender] + msg.value;
    }

    function withdraw() public {

    }
    
}