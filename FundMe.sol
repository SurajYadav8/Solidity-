//get funds from users
//withdraw funds
//set the minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(
    uint80 _roundId
  ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

  function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

contract FundMe {

    uint256 minimumUsd = 5;

    function fund() public payable {
        require(msg.value > minimumUsd, "didn't have enough amount");
    }

    function withdraw() public {

    }
    
    function getPrice () public {
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    }
    function conversion () public {
        
    }
    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}