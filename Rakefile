# task only show hello!!
task :hello do
  puts 'hello!!'
end

desc "create symbolic link about dotfiles"
task :link_dotfiles do
  # カレントのファイルを取得
  Dir::entries(Dir::pwd).each do |file|
    # Skip not dotfiles
    unless file =~ /^\..{2,}$/
      puts "skip: #{file}"
      next
    end

    puts "execute command"
    cmd = "ln -fs #{Dir::pwd}/#{file} ~/#{file}" 
    puts cmd
    print `#{cmd}`
  end 
end