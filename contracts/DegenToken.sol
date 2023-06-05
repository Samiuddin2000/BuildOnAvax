// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC721, Ownable {

    struct Item {
        string name;
        uint256 price;
    }

    Item[] public gamingItems;
    mapping(uint256 => address) public itemOwners;

    constructor() ERC721("Degen", "DGN") {       
        gamingItems.push(Item("Rare Sword", 200));
        gamingItems.push(Item("Epic Armor", 300));
        gamingItems.push(Item("Legendary Shield", 500));
    }

    function mint(address to, uint256 itemId) public onlyOwner {
        require(itemId >= 0 && itemId < gamingItems.length, "Invalid item ID");
        uint256 tokenId = gamingItems.length * 100 + itemId;
        _mint(to, tokenId);
        itemOwners[tokenId] = to;
    }

    function transferItem(address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "Not approved or owner");
        transferFrom(_msgSender(), to, tokenId);
        itemOwners[tokenId] = to;
    }

    function redeem(uint256 itemId) public {
        require(itemId >= 0 && itemId < gamingItems.length, "Invalid item ID");
        uint256 price = gamingItems[itemId].price;
        require(balanceOf(_msgSender()) >= price, "Insufficient balance");

        uint256 tokenId = gamingItems.length * 100 + itemId;
        _mint(_msgSender(), tokenId);
        itemOwners[tokenId] = _msgSender();
    }

    function burn(uint256 tokenId) public {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "Not approved or owner");
        _burn(tokenId);
        delete itemOwners[tokenId];
    }
 function balanceOf(address account) public view override returns (uint256) {
        return super.balanceOf(account);
    }
}
