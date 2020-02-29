# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :FirstName
      t.string :LastName
      t.string :email
      t.integer :PhoneNumber

      t.timestamps
    end
  end
end
