// Get funds from suers
// Withdraw funds
// Set a minimum funding value in USED

// SPDX-License-identifier: MIT
pragma solidity ^0.8.25; 

contract FundMe {

    uint 

    function fund() public payable {
        // Allow users to send 5
        // Have a minimum $ sent $5
        // 1. How do we send ETH to this contract?
    //  require(msg.value > 1e18, "didn't send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000
        require(msg.value > 1e18, "didn't send enough ETH");
    }
    // function withdraw() public {}

}