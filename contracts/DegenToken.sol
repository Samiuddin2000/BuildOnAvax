// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

 
    mapping(address => bool) public hasRedeemed;

    struct Item {
        string name;
        uint256 price;
    }

    Item[] public GamingStore;

    constructor() ERC20("Degen", "DGN") {       
       GamingStore.push(Item("Rare Sword", 200));
      GamingStore.push(Item("Epic Armor", 300));
       GamingStore.push(Item("Legendary Shield", 500));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() override public pure returns(uint8){
        return 0;
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(_msgSender()) >= amount, "Insufficient balance");
        
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

function redeem(uint256 itemId) public {
    require(!hasRedeemed[msg.sender], "Already redeemed");

    Item storage item = GamingStore[itemId];
    uint256 price = item.price;

    require(balanceOf(msg.sender) >= price, "Insufficient balance");

    hasRedeemed[msg.sender] = true;
    _burn(msg.sender, price);
}


    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(_msgSender()) >= amount, "Insufficient balance");
        
        _burn(_msgSender(), amount);
    }

    function balanceOf(address account) public view override returns (uint256) {
        return super.balanceOf(account);
    }
}
