// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//로또 프로그램을 만드려고 합니다. 
//숫자와 문자는 각각 4개 2개를 뽑습니다. 6개가 맞으면 1이더, 5개의 맞으면 0.75이더, 
//4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. (순서는 상관없음)

//참가 금액은 0.05이더입니다.

//당첨번호 : 7,3,2,5,B,C
//예시 1  : 8,2,4,7,D,A -> 맞은 번호 : 2     (1개)
//예시 2  : 9,1,4,2,F,B -> 맞은 번호 : 2,B   (2개)
//예시 3  : 2,3,4,6,A,B -> 맞은 번

contract Lottery{
    address public owner;
    uint256 public ticketPrice = 0.05 ether;
    uint256 public totalPot;
    uint256 public ticketIdx;

    struct Ticket{
        uint8[4] numbers;
        bytes1[2] letters;
        address buyer;
    }

    Ticket[] public tickets;
    Ticket public WinningTicket;
    event TicketPurchased(address buyer, uint256 ticketIdx, uint8[4] numbers; bytes[2] letters);
    event PrizeWon(address indexed player, uint256 prize);
    event WinningNumbersSet(uint8[4] numbers, bytes1[2] letters);

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(){
        owner = msg.sender;
        ticketIdx=1;
        winningTicket=Ticket([7,3,2,5,[bytes("B",byte1("C")], address(0));

    function setWinningNumbers(uint8[4] memory numbers, bytes1[2] memory letters) public onlyOwner{
        winningTicket = Ticket(numbers, letters, address(0));
        emit WinningNumbersSet(numbers,letters);
    }

    function buyTicket(uint8[4] memory numbers, bytes1[2] memory letters) public payable {
        require(msg.value == ticketPrice,"Incorrect ticket price");

        tickets.push(Ticket(numbers, letters, msg.sender));
        totalPot +=msg.value;

        emit TicketPurchased(msg.sender, ticketIdx, numbers, letters);
        ticketIdx++;
    }

    function countMatches(Ticket memory ticket) internal view returns(uint8){
        uint8 matches = 0;

        for(uint8 i=0; i<4; i++){
            if(ticket.numbers[i]==winningTicket.numbers[j]){
                matches++;
            }
        }
        for(uint8 i=0,i<2;i++){
            if(ticket.letters[i]==winningTicket.letters[j]){
                matches++;
            }
        }
        return matches;
    }

    function calculaterPrize(uint8 matches) internal pure returns(uint256){
        if(matches ==6){
            return 1 ether;
        } else if (matches==5){
            return 0.75 ether;
        } else if (matches==4){
            return 0.25 ether;
        } else if (matches==3){
            return 0.1 ether;
        } else {
            return 0;
        }
    }
    function withdraw() public onlyOwner{
        payable(owner).transfer(address(this),balance);
    }
    }
    function resetLottery() public onlyOwner{
        delete tickets;
        totalPot=0;
        ticketIdx=1;
    }
}