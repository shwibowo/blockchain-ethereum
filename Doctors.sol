// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0;

contract Doctors {
    address payable public _doctors;
    
    constructor() {
        _doctors = msg.sender;
    }
}