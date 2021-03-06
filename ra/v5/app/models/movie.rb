class Movie < ActiveRecord::Base
  belongs_to :user

  searchkick

  has_attached_file :image, :styles => {:medium=> "400x600#", :small=> "300x300>"} 
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end
