// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title PiggyBank
 * @dev simple piggy bank. funds can be sent to contract. Contract self-destructs when owner pulls funds. Only the owner can withdraw.
 */

 contract PiggyBank {

     event Deposit(uint amount);
     event Withdraw(uint amount);

     address public owner = msg.sender;

     receive() external payable {
         emit Deposit(msg.value);

     }

     function withdraw() external {
            require(msg.sender == owner, "You are not the owner");
            emit Withdraw(address(this).balance);
              selfdestruct(payable(msg.sender));

     }


    }
