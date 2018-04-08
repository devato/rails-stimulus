class PagesController < ApplicationController
  skip_before_action :require_login
  def home; end

  def features; end

  def pricing; end

  def docs; end
end
