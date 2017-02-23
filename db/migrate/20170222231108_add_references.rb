class AddReferences < ActiveRecord::Migration[5.0]
  def change
    change_table :posts do |t|
      t.belongs_to :user, index: true
    end

    change_table :comments do |t|
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true
    end
  end
end
