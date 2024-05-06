// SPDX-License-Identifier: MIT
// Get funds from suers
// Withdraw funds
// Set a minimum funding value in USD

pragma solidity ^0.8.25; 

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimunUsd = 5; 

    function fund() public payable {
        // Allow users to send 5
        // Have a minimum $ sent $5
        // 1. How do we send ETH to this contract?
    //  require(msg.value > 1e18, "didn't send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000
        require(msg.value >= minimunUsd, "didn't send enough ETH");
    }
    // function withdraw() public {}

    function getPrice() public view returns(uint256){
        // Address
        // ABI 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1868EAEd088f0B65363960928296D119b62c3184);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        // 2000.00000000
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x1868EAEd088f0B65363960928296D119b62c3184).version();
    }
}