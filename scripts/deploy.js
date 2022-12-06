const hre = require("hardhat");

async function main() {
  const TokenKazakh = await hre.ethers.getContractFactory("MyToken");

  const tokenKazakh = await TokenKazakh.deploy();
  await tokenKazakh.deployed();

  console.log("Kazakh Token", tokenKazakh.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
