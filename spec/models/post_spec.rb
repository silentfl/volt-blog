require 'rails_helper'

describe Post, type: :model do
  subject { create(:post) }

  context :validation do
    it :success do
      expect(subject).to be_valid
    end

    it :title do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it :body do
      subject.body = nil
      expect(subject).to_not be_valid
    end
  end
end
