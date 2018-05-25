class HomeController < ApplicationController
  def index
    @issues = Issue.all.order('created_at DESC').limit(5)
  end
end
