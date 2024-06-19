// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClubMembership {
    // Mapping to store member status
    mapping(address => bool) public members;

    // Event declarations
    event MembershipChanged(address member, bool isMember);

    // Function to join the club
    function joinClub() public {
        // Use require to ensure the caller is not already a member
        require(!members[msg.sender], "Caller is already a member of the club.");
        members[msg.sender] = true;
        emit MembershipChanged(msg.sender, true);
    }

    // Function to leave the club
    function leaveClub() public {
        // Use revert to ensure the caller is currently a member
        if (!members[msg.sender]) {
            revert("Caller is not a member of the club.");
        }
        members[msg.sender] = false;
        emit MembershipChanged(msg.sender, false);
    }

    // Function to check membership status
    function checkMembership(address user) public view returns (bool) {
        return members[user];
    }

    // Function to validate membership integrity (for demonstration)
    function validateMembership() public view {
        // Example use of assert to validate state consistency
        // This is just an example and might not make sense in real-world scenarios
        // Assert is used here to check a condition that must always be true after any changes to state
        assert(members[msg.sender] == true || members[msg.sender] == false);
    }
}