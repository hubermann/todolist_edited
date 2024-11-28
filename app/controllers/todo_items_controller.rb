class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, only: %i[update]
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)
    if @todo_item.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to todo_list_path(@todo_list), notice: "Todo item was successfully created." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("todo_item_form", partial: "todo_items/form", locals: { todo_item: @todo_item }) }
        format.html { redirect_to todo_list_path(@todo_list), alert: "Failed to create todo item." }
      end
    end
  end
  
  
  

  def update
    if @todo_item.update(todo_item_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @todo_list, notice: "Todo item updated." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@todo_item, partial: "todo_items/todo_item", locals: { todo_item: @todo_item }) }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  

  private

    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def set_todo_item
      @todo_item = @todo_list.todo_items.find(params[:id])
    end

    def todo_item_params
      params.require(:todo_item).permit(:name, :done)
    end
    
end
