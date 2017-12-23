Rollbar.configure do |config|
  config.access_token = Rails.application.secrets.rollbar_access_token

  if Rails.env.development? || Rails.env.test?
    config.enabled = false
  end

  # Thanks to: https://docs.bugsnag.com/platforms/ruby/rails/configuration-options/#ignore_classes
  config.exception_level_filters.merge!(
    'AbstractController::ActionNotFound' => 'ignore',
    'ActionController::InvalidAuthenticityToken' => 'ignore',
    'ActionController::ParameterMissing' => 'ignore',
    'ActionController::RoutingError' => 'ignore',
    'ActionController::UnknownAction' => 'ignore',
    'ActionController::UnknownFormat' => 'ignore',
    'ActionController::UnknownHttpMethod' => 'ignore',
    'ActiveRecord::RecordNotFound' => 'ignore',
    'CGI::Session::CookieStore::TamperedWithCookie' => 'ignore',
    'Mongoid::Errors::DocumentNotFound' => 'ignore',
    'SignalException' => 'ignore',
    'SystemExit' => 'ignore')

  config.environment = ENV['ROLLBAR_ENV'] || Rails.env
end
