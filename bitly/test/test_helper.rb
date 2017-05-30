require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActionController::TestCase
  include ActiveJob::TestHelper
  include Devise::Test::ControllerHelpers
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all
  include ActionDispatch::TestProcess # fixture_file_upload
end
