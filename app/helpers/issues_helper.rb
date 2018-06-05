module IssuesHelper

  def find_issue
   @issue = Issue.find(params[:id])
 end
 
end
