class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :product_name
      t.boolean :global
      t.float :sender_fee
      t.float :sender_fee_percentage
      t.float :discount_percentage
      t.string :denomination_type
      t.string :recipient_currency_code
      t.float :min_recipient_denomination
      t.float :max_recipient_denomination
      t.string :sender_currency_code
      t.float :min_sender_denomination
      t.float :max_sender_denomination
      t.json :fixed_recipient_denominations
      t.json :fixed_sender_denominations
      t.json :fixed_recipient_to_sender_denominations_map
      t.json :logo_urls
      t.json :brand
      t.json :country
      t.json :redeem_instruction

      t.timestamps
    end
  end
end
