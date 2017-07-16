OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '269432846871807', '0ff9601d9f15b21faff366df662f5127', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end

