begin
  IRB.conf[:AUTO_INDENT]  = true

  # Tab completion
  require 'irb/completion'
  IRB.conf[:USE_READLINE] = true

  # Histories
  require 'irb/ext/save-history'
  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:EVAL_HISTORY] = 100

  # Prompts
  IRB.conf[:PROMPT_MODE] = :SIMPLE

  require 'pp'
rescue Object => ex
  puts "ERROR in .irbrc: #{ex.inspect}"
end