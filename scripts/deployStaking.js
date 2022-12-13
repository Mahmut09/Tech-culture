const hre = require("hardhat");

async function main() {
    const StakingAlg = await hre.ethers.getContractFactory("StakingAlg");

    const stakingAlg = await StakingAlg.deploy("0x46D847815789536aFD44314672891661e8EdDB18", "0x46D847815789536aFD44314672891661e8EdDB18");
    await stakingAlg.deployed();

    console.log("Staking Algoritm", stakingAlg.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
