class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[show edit update destroy clear]
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def index
    @todo_lists = TodoList.all
  end

  def show
  end

  def edit
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      redirect_to root_path, notice: "Todo list was successfully created."
    else
      flash.now[:alert] = "Failed to create todo list."
      render :new, status: :unprocessable_entity
    end
  end


  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: "Todo list was successfully updated." }
      else
        format.html do
          flash.now.alert = "Failed to update todo list."
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  def clear
    @todo_list.todo_items.done.destroy_all
    redirect_to todo_list_path(@todo_list), notice: "Done todo items were successfully cleared."
  end

  def destroy
    @todo_list.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, status: :see_other, notice: "Todo list was successfully destroyed." }
    end
  end

  private

    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:name)
    end
end
