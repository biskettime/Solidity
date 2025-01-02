// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract classMgt{
    struct Student{
        uint id;
        string name;
        uint score;
    }
    Student[] students;  // 구조체 구성

    function setStudent(uint _id, string memory _name, uint _score) public {
        students.push(Student(_id, _name, _score)); // 학생 정보 입력
    }


    // 점수 최하위 학생 정보 체크
    function getLowst() public view returns(Student memory){
        require(students.length>0, "No Any Student Score Available!");
        uint lowstIdx=0;
        uint lowstScore=students[0].score;

        for(uint i=1; i < students.length; i++){
            lowstIdx=i;
            lowstScore=students[i].score;
        }
        return students[lowstIdx];
    }

    // 전체 학생들 점수 합산
    function getTtlScore() public view returns(uint){
        uint ttlScore=0;
        for(uint i=0; i < students.length; i++){
            ttlScore+=students[i].score;
        }
        return ttlScore;
    }

    // 전체 학생 평균
    function getAvgScore() public view returns(uint){
        require(students.length > 0, "No Any Student Score Available!");
        return getTtlScore()/students.length;
    }

    // 전체 학생수
    function getTtlStudent() public view returns(uint){
        return students.length;
    }
}
