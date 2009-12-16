# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_indymembership_session',
  :secret      => 'c6105d401335f8508ca55182f60ad5cb757010fe970a0beda25e4fff525ca7f56b809234ef8f2d9fceab7fee31e377c0585fed16f4c0400e23ccfc31ff47d214'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
