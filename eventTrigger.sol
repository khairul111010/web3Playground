
pragma solidity >=0.7.0 <0.9.0;

contract itemManager {

    enum SupplyChainState{Created, Paid, Delivered}

    struct S_item{
        string _identifier; //id
        uint _itemPrice; // price
        itemManager.SupplyChainState _state; //state of the item (Created ? Paid ? Delivered)
    }

    mapping(uint => S_item) public items; // mapping the items struct in arrays like
    uint itemIndex;

    // Event 
    event SupplyChainStep(uint _itemIndex, uint _step);

    // Creating Item
    function createItem(string memory _identifier, uint _itemPrice) public {
        items[itemIndex]._identifier = _identifier;
        items[itemIndex]._itemPrice = _itemPrice;
        items[itemIndex]._state = SupplyChainState.Created;
        emit SupplyChainStep(itemIndex, uint(items[itemIndex]._state));
        itemIndex++;
    }

    // Payment
    function triggerPayment(uint _itemIndex) public payable{
        require(items[_itemIndex]._itemPrice == msg.value, "Only full payment acceptable");
        require(items[_itemIndex]._state == SupplyChainState.Created, "Item is further in chain");
        items[_itemIndex]._state = SupplyChainState.Paid;

        emit SupplyChainStep(_itemIndex, uint(items[_itemIndex]._state));

    }

    //Delivered
    function triggerDelivery(uint _itemIndex) public {
        require(items[_itemIndex]._state == SupplyChainState.Paid, "Item is further in chain");
        items[_itemIndex]._state = SupplyChainState.Delivered;
        emit SupplyChainStep(_itemIndex, uint(items[_itemIndex]._state));
    }
}


