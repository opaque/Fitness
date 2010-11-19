# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fitness_session',
  :secret      => '1fbb946f02a13c7decf10fb508ac236321919f776ec24030df69dca050f00adfb0825eaafc2e8f9d881ee01c6c2af8987bf73610822b0cf0564ea14841b1db55'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
