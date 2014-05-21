class Category < ActiveRecord::Base
  validates_uniqueness_of :name
  
  def name=(s)
    write_attribute(:name, s.to_s.titleize)
  end
end
