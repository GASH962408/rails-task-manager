Rails.application.routes.draw do
  # Mostrar todas las tareas
  get 'tasks', to: 'tasks#index'

  # Mostrar los detalles de una tarea específica
  get 'tasks/:id', to: 'tasks#show', as: :task

  # Mostrar el formulario para crear una nueva tarea
  get 'tasks/new', to: 'tasks#new', as: :new_task
  post 'tasks', to: 'tasks#create'

  # Mostrar el formulario para editar una tarea existente
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch 'tasks/:id', to: 'tasks#update'

  # Eliminar una tarea
  delete 'tasks/:id', to: 'tasks#destroy'
end
