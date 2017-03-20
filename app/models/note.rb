class Note < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end
