// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SwapCoin is ERC20("StakeCoin", "STC"){
    address owner;
    constructor () {
        msg.sender == owner;
        _mint(address(this), _totalSupply);
    }
    
    modifier onlyOwner() {
        msg.sender == owner;
        _;
    }
    function transferOut(address addressTo, uint amountTo)external onlyOwner{
        uint balContract = balanceOf(address(this));
        require(balContract >= amountTo, "not enough");
        _transfer(address(this), addressTo, amountTo);
    }

    uint8 constant _decimals = 18;
    uint256 constant _totalSupply = 2000000 * 10**_decimals;  
    
    function mint(uint amount) internal{
        _mint(msg.sender, amount);
    }
}