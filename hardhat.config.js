require("@nomicfoundation/hardhat-toolbox");
require("hardhat-contract-sizer");
require("solidity-docgen");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.19",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    }
  },

  contractSizer: {
    alphaSort: true,
    disambiguatePaths: false,
    runOnCompile: true,
    strict: true,
  },

  docgen: {
    sourcesDir: 'contracts',
    outputDir: 'documentation',
    templates: 'templates',
    pages: 'files',
    clear: true,
    runOnCompile: true,
  }
};
