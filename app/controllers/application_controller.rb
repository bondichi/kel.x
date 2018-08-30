class ApplicationController < ActionController::Base
	protect_from_forgery
	before_action :authenticate_user!

  # Rails image_url helper requires host to be set up to generate the absolute url
  # needed to load your images from the external world (Facebook, Twitter, ...).
  # Below overrides Rails.application.default_url_options[:host]

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end
end




