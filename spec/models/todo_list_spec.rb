require "rails_helper"

RSpec.describe TodoList, type: :model do
  it "is valid with a valid name" do
    todo_list = TodoList.new(name: "My Todo List")
    expect(todo_list).to be_valid
  end

  it "is invalid without a name" do
    todo_list = TodoList.new(name: nil)
    expect(todo_list).not_to be_valid
  end

  it "destroys associated todo_items when deleted" do
    todo_list = TodoList.create(name: "List with items")
    todo_list.todo_items.create(name: "Task 1", done: false)
    todo_list.todo_items.create(name: "Task 2", done: true)

    expect { todo_list.destroy }.to change { TodoItem.count }.from(2).to(0)
  end

  
end
