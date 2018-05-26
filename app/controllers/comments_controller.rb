class CommentsController < ApplicationController
  include CommentsHelper

  def create
    find_issue
    @comment = @issue.comments.create(params[:comment].permit(:body))
    redirect_to issue_path(@issue)
  end
end
