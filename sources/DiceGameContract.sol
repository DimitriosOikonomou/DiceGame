pragma solidity >=0.5.0;

contract DiceGameContract {  
    /*Dice game contract*/

    address owner;
    bool online;
    
    constructor() public payable {
        owner = msg.sender;
        online = true;
    }
    
    modifier isOwner() {
        //Checks if user is the owner

        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    //Event to keep track of transaction history 
    //since transaction function doesn't return values
    event Bet(bool won, uint mysteryNumber);
    
    function withdrawFunds() public isOwner {
        /*Sends all accumulated funds to the owner*/

        msg.sender.transfer(address(this).balance);
    }
    
    function fundGame() public isOwner payable {
        /* It just receives funds from the owner, nothing else */
    }
    
    function mysteryNumber() private view returns (uint) {
        //Generates random number using the blockhash
        /*I wanted to use chainlink VRF to get random numbers externally
          but the chainlink ropsten faucet was not working :(*/

        uint randomNumber = uint(blockhash(block.number-1))%10 + 1;
        return randomNumber;
    }
    
    function determineWinner(uint number, bool guess) public pure returns (bool) {       
        /* Takes a number (1-10) and a guess (true=high/false=low)
        and returns true if guess matches the number */
        
        if ((number > 5 && guess == true) || (number < 5 && guess == false)) {
            
            return true;
            
        } else {
            
            return false;
        }
    }
    
    function winOrLose (bool guess) external payable returns (bool, uint) {
        /* Use true for a higher guess, false for a lower guess */
        
        require(online == true, "The game is not online");
        require(msg.sender.balance > msg.value, "Insufficient funds");
        require(address(this).balance > msg.value, "Contract is out of money! :(");
        
        uint mysteryNumber_ = mysteryNumber();
        bool isWinner = determineWinner(mysteryNumber_, guess);
        
        if (isWinner == true) {
            /* Player won */
            msg.sender.transfer(msg.value * 2);
            
            emit Bet(true, mysteryNumber_);
            return (true, mysteryNumber_);
            
        } else {
            /*Player lost */
            emit Bet(false, mysteryNumber_);
            return (false, mysteryNumber_);
            
        }
    }
}
    
    function winOrLose (bool guess) external payable returns (bool, uint) {
        /* Use true for a higher guess, false for a lower guess */
        
        require(online == true, "The game is not online");
        require(msg.sender.balance > msg.value, "Insufficient funds");
        require(address(this).balance > msg.value*2, "Contract is out of money! :(");
        
        uint mysteryNumber_ = mysteryNumber();
        bool isWinner = determineWinner(mysteryNumber_, guess);
        
        if (isWinner == true) {
            /* Player won */
            msg.sender.transfer(msg.value * 2);
            
            return (true, mysteryNumber_);
            
        } else {
            /*Player lost */
            return (false, mysteryNumber_);
            
        }
    }
}