class TodosController < ApplicationController
  before_action :find_todo, :only =>[ :show, :edit, :update, :destroy, :check]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_url
    else
      render :action => :new
    end
  end

  def update

    if @todo.update_attributes(todo_params)
      redirect_to todo_path(@todo)
    else
      render :action => :edit
    end
  end

  def destroy
    if @todo.due_date > Date.today
      @todo.destroy
      flash[:notice] = "Delete"
      redirect_to todos_url
    else
      flash[:notice] = "Over Due Date"
      redirect_to todos_url
    end
  end

  def check
    @todo.update(check: !(@todo.check))
  end

  private

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :due_date, :note)
  end
end
