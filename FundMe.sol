// SPDX-License-Identifier: MIT
// Get funds from suers
// Withdraw funds
// Set a minimum funding value in USD

pragma solidity ^0.8.25; 


//get the interface of the extenal contract
interface AggregatorV3Interface {
        function decimals() external view returns (uint8); 

        function description() external view returns (string memory);

        function version() external view returns (uint256); 
        
        function getRoundData(uint80 _roundId)
        external 
        view 
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt, 
            uint256 updatedAt,
            uint80 answeredInRound 
        );

        function latestRoundData()
        external 
        view 
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt, 
            uint256 updatedAt, 
            uint80 answeredInRound 
        );
    }

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

    function getPrice() public {
        // Address
        // ABI 
    }

    function getConversionRate() public {}

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x1868EAEd088f0B65363960928296D119b62c3184).version();
    }
}