module Api::V1
  class ReportsController < ApiController
    def by_author
      now = Time.now
      start_date = params[:start_date] || now - 1.month
      end_date = params[:end_date] || now
      email = params[:email]

      unless email.present?
        render json: { errors: ["Email is empty!"] }, status: 400
        return
      end

      # fix period if it's not correct
      end_date = now if end_date > now
      start_date = end_date - 1.day if start_date > end_date

      CreateReportJob.perform_later(start_date, end_date, email)
    end
  end
end
