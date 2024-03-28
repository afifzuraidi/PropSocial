class CreateCustomerApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_applications do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :status, null: false, default: "Pending"

      t.timestamps
    end
  end
end
