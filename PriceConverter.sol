// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter{ 
    function getPrice() internal view returns(uint256){
        // Address
        // ABI 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1868EAEd088f0B65363960928296D119b62c3184);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        // 2000.00000000
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
 
    function getVersion() internal view returns (uint256) {
        return AggregatorV3Interface(0x1868EAEd088f0B65363960928296D119b62c3184).version();
    }

}