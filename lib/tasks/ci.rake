namespace :ci do
  task :copy_yml do
    %x{cp #{Rails.root}/config/database.yml.example #{Rails.root}/config/database.yml}
  end

  task :build => ['ci:copy_yml', 'db:migrate', 'superspec'] do
  end
end
