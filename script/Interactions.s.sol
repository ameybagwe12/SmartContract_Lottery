// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {VRFCoordinatorV2Mock} from "@chainlink/contracts/src/v0.8/mocks/VRFCoordinatorV2Mock.sol";

contract CreateSubscription is Script {
    function createSubscriptionUseingConfig() public returns (uint64) {
        HelperConfig helperConfig = new HelperConfig();
        (, , address vrfCoordinator, , , ,) = helperConfig.activeNetworkConfig();
    }

    function createSubscription(
        address vrfCoordinator
    ) public returns (uint64) {
        console.log("Subscription on Chain Id: ", block.chainid);
        vm.startBroadcast();
        uint64 subId = VRFCoordinatorV2Mock(vrfCoordinator)
            .createSubscription();
        console.log("Your Sub Id is: ", subId);
        console.log("Please update subscription Id in HelperConfig.s.sol");
        vm.stopBroadcast();
    }

    function run() external returns (uint64) {
        return createSubscriptionUseingConfig();
    }
}

contract FundSubscription is Script {
    uint public constant FUND_AMOUNT = 3 ether;

    function fundSubscriptionUsingConfig() public {
        HelperConfig helperConfig = new HelperConfig();
        (
            ,
            ,
            address vrfCoordinator,
            ,
            uint64 subId,
            ,
            address link
        ) = helperConfig.activeNetworkConfig();
    }

    function run() external {
        fundSubscriptionUsingConfig();
    }
}
