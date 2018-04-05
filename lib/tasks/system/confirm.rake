task :confirm do
  confirm_token = rand(36**6).to_s(36)
  STDOUT.puts "This is a destructive task.  Continue? Enter '#{confirm_token}' to confirm:"
  input = STDIN.gets.chomp
  raise "Aborting. You entered #{input}" unless input == confirm_token
end
