// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address private owner;
    constructor() ERC20("META", "MT") {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function!");
        _;
    }
 
    function mint(address to, uint256 amount) public onlyOwner{
        _mint(to,amount);
    }

    function burn(uint256 amount) public{
        _burn(msg.sender,amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(amount<=balanceOf(msg.sender),"Insufficient balance.");
        _transfer(msg.sender, to, amount);
        return true;
    }
}
