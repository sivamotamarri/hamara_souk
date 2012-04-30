class ErrorsController < ApplicationController
  ERRORS = [
    :internal_server_error,
    :not_found,
    :method_not_allowed,
    :unprocessable_entity,
    :access_denied
  ].freeze

  ERRORS.each do |e|
    define_method e do
      @exception_message = params['exception_message']
      @exception_trace = params['exception_trace']
      respond_to do |format|
        format.html { render e, :status => e }
        format.any { head e }
      end
    end
  end
end
