class CreateTodoItems < ActiveRecord::Migration[8.0]
  def change
    create_table :todo_items do |t|
      t.references :todo_list, null: false, foreign_key: true
      t.string :name
      t.boolean :done

      t.timestamps
    end
  end
end
