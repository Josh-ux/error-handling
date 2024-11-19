// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClubMembership {
    mapping(address => bool) public members;

   //informs on when a user changes their membership
    event MembershipChanged(address member, bool isMember);

    //allows new users to register for club membership
    function joinClub() public {       
        require(!members[msg.sender], "Caller is already a member of the club.");
        members[msg.sender] = true;
        emit MembershipChanged(msg.sender, true);
    }

  //members can use this function to leave the club
    function leaveClub() public {
        if (!members[msg.sender]) {
            revert("Caller is not a member of the club.");
        }
        members[msg.sender] = false;
        emit MembershipChanged(msg.sender, false);
    }

    //Allows a user to check their membership
    function checkMembership(address user) public view returns (bool) {
        return members[user];
    }

//Used to assert that a member belongs to the club
    function validateMembership() public view {       
        assert(members[msg.sender] == true || members[msg.sender] == false);
    }
}
