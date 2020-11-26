class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :title
      t.text :description
      t.string :category
      t.decimal :amount
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
