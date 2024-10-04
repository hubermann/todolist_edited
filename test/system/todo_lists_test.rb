require "application_system_test_case"

class TodoListsTest < ApplicationSystemTestCase
  setup do
    @todo_list = todo_lists(:one)
  end

  test "visiting the index" do
    visit todo_lists_url
    assert_selector "h1", text: "Todo lists"
  end

  test "should create todo list" do
    visit todo_lists_url

    fill_in "New todo list...", with: "New Todo List"
    click_on "Create"

    assert_text "Todo list was successfully created"
    assert_text "New Todo List"
  end

  test "should update Todo list" do
    visit todo_list_url(@todo_list)
    click_on "Edit", match: :first

    fill_in "Name", with: "Updated Todo List Name"
    click_on "Update"

    assert_selector "h1", text: "Updated Todo List Name"
  end

  test "should destroy Todo list" do
    visit todo_list_url(@todo_list)
    accept_confirm { click_on "Delete", match: :first }

    assert_text "Todo list was successfully destroyed"
  end
end
