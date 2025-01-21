class Auth::PasswordsController < ApplicationController
  before_action :authenticate_user!
end