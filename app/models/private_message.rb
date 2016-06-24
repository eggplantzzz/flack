class PrivateMessage < ActiveRecord::Base
  belongs_to :recipient
end
