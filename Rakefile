desc "install the dot files into user's home directory"
task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      print "overwrite ~/.#{file}? [ynq] "
      case $stdin.gets.chomp
      when 'y'
        replace_file(file)
      when 'q'
        exit
      else
        puts "skipping ~/.#{file}"
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end