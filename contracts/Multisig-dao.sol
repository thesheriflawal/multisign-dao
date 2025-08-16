// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

// import "./Factory.sol";

contract MultisigDao {

  address[3] admins;
  // uint[] passedProposals;
  // uint[] failedProposals;

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

  mapping(uint => Proposal) proposals;
  mapping(uint => mapping(address => bool)) confirmations;

  constructor(address[] memory _admins, uint _confirmations, address _owner) {
    require(_admins.length > 0, "Admins need to be greater than 0");
    require(_confirmations > 0, "You need the number of confirmation specified");
    require(_confirmations <= _admins.length, "You signers can't be more than admins");

    owner = _owner;
    admins = _admins;
    required = _confirmations;
  }

  function get_admins() external view returns (address[] memory) {
    return admins;
  }

  function get_confirmation() external view returns (uint) {
    return required;
  }

  function addToExecuted(uint proposalId) external {
    require(this.isConfirmed(proposalId), "You need more confirmations");

    Proposal storage _prop = proposals[proposalId];

  }

}
