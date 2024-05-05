// SPDX-License-Identifier: MIT
pragma solidity 0.8.25; // Solidity Version 


contract SimpleStorage {
    // favoriteNumber gets intialized to 0 if not 

    uint256 public favoriteNumber; // 0

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

}