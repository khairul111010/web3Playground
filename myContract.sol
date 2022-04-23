
pragma solidity >=0.7.0 <0.9.0;

contract MyContract {
    uint256 public myUint;
    function setMyUint(uint256 myUintParam) public {
        myUint = myUintParam;
    }

    bool public myBool;
    function setMyBool(bool myBoolParam) public {
        myBool = myBoolParam;
    }

    address public Address;
    function setAddress(address AddressParam) public {
        Address = AddressParam;
    }
    function getAddressBalance() public view returns(uint){
        return Address.balance;
    }
}