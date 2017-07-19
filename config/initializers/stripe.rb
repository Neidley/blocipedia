# Store the environment variables on Rails.configuration object
Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: ENV['STRIPE_SECRET_KEY']
}

#Set our app-stored secret key with stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]