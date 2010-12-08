class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id
  validates_inclusion_of :gender, :allow_nil => true, :in => ['Male', 'Female']
  validates_numericality_of :height, :allow_nil => true, :greater_than => 0
  validates_numericality_of :weight, :allow_nil => true, :greater_than => 0
  
end
