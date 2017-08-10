class ExperimentsController < ApplicationController
  def index
    @proposal = Proposal.find(params[:proposal_id])
    @experiments = @proposal.experiments
    @comments = @experiments.each { |x| x.comments }
  end
end
