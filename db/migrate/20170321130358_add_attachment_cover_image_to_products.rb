class AddAttachmentCoverImageToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :cover_image
    end
  end

  def self.down
    remove_attachment :products, :cover_image
  end
end
