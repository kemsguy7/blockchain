// SPDX-License-Identifier: MIT
// Get funds from suers
// Withdraw funds
// Set a minimum funding value in USD

pragma solidity ^0.8.25; 

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256; //attach price converter library to all unit256 

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded; 

    address public owner;
    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        msg.value.getConversionRate();
        // Allow users to send 5
        // Have a minimum $ sent $5
        // 1. How do we send ETH to this contract?
        require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000
        funders.push(msg.sender);
        // addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
       addressToAmountFunded[msg.sender] = msg.value;
    }
    
     function withdraw() public {
        
        // using a for loop for(starting index, ending index stop amount)
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
           address funder = funders[funderIndex];
           addressToAmountFunded[funder] = 0;
        }

        // reset the array 
        funders = new address[](0);

        // withdrew the funds

        //transfer
        payable(msg.sender).transfer(address(this).balance);
        //send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed");
        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
     }

     modifier  onlyOwner() {
        require(msg.sender == owner, "Sender is not owner!");
        _;
     }

}