class IssuesController < ApplicationController
  include IssuesHelper

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

  def show
    @issue = Issue.find(params[:id])
  end

  def edit
   find_issue
 end

 def update
   find_issue
   if @issue.update(params[:issue].permit(:title, :description, :solution, :category_ids => []))
     redirect_to @issue
   else
     render 'edit'
   end
 end

  private
  def issue_params
    params.require(:issue).permit(:title, :description, :solution, :category_ids => [])
  end

end
