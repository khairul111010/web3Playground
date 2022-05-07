// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract stockProduct {

    // state variables
    address public owner;
    mapping (address => uint) public stockProductCount;

    // set the owner as th address that deployed the contract
    // set the initial stock to 100
    constructor() {
        owner = msg.sender;
        stockProductCount[address(this)] = 100;
    }

    function getStockProductCount() public view returns (uint) {
        return stockProductCount[address(this)];
    }


    function getOwnerBalance(address Cowner) public view returns (uint) {
        return stockProductCount[Cowner];
    }

    // Let the owner restock
    function restock(uint amount) public {
        require(msg.sender == owner, "Only the owner can restock.");
        stockProductCount[address(this)] += amount;
    }

    // Purchase product from stock
    function purchase(uint amount) public payable {
        require(msg.value >= amount * 2 ether, "You must pay at least 2 ETH per stock");
        require(stockProductCount[address(this)] >= amount, "Not enough product in stock to complete this purchase");
        stockProductCount[address(this)] -= amount;
        stockProductCount[msg.sender] += amount;
    }
}