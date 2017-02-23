class CreateReportJob < ApplicationJob
  queue_as :default

  def perform(start_date, end_date, email)
    report = User.all.map { |u| { nickname: u.nickname, email: u.email, posts: u.posts.size, comments: u.comments.size } }
  end
end
