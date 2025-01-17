// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0; 

Contract Q1{
    // 01.더하기, 빼기, 곱하기, 나누기 그리고 제곱을 반환받는 계산기를 만드세요.
  
    function add(uint _a, uint _b) public pure returns(uint){
    return _a+_b;
    }   
    function sub(uint _a, uint _b) public pure returns(uint){
    return _a-_b;
    }
    function mul(uint _a, uint _b) public pure returns(uint){
    return _a*_b;
    }
    function div(uint _a, uint _b) public pure returns(uint){
    if (_b==0){
    revert("Division by zero is not allowed");
    } else {
    return _a/_b;
    }
    }
    function pow(uint _a, uint _b) public pure returns(uint){
    uint powr = 1;
    for(uint i =0; i < _b; i++){
        powr *= _a;
    }
    return powr;
    }

    // 02.2개의 Input값을 가지고 1개의 output값을 가지는 4개의 함수를 만드시오. 각각의 함수는 더하기, 빼기, 곱하기, 나누기(몫)를 실행합니다.

  function add(uint _a, uint _b)public pure returns(uint){
        return _a + _b;
    }

    function sub(uint _a, uint _b)public pure returns(uint){
        return _a - _b;
    }

    function mult(uint _a, uint _b)public pure returns(uint){
        return _a * _b;   
    }

    function divd(uint _a, uint _b)public pure returns(uint){
        if(_b==0){
            revert("Division by zero is not allowed!");
        }
        return _a / _b;
    }

    // 03.1개의 Input값을 가지고 1개의 output값을 가지는 2개의 함수를 만드시오. 각각의 함수는 제곱, 세제곱을 반환합니다.

    function square(uint _a) public pure returns(uint){
        return _a*_a;
    }
    function cube(uint _a) public pure returns(uint){
        return _a*_a*_a;
    }

    // 04.이름(string), 번호(uint), 듣는 수업 목록(string[])을 담은 student라는 구조체를 만들고 그 구조체들을 관리할 수 있는 array, students를 선언하세요.

    struct Student {
        string name;
        uint number;
        string[] course;
    }

    Student[] students;

    function addStudent(string memory _name, uint _number, string[] memory _courses) public {
        students.push(Student(_name, _number, _courses));
    }

    function getStudent(uint _index) public view returns (string memory, uint, string[] memory) {
        require(_index < students.length, "Invalid index"); 
        Student memory student = students[_index]; 
        return (student.name, student.number, student.course);
    }

    // 05.아래의 함수를 만드세요 1~3을 입력하면 입력한 수의 제곱을 반환받습니다. 4~6을 입력하면 입력한 수의 2배를 반환받습니다. 7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환받습니다.

    function t3f(uint _n) public pure returns(uint){
        require( _n >=1 && _n <= 9, "Please input between 1 and 9");
        if(1<=_n && _n<=3){
            return _n*_n;
        } else if(4<=_n && _n<=6){
            return _n*2;
        } else{
            return _n%3;
        }
    }
    // 06.숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 9까지 자동으로 채우는 함수를 구현하세요.(for 문)

    uint[] numbers;

    function fillarray() public {
    for (uint i=0; i<=9; i++){
        numbers.push(i);
    }
    }

    function getNumbers() public view returns(uint[] memory){
        return numbers;
    }

    // 07.숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 5까지 자동으로 채우는 함수와 array안의 모든 숫자를 더한 값을 반환하는 함수를 각각 구현하세요.(for 문)

    uint[] numbers;

    function fillarray() public {
    for (uint i=0; i<=5; i++){
        numbers.push(i);
    }
    }
    
    function sumup() public view returns(uint){
        uint sumResult = 0; 
        for (uint i = 0; i < numbers.length; i++){
            sumResult += numbers[i];
        }
        return sumResult;
    }

    // 08.아래의 함수를 만드세요 1~10을 입력하면 “A” 반환받습니다. 11~20을 입력하면 “B” 반환받습니다. 21~30을 입력하면 “C” 반환받습니다.

    function abcGrade(uint _n) public pure returns(string memory){
        if( _n>= 1 && _n <= 10) {
            return "A";
        } else if(_n>=11 && _n <=20 ){
            return "B";
        } else if(_n>=21 && _n<=30){
            return "C";
        } else {
            revert("Please input between 1 and 30");
        }
    }

    // 09. 문자형을 입력하면 bytes 형으로 변환하여 반환하는 함수를 구현하세요.

    contract StringToBytes{
    function stringToBytes(string memory _s) public pure returns(bytes memory){
        return bytes(_s);
    } 

    //10. 숫자만 들어가는 array numbers를 선언하고 숫자를 넣고(push), 빼고(pop), 특정 n번째 요소의 값을 볼 수 있는(get)함수를 구현하세요.
 
    uint[] numbers;
    function pushNumber(uint _n) public {
        numbers.push(_n);
    }

    function popNumber() public{
        require(numbers.length >0, "Array is empty");
        numbers.pop();
    }

    function getNumber(uint _idx) public view returns (uint){
     require(_idx < numbers.length, "Index out of range");
        return numbers[_idx];
    }
}
}