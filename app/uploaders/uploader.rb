# -*- encoding : utf-8 -*-
require 'digest/sha1'

class Uploader < CarrierWave::Uploader::Base

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file

  def store_dir
    "uploads/#{model.user_id}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads/"
  end

end
