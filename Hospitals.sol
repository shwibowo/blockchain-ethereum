// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0;

contract Hospitals {
    address payable public _hospitals;
    
    constructor() {
        _hospitals = msg.sender;
    }
}