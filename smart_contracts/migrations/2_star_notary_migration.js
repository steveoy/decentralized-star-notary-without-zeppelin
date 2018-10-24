var MyContract = artifacts.require("./StarNotary.sol");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(MyContract);
};