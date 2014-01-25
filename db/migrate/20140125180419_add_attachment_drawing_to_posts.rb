class AddAttachmentDrawingToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :drawing
    end
  end

  def self.down
    drop_attached_file :posts, :drawing
  end
end
