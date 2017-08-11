class CommentsController < ApplicationController

  def new
    if !!params[:proposal_id]
      @commentable = Proposal.find(params[:proposal_id])
    else
      @commentable = Experiment.find(params[:experiment_id])
    end
    @comment = @commentable.comments.new
  end

  def create
    if !!params[:proposal_id]
      @commentable = Proposal.find(params[:proposal_id])
    else
      @commentable = Experiment.find(params[:experiment_id])
    end

    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      @commentable = @comment.commentable
    
      # redirect_to "/proposals/#{@proposal.id}/experiments/#{@experiment.id}"
      if @comment.commentable_type == "Proposal"
        redirect_to proposal_experiments_path(@commentable)
      end

      if @comment.commentable_type == "Experiment"
        @proposal = @commentable.proposal
        redirect_to proposal_experiment_path(@proposal, @commentable)
      end
    else
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter_id, :commentable, :body)
  end
end
