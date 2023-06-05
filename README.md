# BuildOnAvax

# DegenToken

## Introduction
DegenToken is a Solidity smart contract that represents a token on the Ethereum blockchain. It extends the functionality of ERC20 token and includes additional features such as ownership and a game store where users can redeem their tokens for in-game items.

## License
This project is licensed under the MIT License.

## Getting Started
To use this contract, you need to have a Solidity development environment set up. Follow these steps to get started:

1. Clone the repository: `git clone 
2. Install dependencies: `npm install`
3. Compile the contract: `npx hardhat compile`
4. Deploy the contract: `npx hardhat run scripts/deploy.js --network fuji`
5. Interact with the contract using the provided functions.

## Contract Details
The `DegenToken` contract is built on top of the OpenZeppelin library. It inherits from `ERC20` and `Ownable` contracts.

### Game Items
The contract includes a game store where users can redeem their tokens for in-game items. Each item is represented by the `Item` struct, which contains the name and price of the item. The available game items are:



### Functions
The contract provides the following functions:

- `mint(address to, uint256 amount)`: Mints new tokens and assigns them to the specified address. Only the contract owner can call this function.
- `redeem(uint256 itemId)`: Allows users to redeem their tokens for a specific game item. The item is identified by its ID.
- `transfer(address recipient, uint256 amount)`: Overrides the `transfer` function from the ERC20 contract to enable token transfers.
- `burn(uint256 amount)`: Burns a specific amount of tokens for the caller's account.
- `balanceOf(address account)`: Returns the token balance of the specified account.

## Contributing
Contributions are welcome! To contribute to this project, follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make the necessary changes in your branch.
4. Write tests to cover your changes (if applicable).
5. Run the existing tests using
