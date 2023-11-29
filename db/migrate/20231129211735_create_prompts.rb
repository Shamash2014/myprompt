class CreatePrompts < ActiveRecord::Migration[7.1]
  def change
    create_table :prompts do |t|
      t.text :prompt
      t.string :_dlt_id
      t.string :_dlt_load_id

    end
  end
end
