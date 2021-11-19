// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PrismSale {

  uint public totalSales;
  uint public maxSales;

  address public owner;
  address public charity;

  constructor() {
    totalSales = 0;
    maxSales = 100;
    owner = 0x18b67a5dd4B5FD44489B11FAA4B351fAa42CE17C;
    charity = 0xD28bf75618be6Ea93788DF27839b3375e0c61504;
  }

  function canBuy () public returns (bool) {
    return totalSales < maxSales;
  }

  function buy () public returns (bool) {
    require (canBuy() == true, "cant buy this");

    totalSales = totalSales + 1;
    return true;
  }
}
