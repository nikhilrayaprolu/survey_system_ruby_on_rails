OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '348438870377-bpfjutn1cc28pm8iq4ovbel2nb9a6cig.apps.googleusercontent.com', 'hNFulq_rOT5-WQrNFKcMiLoD', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end