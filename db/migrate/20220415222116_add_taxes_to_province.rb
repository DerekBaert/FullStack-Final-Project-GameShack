class AddTaxesToProvince < ActiveRecord::Migration[7.0]
  def change
    add_column :provinces, :gst, :float
    add_column :provinces, :pst, :float
    add_column :provinces, :hst, :float
  end
end
