class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.datetime :published_at

      t.timestamps
    end

    add_index :comments, :published_at
  end
end
