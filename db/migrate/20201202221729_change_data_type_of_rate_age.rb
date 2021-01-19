class ChangeDataTypeOfRateAge < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :rate_age, :string

  end
end
