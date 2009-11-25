require "spec/runner/formatter/base_formatter"

class GrowlFormatter < Spec::Runner::Formatter::BaseFormatter
  UNIT_THRESHOLD = 0.25
  INTEGRATION_THRESHOLD = 0.4

  def start(example_count)
    @total       = example_count
    @failures    = 0
    @pending     = 0
    @error_state = :all_passing

    play_sound("run_command")
  end

  def example_started(example)
    super
    @start_time = Time.now
  end

  def example_group_started(example_group_proxy)
    @example_group = example_group_proxy
  end

  def example_passed(example)
    print_warning_if_slow(@example_group.description, example.description, example.location, Time.now - @start_time)
  end

  # third param is optional, because earlier versions of rspec sent only two args
  def example_pending(example, message, deprecated_pending_location=nil)
    @error_state = :some_pending unless @error_state == :some_failed
    @pending += 1
  end

  def example_failed(example, counter, failure)
    @error_state = :some_failed
    @failures += 1
  end

  def print_warning_if_slow(group, example, location, elapsed)
    if location.include?("spec/integration")
      return unless elapsed > INTEGRATION_THRESHOLD
    else
      return unless elapsed > UNIT_THRESHOLD
    end
    display_message("Slow Spec: #{sprintf("%d", elapsed * 1000)}ms", "#{group} #{example}", nil, true)
  end

  def start_dump
    case @error_state
    when :some_failed
      display_message("Examples Failed!", summary, "fail")
      play_sound("red")
    when :some_pending
      display_message("Examples Pending!", summary, "pending")
      play_sound("ran_command")
    when :all_passing
      display_message("Examples Passed!", summary, "pass")
      play_sound("ran_command")
    end
  end

  def summary
    if @failures == 1
      "#{@total} examples, #{@failures} failure, #{@pending} pending"
    else
      "#{@total} examples, #{@failures} failures, #{@pending} pending"
    end
  end

  def method_missing(sym, *args)
    # ignore
  end

private

  def silent_detached_exec(command)
    puts "Running: #{command}"
    Kernel.silence_stream(STDOUT) do
      Kernel.silence_stream(STDERR) do
        fork do
          exec command
        end
      end
    end
  end

  def play_sound(name)
    path = File.dirname(__FILE__) + "/sounds/#{name}.mp3"
    silent_detached_exec "mpg123 #{path}"
  end

  def display_message(message, extra, filename = nil, sticky = false)
    command = "growlnotify -n autotest"

    if filename
      path = File.dirname(__FILE__) + "/icons/#{filename}.png"
      command += " --image #{path}"
    end

    command += " -s" if sticky
    command += " -m '#{extra}'"
    command += " '#{message}'"
    silent_detached_exec command
  end
end
