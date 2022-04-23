
pragma solidity >=0.7.0 <0.9.0;

contract sendMONEY {

    uint public r;
    function receiveMoney() public payable{
        r+=msg.value;
    }


    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function withDrawBalance(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}