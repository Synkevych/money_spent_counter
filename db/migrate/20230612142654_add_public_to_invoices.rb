class AddPublicToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :public, :boolean, default: false
  end
end
