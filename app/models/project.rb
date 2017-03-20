class Project < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end
