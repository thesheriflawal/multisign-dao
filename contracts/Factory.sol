// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract Factory {
    Proposal[] public proposals;

    function create_proposal(
        address user,
        string memory proposal_details
    ) external {
        Proposal memory _new_proposal = Proposal(
            proposalId,
            _user,
            _proposal_details,
            Status.PENDING
        );

        proposals.push(_new_proposal);

        proposalId++;
    }

    function get_approved_proposals(uint256 proposalId) external view returns (Proposal memory) {
        for(uint256 i; i <proposals.length; i++) {
            if(proposals[i].status == PENDING) {
            }
        }

        return proposals[i];
    }

    function get_failed_proposals(uint256 proposalId) external view returns (Proposal memory) {
        for(uint256 i; i <proposals.length; i++) {
            if(proposals[i].status == FAILED) {
            }
        }

        return proposals[i];
    }

    function get_executed_proposals(uint256 proposalId) external view returns (Proposal memory) {
        for(uint256 i; i <proposals.length; i++) {
            if(proposals[i].status == EXECUTED) {
            }
        }

        return proposals[i];
    }


}