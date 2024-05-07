// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19; // Solidity Version

//import "forge-std.Script.sol";

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        // command that will be called when the our contract is being deployed
        vm.startBroadcast();
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage;
    }
}
