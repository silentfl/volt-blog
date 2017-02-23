class ReportMailer < ApplicationMailer
  def send_report(user, data, start_date, end_date)
    @data = data
    @start_date = Time.parse(start_date)
    @end_date = Time.parse(end_date)

    mail to: user, subject: "Report from #{@start_date} to #{@end_date}"
  end
end
