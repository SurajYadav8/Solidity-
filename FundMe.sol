//get funds from users
//withdraw funds
//set the minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    address[] public Funders;
    mapping(address => uint256 ) public addressToAmountFunders;
    
    uint256 minimumUsd = 5e18;

    function fund() public payable {
        require( conversion(msg.value) > minimumUsd, "didn't have enough amount");
        Funders.push(msg.sender);
        addressToAmountFunders[msg.sender] = addressToAmountFunders[msg.sender] + msg.value;
    }

    function withdraw() public {

    }
    
    function getPrice () public view returns(uint256) {
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price, , ,) = pricefeed.latestRoundData();

        return uint256(price * 1e10);
    }
    function conversion (uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAountUsd = (ethPrice * ethAmount) / 1e18;
        return ethAountUsd;
    }
    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}