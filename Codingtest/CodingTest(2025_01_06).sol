// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Game{

    struct User{
        uint userIdx;
        string name;
        address addr;
        uint balance;
        uint score;
    }
    
    User[] public users;
    mapping(address => uint) public userIdx;
    address public admin;
    uint public currentUserIdx=1;
    uint public ttlContBalance;
    
    uint ENTRY_FEE = 0.01 ether;
    uint SCORE_REWARD = 4;
    uint SCORE_EXCHAGE_RATE = 10;

    modifier checkAdmin(){
        require(msg.sender==admin,"Only admin has the authority");
        _;
    }

    modifier checkUser(){
        require(userIdx[msg.sender]!=0,"User not registered");
        _;
    }

    function setUsers(string memory _name) public {
        require(userIdx[msg.sender]==0,"User already registered");
        users.push(User(currentUserIdx, _name, msg.sender,0,0));
        userIdx[msg.sender] = currentUserIdx;
        currentUserIdx++;
    }

    function getUserByIdx(address _addr) public view returns(uint, string memory, address, uint, uint){
        uint index = userIdx[_addr];
        require(index>0, "User not registed");
        User memory user = users[index -1];
        return (user.userIdx, user.name, user.addr, user.balance, user.score);
    }

    function deposit() external payable checkUser(){
        require(msg.value >0, "Deposit AMT must be greater than 0");
        uint index = userIdx[msg.sender] - 1;
        users[index].balance +=msg.value;
    }

    function participate() external checkUser(){
        uint index = userIdx[msg.sender] - 1;
        require(users[index].balance >= ENTRY_FEE, "Please deposit ETH.");
        users[index].balance-=ENTRY_FEE;
        ttlContBalance +=ENTRY_FEE;

        room.push(users[index]);

        if(room.length==4){
            for(uint i =0; i<room.length; i++){
                uint reward = SCORE_REWARD - i;
        }
        }
    }
}
