class Product < ActiveRecord::Base


  has_attached_file :cover_image,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover_image,
                                    :content_type => /\Aimage\/.*\Z/

  has_many :cart_items
  has_many :carts, :through => :cart_items

  validates_length_of :title, :in => 1..255
  validates :seller_info, :presence => true
  validates :description, :presence => true
  validates_numericality_of :amount, :only_integer => true
  validates :types, :presence => true
  validates :category, :presence  => true
  validates_numericality_of :price, :only_integer => true
# roughly speaking sets list of model protected attributes to []
# making all attributes accessible while mass-assignment
  attr_protected

end

