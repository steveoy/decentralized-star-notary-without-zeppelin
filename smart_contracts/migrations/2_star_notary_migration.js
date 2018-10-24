var StarNotaryContract = artifacts.require("./StarNotary.sol");

module.exports = function(deployer) {
  // Deploy the Migrations contract as our only task
  deployer.deploy(StarNotaryContract);
};