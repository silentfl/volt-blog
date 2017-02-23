require 'rails_helper'

RSpec.describe CreateReportJob, type: :job do
  it "uploads a backup" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      CreateReportJob.perform_later(
        Faker::Internet.email,
        (Time.now - 1.day).to_s,
        Time.now.to_s
      )
    }.to have_enqueued_job
  end
end
