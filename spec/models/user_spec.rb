require 'rails_helper'

describe User, type: :model do
  subject do
    User.new(
      nickname: 'user',
      email: 'user@example.com',
      password: '123'
    )
  end

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
