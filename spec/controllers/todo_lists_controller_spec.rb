require "rails_helper"

RSpec.describe TodoListsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      todo_list = TodoList.create!(name: "Test List")
      get :show, params: { id: todo_list.id }
      expect(response).to have_http_status(:success)
    end

    it "returns a 404 for an invalid id" do
      expect { get :show, params: { id: -1 } }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "POST #create" do
    it "creates a new todo list" do
      expect {
        post :create, params: { todo_list: { name: "New List" } }
      }.to change(TodoList, :count).by(1)
    end

    it "redirects to the root path after creation" do
      post :create, params: { todo_list: { name: "New List" } }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the todo list" do
      todo_list = TodoList.create!(name: "List to delete")
      expect {
        delete :destroy, params: { id: todo_list.id }
      }.to change(TodoList, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end
