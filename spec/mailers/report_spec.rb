require "rails_helper"

RSpec.describe ReportMailer, type: :mailer do
  let(:email) { Faker::Internet.email }
  let(:start_date) { (Time.now - 1.day).to_s }
  let(:end_date) { Time.now.to_s }
  let(:data) do
    Array.new(10) { 
      {
        nickname: Faker::Internet.user_name,
        email: Faker::Internet.email,
        posts: rand(10),
        comments: rand(10)
      }
    }
  end

  let(:mail) do
    ReportMailer.send_report(
      email,
      data,
      start_date,
      end_date
    )
  end

  describe :render do
    context :headers do
      it { expect(mail.subject).to match('Report') }
      it { expect(mail.to).to eq([email]) }
    end

    it :body do
      expect(mail.body.encoded).to match(data.first[:nickname])
    end
  end
end
