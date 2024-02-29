class AddBioToMotorcircles < ActiveRecord::Migration[7.1]
  def change
    add_column :motorcircles, :bio, :text
  end
end
