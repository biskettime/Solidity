// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract LogIn {
    struct User {
        bytes32 password;
        uint failedLogin;
    }

    mapping(string => User) private users;

    event UserRegistered(string userId);
    event LoginSuccessful(string userId);
    event LoginFailed(string userId, uint failedLogin);
    event AccountLocked(string userId);
    event UserDeleted(string userId);

    function register(string memory _userId, string memory _password) public {
        require(bytes(_userId).length > 0, "User ID cannot be empty");
        require(bytes(_password).length > 0, "Password cannot be empty");
        require(users[_userId].password == bytes32(0), "User ID already exists");

        users[_userId] = User({
            password: keccak256(abi.encodePacked(_userId, _password)),
            failedLogin: 0
        });

        emit UserRegistered(_userId);
    }

    function login(string memory _userId, string memory _password) public {
        require(bytes(_userId).length > 0, "User ID cannot be empty");
        require(bytes(_password).length > 0, "Password cannot be empty");
        require(users[_userId].password != bytes32(0), "User ID does not exist");

        User storage user = users[_userId];

        if (user.failedLogin >= 5) {
            emit AccountLocked(_userId);
            revert("Account is locked due to over 5 login failures");
        }

        if (user.password == keccak256(abi.encodePacked(_userId, _password))) {
            user.failedLogin = 0;
            emit LoginSuccessful(_userId);
        } else {
            user.failedLogin += 1;
            emit LoginFailed(_userId, user.failedLogin);
            revert("Invalid password");
        }
    }

    function deleteUser(string memory _userId, string memory _password) public {
        require(bytes(_userId).length > 0, "User ID cannot be empty");
        require(bytes(_password).length > 0, "Password cannot be empty");
        require(users[_userId].password != bytes32(0), "User ID does not exist");

        User storage user = users[_userId];

        require(user.password == keccak256(abi.encodePacked(_userId, _password)), "Invalid password");

        delete users[_userId];

        emit UserDeleted(_userId);
    }
}