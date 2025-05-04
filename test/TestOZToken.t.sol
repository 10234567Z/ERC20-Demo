// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import {Test} from "forge-std/Test.sol";
import {OZToken} from "../src/OZToken.sol";
import {DeployOZToken} from "../script/DeployOZToken.s.sol";
import {console} from "forge-std/console.sol";


contract TestOZToken is Test {
    DeployOZToken public deployer;
    OZToken public ozToken;

    address public bob = makeAddr("bob");
    address public alice = makeAddr("alice");
    uint256 public constant INITIAL_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOZToken();
        ozToken = deployer.run();

        vm.prank(msg.sender);
        ozToken.transfer(bob, INITIAL_BALANCE);
    }

    function testIntitialBalanceTransferToBob() external view {
        assertEq(ozToken.balanceOf(bob), INITIAL_BALANCE);
    }

    function testAllowancesWork() external {
        uint256 initialAllowance = 1000;

        vm.prank(bob);
        ozToken.approve(alice, initialAllowance);

        uint256 transferAmount = 100;
        vm.prank(alice);
        ozToken.transferFrom(bob, alice, transferAmount);

        assertEq(ozToken.balanceOf(alice), transferAmount);
        assertEq(ozToken.balanceOf(bob), INITIAL_BALANCE - transferAmount);
        assertEq(ozToken.allowance(bob, alice), initialAllowance - transferAmount);
    }
}