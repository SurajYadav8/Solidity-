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

    function getselectorOne() public pure returns (bytes4 selector) {
        selector = bytes4(keccak256(bytes("transfer(address,uint256)")));
    }

    function getDataToCallTransfer(address someAddress, uint256 amount)
        public
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSelector(getselectorOne(), someAddress, amount);
    }

    function callTransferFunctionDirectly(address someAddress, uint256 amount)
        public
        returns (bytes4, bool)
    {
        (bool success, bytes memory returnData) = address(this).call(
            // getDataToCallTransfer(someAddress, amount)

            abi.encodeWithSelector(getselectorOne(), someAddress, amount)
        );
        return (bytes4(returnData), success);
    }

     function callTransferFunctionDirectlySig(address someAddress, uint256 amount)
        public
        returns (bytes4, bool)
    {
        (bool success, bytes memory returnData) = address(this).call(
            // getDataToCallTransfer(someAddress, amount)

            abi.encodeWithSignature("transfer(address,uint256)", someAddress, amount)
        );
        return (bytes4(returnData), success);
    }

    function callAnotherFunction() public view returns (bool) {}

    function getselectorTwo() public pure returns (bytes4 selector) {
        selector = bytes4(keccak256(bytes("callAnotherFunction()")));
    }
    function getDataToCallCallAnotherFunction()
        public
        pure
        returns (bytes memory)
    {
       return abi.encodeWithSelector(getselectorTwo());
    }
}
