ActiveAdmin.register Task do
  menu parent: 'Gestão'
  permit_params :name, :description, :status

  index do
    id_column
    column :name
    column :description
    column :status do |task|
      status_tag task.status, class: task.status.to_s
    end
    actions
  end

  show :title => proc { |task| task.name } do
    attributes_table do
      row :name
      row :description
      row :status do |task|
        status_tag task.status, class: task.status.to_s
      end
    end
  end

  form :title => :name do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :status, as: :select, collection: Task.statuses.keys
    end
    f.actions
  end
end
