class ExperimentsController < ApplicationController
  def index
    @proposal = Proposal.find(params[:proposal_id])
    @experiments = @proposal.experiments
    @comments = @proposal.comments
  end
end
