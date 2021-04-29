class ErrorsController < ApplicationController
  def not_found
    render ststus: 404
  end

  def internal_server_error
    render ststus: 500
  end
end
