task :stop do
  begin
    pid_file = 'tmp/pids/server.pid'
    pid = File.read(pid_file).to_i
    Process.kill 'INT', pid
    File.delete pid_file
  rescue => e
    puts "Failed to stop: #{e.message}"
  end
end

task :start do
  Rake::Task['db:migrate'].invoke
  Rake::Task['assets:precompile'].invoke
  sh "rails s -d -p 3003"
end

task :restart => [:stop, :start]
