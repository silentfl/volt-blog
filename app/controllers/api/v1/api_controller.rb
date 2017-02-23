module Api::V1
  class ApiController < ApplicationController
    before_action :authenticate_user!, except: [:by_author]
  end
end
