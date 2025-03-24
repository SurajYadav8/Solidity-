//get funds from users
//withdraw funds
//set the minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";
error NotOwner();

contract FundMe {

    using PriceConverter for uint256;

    address[] public Funders;
    mapping(address => uint256 ) public addressToAmountFunded;
    
    uint256 public constant MINI_USD = 5e18;

    address public immutable i_owner;

    constructor () {
        i_owner = msg.sender;
    } 

    function fund() public payable {
        require(msg.value.conversion() > MINI_USD, "didn't have enough amount");
        Funders.push(msg.sender);
        addressToAmountFunded[msg.sender]  +=  msg.value;
    }

    function withdraw() public onlyOwner {

        // require(msg.sender == owner, "You're not the owner");

        //for loop 
        for(uint256 i = 0; i < Funders.length; i++){
            address funder = Funders[i];
            addressToAmountFunded[funder] = 0;
        }

        //reset the array
        Funders = new address[](0);

        //  this is the one way of sending token to different contract
        payable(msg.sender).transfer(address(this).balance); // not that transfer method is used for upto 2300 gas fee anything above, it will return error

        // second way of sending ethers to different contract
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "send failed");


        // Third way of sending ethers to different contract

        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");

    }

    modifier onlyOwner () {
        // require(msg.sender == i_owner, "You're not the Owner");
        if(msg.sender != i_owner) { revert NotOwner();}
        _;
    }
    
}