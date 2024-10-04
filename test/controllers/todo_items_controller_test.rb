require "test_helper"

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_list = todo_lists(:one)
    @todo_item = todo_items(:one)
  end

  test "should enqueue CreateTodoItemJob" do
    assert_difference("TodoItem.count") do
      post todo_list_todo_items_url(@todo_list), params: { todo_item: { name: "New Todo Item" } }
    end

    assert_redirected_to todo_list_url(@todo_list)
  end

  test "should update todo_item" do
    patch todo_list_todo_item_url(@todo_list, @todo_item), params: { todo_item: { done: true } }
    assert_redirected_to todo_list_url(@todo_list)
  end
end
