// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DucatToken is ERC20, Ownable {
    constructor() ERC20("DucatToken", "DUC") Ownable(msg.sender) {}

    // Mint 
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    event BurnAttempt(address sender, address target, uint256 amount);

    // Burn 
    function burn(uint256 amount) external {
        emit BurnAttempt(msg.sender, msg.sender, amount);
        _burn(msg.sender, amount);
    }

    // Burn from
    function burnFrom(address account, uint256 amount) external onlyOwner {
        emit BurnAttempt(msg.sender, account, amount); 
        _burn(account, amount);
    }
}

