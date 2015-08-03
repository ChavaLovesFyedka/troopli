OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 905409226191336, "f9fcf09dd9ad752c770c826f2e001f24"
end