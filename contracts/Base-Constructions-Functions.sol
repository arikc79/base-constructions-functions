// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Base-Constructions-Functions
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {
    event LogMessage(string msg);


    constructor (){
        uint8 age =20;
        // if
        if(age>=18){
            emit LogMessage("age>18");
        }
    }


    



   
    
     
}