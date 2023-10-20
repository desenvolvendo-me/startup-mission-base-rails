ActiveAdmin.register Goal do
  menu parent: 'Gestão'
  permit_params :name, :description,
                tasks_attributes: %i[id name status description _destroy]

  show do
    attributes_table do
      row :name
      row :description
    end

    panel 'Tarefas' do
      table_for goal.tasks do
        column :name
        column :description
        column :status do |task|
          status_tag task.status, class: task.status.to_s
        end
      end
    end
  end

  form do |f|
    f.inputs 'Meta' do
      f.input :name
      f.input :description
    end

    f.inputs 'Detalhes das Tarefas' do
      f.has_many :tasks, allow_destroy: true, heading: 'Tarefas' do |task|
        task.input :name
        task.input :description
        task.input :status, as: :select, collection: Task.statuses.keys
      end
    end

    f.actions
  end
end
