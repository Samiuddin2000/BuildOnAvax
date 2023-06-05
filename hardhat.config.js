require("@nomicfoundation/hardhat-toolbox");

const FORK_FUJI = false;
const FORK_MAINNET = false;
let forkingData = undefined;

if (FORK_FUJI) {
  forkingData = {
    url: "https://api.avax-test.network/ext/bc/C/rpc",
  };
}

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    hardhat: {
      gasPrice: 225000000000,
      chainId: forkingData ? undefined : 43112,
      forking: forkingData,
    },
    fuji: {
      url: "https://api.avax-test.network/ext/bc/C/rpc",
      gasPrice: 225000000000,
      chainId: 43113,
      accounts: ['ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80'].map(address => address.toString()), // Convert the address to a string
    },
  },
  etherscan: {
    apiKey: 'P4QW4KD5GAC4WZ7U51X1HQMTGU4UXBIQFV', // we use an .env file to hide our Snowtrace API KEY
  },
};