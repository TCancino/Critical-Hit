# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

RUBYOPT = '-W:no-deprecated -W:no-experimental'
