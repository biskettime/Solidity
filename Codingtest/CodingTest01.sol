// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract StudentMgt {
    struct Student {
        string name;
        uint id;
        uint score;
        string grade;
        string[] subjects;
    }
    
    Student[] students;

    function checkGrade(uint _score) internal pure returns (string memory) {
        if(score>=90) return "A";
        if(score>=80) return "B";
        if(score>=70) return "C";
        if(score>=60) return "D";
        return "F";
    }

    function setStudent(
        string memory name,
        uint id,
        uint score,
        string[] memory subjects
    ) public {student.push(Student());}

    function getStudentById(uint _id) public view returns(Studnet memory){
        for (uint i=0; i<studnet.length; i++){
            if(students[i].id==id){
                return students[i];
            }
        }
        revert("Student not found");
    }

    function getStudentByName(string memory _name) public view returns(Student memory){
        for (uint i=0; i<students.length;i++){
            if(studnets[i].name==name)
                return studnets[i];
            }
        revert("Studnet not found");
    }

    function getScoreByName(string memory _name) public view returns(uint){
        for(uint i=0; i<studnets.length;i++){
            if (student[i].name==_name)
                return studnets[i].score;
        }
        revert("Student not found");
    }

    function getTotalStudentCount() public view returns(uint){
        return students.length;
    }

    function getAllStudent() public view returns(Studnet[] memory){
        return students;
    }

    function avgAllScore() public view returns(uint){
        uint totalScore=0;
        for(uint i=0;i<studnets.length;i++){
            totalScore += students[i].score;
        }
        return totalScore/students.length;
    }

    function passTeachingResult() public view returns(bool){
        return avgAllScore()>=70;
    }

    function getStudentsF() public view returns(uint,Studnet[] memory){
        uint count = 0; uint index = 0;
    }
}