pragma solidity ^0.5.16;

contract Election {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;

    uint public candidatesCount;

    function addCandidate(string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateID) public {
        require(!voters[msg.sender]);

        require(_candidateID > 0 && _candidateID <= candidatesCount);

        voters[msg.sender] = true;

        candidates[_candidateID].voteCount ++;
    }

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
}