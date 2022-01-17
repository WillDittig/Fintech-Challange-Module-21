pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale{ // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor( uint256 rate, 
    address payable wallet,
    KaseiCoin token
    ) Crowdsale(rate, wallet, token) public {

    }
        // YOUR CODE HERE!
  
        // constructor can stay empty
}

contract KaseiCoinCrowdsaleDeployer{
    address public kasei_token_address;
    address public kasei_crowdsale_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet) 
    public {

        KaseiCoin token = new KaseiCoin(name, symbol, 0);
        kasei_token_address = address(token);
        //contract KaseiCoinCrowdsale   = new KaseiCoinCrowdsale(1, wallet, token);
        KaseiCoinCrowdsale kasei_sale = new KaseiCoinCrowdsale(1, wallet, token);
        kasei_crowdsale_address = address(kasei_sale);

        token.addMinter(kasei_crowdsale_address);
        token.renounceMinter();


    }
}

