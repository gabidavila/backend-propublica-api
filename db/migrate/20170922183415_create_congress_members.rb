class CreateCongressMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :congress_members do |t|
      t.integer :congress, null: false, default: 115
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :pp_member_id, null: false
      t.string :twitter_handle
      t.string :party, length: 1, null: false
      t.string :state, length: 2, null: false
      t.jsonb :general_response_api, null: false, default: {}
      t.jsonb :member_profile_response_api, null: false, default: {}

      t.timestamps
    end
  end
end
