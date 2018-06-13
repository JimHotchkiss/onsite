module IssuesHelper

  def find_issue
   @issue = Issue.find(params[:id])
 end

 def issue_user
   @issue.user_id = current_user.id
   @issue.save
 end

end
