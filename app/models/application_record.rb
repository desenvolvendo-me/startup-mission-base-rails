class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  Rails.logger.info('INSIDE APPLICATION RECORD')
  self.abstract_class = true

  def self.ransackable_attributes(_auth_object = nil)
    column_names + _ransackers.keys
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a|
      a.name.to_s
    } + _ransackers.keys
  end
end
