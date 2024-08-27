class TasksController < ApplicationController
  # Muestra todas las tareas
  def index
    @tasks = Task.all
  end
  # Muestra el formulario para crear una nueva tarea
  def new
    @task = Task.new
  end

  # Muestra los detalles de una tarea específica
  def show
    @task = Task.find(params[:id])
  end

  # Crea una nueva tarea
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task created successfully.'
    else
      render :new
    end
  end

  # Muestra el formulario para editar una tarea existente
  def edit
    @task = Task.find(params[:id])
  end

  # Actualiza una tarea existente
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task updated successfully.'
    else
      render :edit
    end
  end

  # Elimina una tarea
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task deleted successfully.'
  end

  private

  # Fuerte parámetros para la tarea
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
