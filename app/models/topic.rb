class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :links, dependent: :destroy
end
