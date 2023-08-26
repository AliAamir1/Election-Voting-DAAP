pragma solidity 0.5.16;

contract Election {
    struct Candidate{
        uint id;
        string name;
        uint votecount;
    }
    
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;
    
    uint public candidatescount;
    event votedEvent(
        uint indexed _candidateId
    );
    
    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
    // Read/write candidate
    //string public candidate;

    // Constructor
    //function Election () public {
        //candidate = "Candidate 1";
    //}
    
    function addCandidate(string memory _name) private {
        candidatescount++;
        candidates[candidatescount] = Candidate(candidatescount,_name,0);
    }
    
    function vote(uint _candidateId) public{
        require(!voters[msg.sender]);
        require(_candidateId > 0 && _candidateId <= candidatescount);
        voters[msg.sender] = true;
        candidates[_candidateId].votecount++;
        emit votedEvent(_candidateId);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
