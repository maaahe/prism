// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PrismSale {

  uint public totalSales;
  uint public maxSales;

  address public owner;
  address public charity;

  mapping (address => bool) sales;
 
  constructor() {
    totalSales = 0;
    maxSales = 100;
    owner = 0x18b67a5dd4B5FD44489B11FAA4B351fAa42CE17C;
    charity = 0xD28bf75618be6Ea93788DF27839b3375e0c61504;
  }

  function canBuy () public returns (bool) {
    return totalSales < maxSales;
  }

  function hasAccess () public returns (bool) {
    return sales[msg.sender];
  }

  function buy () public payable returns (bool) {
    require (canBuy() == true, "cant buy this");
    require (msg.value == 0.01 ether, "wrong amount");
    require (hasAccess() == false, "you've already bought this");

    payable(owner).transfer(msg.value * 80/100);
    payable(charity).transfer(msg.value * 20/100);

    totalSales = totalSales + 1;

    sales[msg.sender] = true;
    return true;
  }
}
