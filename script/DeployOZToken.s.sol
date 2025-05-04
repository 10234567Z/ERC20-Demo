// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {OZToken} from "src/OZToken.sol";

contract DeployOZToken is Script {
    uint256 private constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (OZToken) {
        vm.startBroadcast();
        OZToken ot = new OZToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return ot;
    }
}