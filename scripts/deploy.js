const hre = require("hardhat");

async function main() {
  // Get the Points smart contract
  const DegenToken = await hre.ethers.getContractFactory("DegenToken");

  // Deploy it
  const degenToken = await DegenToken.deploy();
  await degenToken.deployed();

  // Display the contract address
  console.log(`DegenGaming token deployed to ${degenToken.address}`);
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});