# payment_centralization_web/config/initializers/api_config.rb
Rails.application.config.api_base_url = ENV.fetch('API_BASE_URL', 'http://api:3000/api/v1')