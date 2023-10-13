module ApplicationHelper

  def convert_to_id(resource)
    resource.to_s.parameterize.concat("-" + resource.id.to_s)
  end
end
