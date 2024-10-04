class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, only: %i[ update ]

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_list_path(@todo_list), notice: "Todo item was successfully created." }
      else
        format.html do
          flash.now.alert = "Failed to create todo item."
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to todo_list_path(@todo_list), notice: "Todo item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_todo_list
      @todo_list = TodoList.find(params.expect(:todo_list_id))
    end

    def set_todo_item
      @todo_item = @todo_list.todo_items.find(params.expect(:id))
    end

    def todo_item_params
      params.expect(todo_item: [ :name, :done ])
    end
end
