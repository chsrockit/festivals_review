# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_festivalsreview_session',
  :secret      => '199244e4d3283058bb7db89b95a86701d903bac48e7d4b72112193d897ea21e9f02e131733d422c1f7d5358a3cefd09c0942740976dcaf021d69c2091d2105ae'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
