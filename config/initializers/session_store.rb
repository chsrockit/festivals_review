# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_festivalreview_session',
  :secret      => '43fc4e61e0572dc95244d3dbadfbac0d6e0c6a7446988ab4779bea71f6b2e36507a0763cdf52e9cb7115bf89a1d4c99d1122422958ffd99c2abbbfc7d0461617'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
