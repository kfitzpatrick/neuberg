task :supermigrate => ['environment', 'db:migrate', 'db:test:prepare', 'db:seed'] do
  %x(cd #{RAILS_ROOT} && annotate)
end

task :superspec => ['spec', 'cucumber'] do
end

Rake.application.instance_variable_get('@tasks').delete('default')

task :default => :superspec