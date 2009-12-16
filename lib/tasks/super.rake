task :supermigrate => ['environment', 'db:migrate', 'db:test:prepare', 'db:seed'] do
  %x(cd #{RAILS_ROOT} && annotate)
end

task :superspec => ['spec', 'cucumber'] do
end
