class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :image_link
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
