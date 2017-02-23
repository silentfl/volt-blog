class CreateReportJob < ApplicationJob
  queue_as :default

  def perform(email, start_date_string, end_date_string)
    start_date = Time.parse(start_date_string)
    end_date = Time.parse(end_date_string)

    # example data, no date filter
    report = User.all.map { |u| { nickname: u.nickname, email: u.email, posts: u.posts.size, comments: u.comments.size } }

    ReportMailer.send_report(email, report, start_date_string, end_date_string).deliver_later
  end
end
