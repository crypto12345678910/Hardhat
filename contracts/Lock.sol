// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {
    uint public unlockTime;
    address payable public owner;

    event Withdrawal(uint amount, uint when);

    error timeLockInThePast();
    error lockTimeNotElapesedYet();
    error notOwner();

    /**
     * @notice contstructor
     * @param _unlockTime unlock time for this contract
     */
    constructor(uint _unlockTime) payable {
        if (block.timestamp > _unlockTime) {
            revert timeLockInThePast();
        }

        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }

    /**
     * @notice allow owner to withdraw balance after time lock elapsed
     */
    function withdraw() public {
        // Uncomment this line, and the import of "hardhat/console.sol", to print a log in your terminal
        // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

        if (block.timestamp < unlockTime) {
            revert lockTimeNotElapesedYet();
        }

        require(msg.sender == owner, "You aren't the owner");
        if (msg.sender != owner){
            revert notOwner();
        }

        emit Withdrawal(address(this).balance, block.timestamp);

        owner.transfer(address(this).balance);
    }
}
