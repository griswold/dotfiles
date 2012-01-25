require 'rake'

desc "The whole shebang. Fetches all dependences, compiles native code, and links
      the dotfiles into the proper places. Suggestion: run `rvm use system` before
      doing this, as Command-T likes to be linked against that"
task :full_install => %w( fetch_dependencies compile install )

desc "Hook our dotfiles into system-standard positions."
task :install do
  linkables = Dir.glob('*/**{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do

  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end
    
    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"` 
    end

  end
end

desc "Fetches all submodule dependencies"
task :fetch_dependencies do
  sh "git submodule init && git submodule update"
end

desc <<-EOD
    Compiles native code where necessary. Suggestion: run
    `rvm use system` before running this task, as command-t
    likes to be linked to 1.8.7 ruby apparently
    EOD
task :compile do
  dir = File.join(File.dirname(__FILE__), 'vim', 'vim.symlink', 'bundle', 'command-t')
  sh "cd #{dir} && rake make"
end

task :default => 'install'
