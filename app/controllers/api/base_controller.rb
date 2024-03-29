# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_default_response_format

    private

    def set_default_response_format
      request.format = :json
    end
  end
end
