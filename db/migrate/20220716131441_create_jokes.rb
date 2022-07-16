class CreateJokes < ActiveRecord::Migration[7.0]
  def change
    create_table :jokes do |t|
      t.string :format, null: false
      t.text :content
      t.text :setup
      t.text :punchline

      t.timestamps
    end
  end
end
