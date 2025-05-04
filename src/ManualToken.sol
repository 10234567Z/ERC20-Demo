// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract ManualToken {

    mapping(address => uint256) private s_balance;
    function name() public pure returns (string memory) {
        return "ManualToken";
    }

    function totalSupply() public pure returns (uint256) {
        return 500 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _account) public view returns(uint256) {
        return s_balance[_account];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
        require(previousBalance >= _amount, "Not enough balance");

        s_balance[msg.sender] -= _amount;
        s_balance[_to] += _amount;
    }
}