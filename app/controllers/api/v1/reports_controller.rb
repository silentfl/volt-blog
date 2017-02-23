module Api::V1
  class ReportsController < ApiController
    def by_author
      now = Time.now
      start_date = Time.parse(params[:start_date]) rescue now - 1.month
      end_date = Time.parse(params[:end_date]) rescue now
      email = params[:email]

      unless email.present?
        render json: { errors: ["Email is empty!"] }, status: 400
        return
      end

      # fix period if it's not correct
      end_date = now if end_date > now
      start_date = end_date - 1.day if start_date > end_date

      CreateReportJob.perform_later(email, start_date.to_s, end_date.to_s)
    end
  end
end
