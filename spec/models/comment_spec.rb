require 'rails_helper'

describe Comment, type: :model do
  subject { create(:comment) }

  context 'validation' do
    it :success do
      expect(subject).to be_valid
    end

    it :failed do
      subject.body = nil
      expect(subject).to_not be_valid
    end
  end
end
