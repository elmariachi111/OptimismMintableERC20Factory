// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import { OptimismMintableERC20 } from "src/universal/OptimismMintableERC20.sol";

contract CreationCode is Script {
  function run() public {
     bytes memory b = type(OptimismMintableERC20).creationCode;
     console.logBytes(b);
  }
}
