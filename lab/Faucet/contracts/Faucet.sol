pragma solidity >0.5.0 <0.6.0;

contract Faucet {
    event Withdraw(address indexed, uint256 indexed);
    event Deposit(address indexed, uint256 indexed);

    //give out ether to anyone who asks
    function withdraw(uint256 withdraw_amount) public payable {
        //check the balance and retrict the value of ether
         require(
            address(this).balance >= withdraw_amount, 
            "Faucet: Insufficient balance for withdraw"
            );
         require(
            withdraw_amount <= 0.1 ether,
            "user can withdraw not more than 0.1 ether per withdraw"
            );
        msg.sender.transfer(withdraw_amount);
        emit Withdraw(msg.sender, withdraw_amount);
    }

    function() external payable {
        emit Deposit(msg.sender, msg.value);
    }
}
