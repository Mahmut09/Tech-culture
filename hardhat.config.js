require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.17",
  networks: {
    testnet: {
      url: "https://bsc-testnet.public.blastapi.io",
      chainId: 97,
      accounts: {
        mnemonic: "tape theme home improve survey cram asset buffalo visual ill coconut visa",
      },
    },
  },
};
// https://bsctestapi.terminet.io/rpc