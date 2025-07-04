// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Encoding{

    function combineStrings() public pure returns(string memory){
        return string(abi.encodePacked("Hi Babe!", "Get Lost!"));
    }

    function encodeNumber() public pure returns(bytes memory){
        bytes memory number = abi.encode(1);
        return number;
    }

    function encodeString() public pure returns (bytes memory) {
        bytes memory somestring = abi.encode("Hi Babe!");
        return somestring;
    }

    function encodeStringPacked() public pure returns (bytes memory){
        bytes memory somestring = abi.encodePacked("Hi Babe!");
        return somestring;
    }

    function encodeStringBytes() public pure returns (bytes memory){
        bytes memory someString = bytes("some string");
        return someString;
    }

    function decodeString() public pure returns(string memory) {
        string memory someString = abi.decode(encodeString(), (string));
        return someString;
    }

    function multiEncode() public pure returns(bytes memory) {
        bytes memory someString = abi.encode("Some string", "it's bigger!");
        return someString;
    }

    function multiDecode() public pure returns(string memory, string memory){
        (string memory someString, string memory someOtherString) = abi.decode(multiEncode(), (string, string));
        return (someString, someOtherString);
    }

    // How do we send transaction that call function with just the data field populated?
    // How do we populate the data field?
}