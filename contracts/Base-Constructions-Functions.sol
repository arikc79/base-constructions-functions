// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Base-Constructions-Functions
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract BaseConstructionsFunctions {
    address public owner;
    event LogMessage(string msg);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }


    constructor (){
        owner = msg.sender;
        uint8 age =20;
        // if
        if(age>=18){

            emit LogMessage("age>18");
        }

        if (age<18){
        //1

        }
        else  if(age==18){
            //2
        }
        else{
            //3
        }
        string memory status =age >=18 ? "Audit" : "Miror";
        age>=18 ? "Audit" :"Miror";




    



   
    
     
}