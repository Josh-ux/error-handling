// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClubMembership {
    mapping(address => bool) public members;

  
    event MembershipChanged(address member, bool isMember);

    
    function joinClub() public {       
        require(!members[msg.sender], "Caller is already a member of the club.");
        members[msg.sender] = true;
        emit MembershipChanged(msg.sender, true);
    }

  
    function leaveClub() public {
        if (!members[msg.sender]) {
            revert("Caller is not a member of the club.");
        }
        members[msg.sender] = false;
        emit MembershipChanged(msg.sender, false);
    }
    
    function checkMembership(address user) public view returns (bool) {
        return members[user];
    }

    function validateMembership() public view {       
        assert(members[msg.sender] == true || members[msg.sender] == false);
    }
}
