require "rails_helper"

RSpec.describe TodoItem, type: :model do
  let(:todo_list) { TodoList.create(name: "Example List") }

  it "is valid with valid attributes" do
    todo_item = TodoItem.new(name: "Example task", done: false, todo_list: todo_list)
    expect(todo_item).to be_valid
  end

  it "is invalid without a name" do
    todo_item = TodoItem.new(name: nil, todo_list: todo_list)
    expect(todo_item).not_to be_valid
  end
  
end
