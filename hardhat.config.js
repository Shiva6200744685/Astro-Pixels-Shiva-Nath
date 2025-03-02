require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity:"0.8.28",
  networks: {
    ganache: {
      url: "HTTP://127.0.0.1:7545", // Ganache RPC URL
      accounts: ["0xb363d6849114338cc58d48d8ab30ff0cc8923986f11679f3d8149bf9e091bf4a"], // Replace with a private key from Ganache
    },
  },
};
