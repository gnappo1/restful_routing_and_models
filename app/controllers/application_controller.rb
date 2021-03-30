class ApplicationController < ActionController::Base
    add_flash_types :success, :error, :warning, :info
    include ApplicationHelper
end
