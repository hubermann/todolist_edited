require "application_system_test_case"

class TodoItemsTest < ApplicationSystemTestCase
  setup do
    @todo_list = todo_lists(:one)
    @todo_item = todo_items(:one)
  end

  test "visiting the index" do
    visit todo_list_url(@todo_list)
    assert_text "My First Todo Item"
  end

  test "should create todo item" do
    visit todo_list_url(@todo_list)

    fill_in "New todo item...", with: "New Todo Item"
    click_on "Create"

    assert_text "New Todo Item"
  end

  test "should update Todo item" do
    visit todo_list_url(@todo_list)

    check "My First Todo Item"

    assert_selector "input:checked"
  end
end
