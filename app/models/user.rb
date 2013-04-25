class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_many    :uploads,   class_name: '::Upload',             foreign_key: :user_id,  inverse_of: :user
end
