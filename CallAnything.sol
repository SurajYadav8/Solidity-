// SPDX-License-Identifier: MIT

// In order to call a function using only the data field of call, we need to encode:
// The function name
// The parameters we want to add
// Down to the binary level

// Now each contract assigns each function it has a function ID. This is known as the "function selector"

// The "function selector" is the first 4 bytes of the functions signature.
// The "function signature" is a string that defines the function name & parameters

pragma solidity 0.8.7;

contract CallAnything {

    address public s_someAddress;
    uint256 public s_amount;

    function transfer(address someAddress, uint256 amount) public {
        s_someAddress = someAddress;
        s_amount = amount;
    }

    function getselectorOne() public pure returns ( bytes4 selector) {
        selector = bytes4(keccak256(bytes("transfer(address,uint256")));
    }
}

