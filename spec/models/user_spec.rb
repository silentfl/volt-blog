require 'rails_helper'

describe User, type: :model do
  subject { create(:user) }

  context :validation do
    it :success do
      expect(subject).to be_valid
    end

    it :nickname do
      subject.nickname = nil
      expect(subject).to_not be_valid
    end

    it :email do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it :password do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
