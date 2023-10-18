require 'simplecov'

SimpleCov.start 'rails' do
  minimum_coverage 35

  add_filter do |source_file|
    source_file.lines.count < 10
  end
  add_filter 'bin'
  add_filter 'vendor'
  add_filter 'config'
  add_filter 'app/admin'
  add_filter 'app/models/application_record.rb'

  add_group 'Businesses', 'app/business'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
end
