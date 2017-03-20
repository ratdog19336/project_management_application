class User < ActiveRecord::Base
  has_many :projects
  has_many :notes
  has_many :notes, through: :projects
  has_secure_password
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end
