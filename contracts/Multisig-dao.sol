// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

// import "./Factory.sol";

contract MultisigDao {

  address[3] admins;
  uint[] passedProposals;
  uint[] failedProposals;

  address owner;

  uint8 proposalCount;

  uint256 proposalId = 0;

  uint required;

  struct Proposal {
    uint256 id;
    address proposer;
    string description;
    Status status;
  }

  enum Status {
    PENDING,
    FAILED,
    EXECUTED
  }

  modifier onlyAdmin() {
    require(isAdmin(msg.sender), "Only admins can call this function");
    _;
  }

  modifier onlyMember() {
    require(isMember[msg.sender], "Only admins can call this function");
    _;
  }

  mapping(uint => Proposal) public proposals;
  mapping(address => bool) public members;
  mapping(uint => mapping(address => bool)) confirmations;

  constructor(address[3] memory _admins) {
    admins = _admins;

    for(uint256 i = 0; i < 3; i++) {
      members[_admins[i]] = true;
    }
  }

  function joinDAO() external {
    require(!members[msg.sender], "Already a member");
    members[msg.sender] = true;
  }

  function create_Proposal(
    string memory description
  ) external onlyMember {
    uint256 proposalId = proposalCount;

    Proposal storage newProposal = proposals[proposalId];
    newProposal.proposer = msg.sender;
    newProposal.description = _description;
    newProposal.status = Status.PENDING;
    newProposal.approvals = 0;
    newProposal.rejections = 0;

    proposalCount++;
  }

  function voteProposal(
    uint256 _proposalId,
    bool _approve
  ) external onlyAdmin {
    
  }

}
