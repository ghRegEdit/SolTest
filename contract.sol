//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract SBER-LP is Ownable {

    uint256 private number;
    uint256 public amount;
    string private _name = "SBR";

    receive() external payable {
        amount += msg.value;
    }
    
    function name() external view returns (string memory) {
        return _name;
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(_msgSender()).transfer(balance);
    }

    function store(uint256 num) public {
        number = num;
    }
    function retrieve() public view returns (uint) {
        return number;
    }

    function getBalance() public view returns (uint){
        uint256 balance = address(this).balance;
        return balance;
    }
}
