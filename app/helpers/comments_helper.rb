module CommentsHelper

  def find_issue
    @issue = Issue.find(params[:issue_id])
  end

end
