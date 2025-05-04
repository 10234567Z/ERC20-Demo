// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OZToken is ERC20 {
    constructor(uint256 _initialSupply) ERC20("Fudo", "FD") {
        _mint(msg.sender, _initialSupply);
    }
}