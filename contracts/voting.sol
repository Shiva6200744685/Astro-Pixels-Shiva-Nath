// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public owner;
    mapping(string => uint) public votes;
    mapping(address => bool) public hasVoted;
    string[] public candidates;

    constructor(string[] memory _candidates) {
        owner = msg.sender;
        candidates = _candidates;
    }

    function vote(string memory _candidate) public {
        require(!hasVoted[msg.sender], "You have already voted!");

        bool validCandidate = false;
        for (uint i = 0; i < candidates.length; i++) {
            if (keccak256(abi.encodePacked(candidates[i])) == keccak256(abi.encodePacked(_candidate))) {
                validCandidate = true;
                break;
            }
        }
        require(validCandidate, "Candidate does not exist!");

        votes[_candidate]++;
        hasVoted[msg.sender] = true;
    }

    function getVotes(string memory _candidate) public view returns (uint) {
        return votes[_candidate];
    }

    function getAllCandidates() public view returns (string[] memory) {
        return candidates;
    }
}
