module ProposalsHelper
  def archived_proposals(proposals)
    proposals.select {|proposal| proposal.status ==
      "archived"}
  end
end
