class IssuesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  include IssuesHelper

  def index
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      issue_user
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

 def destroy
   find_issue.destroy
   redirect_to '/'
 end

  private
  def issue_params
    params.require(:issue).permit(:title, :description, :solution, :category_ids => [])
  end

end
