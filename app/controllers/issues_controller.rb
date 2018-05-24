class IssuesController < ApplicationController
  def index
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to @issue
    else
      render 'new'
    end 
  end

  private
  def issue_params
    params.require(:issue).permit(:title, :description, :solution)
  end

end
