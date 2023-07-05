class ApplicationController < ActionController::API
  rescue_from RailsParam::InvalidParameterError do |e|
    rescue_params_action(:bad_request, e)
  end

  rescue_from ActiveRecord::RecordNotFound,
              ActionController::BadRequest do |e|
    rescue_action(:bad_request, e)
  end

  def rescue_params_action(status, message)
    error_response = {
      detail: message.message
    }

    render json: { status: 'fail', data: { error: [error_response] } }, status:
  end

  def rescue_action(status, message)
    render json: { status: 'fail', data: { error: message.message } }, status:
  end

  def authorize_token
    header_auth = request.headers['Authorization']
    raise ActionController::BadRequest, 'Authorization cannot be empty' if header_auth.blank?

    token = header_auth.split(' ')[1]
    raise ActionController::BadRequest, 'Empty Token' if token.blank?

    account_token = AccountToken.find_by(token:)
    raise ActiveRecord::RecordNotFound, 'Token Not Found' if account_token.blank?

    @account = account_token.account
  end
end
