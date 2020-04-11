require 'pry'
require 'optparse'

def number_string(num)
  num.to_s.reverse.scan(/\d{3}|.+/).join(",").reverse
end

def get_envelopes(randomize_values:)
  if randomize_values
    smaller_value = rand(1..1000) * 10
    envelopes = [smaller_value, smaller_value * 2]
  else
    envelopes = [100, 200]
  end
  envelopes.shuffle
end

def print_gain(money_made_changing:, money_made_sticking:)
  percent_gain = ((money_made_changing - money_made_sticking) * 100.0 / money_made_sticking).round(4)
  puts "I've made €#{number_string(money_made_changing)} from changing vs €#{number_string(money_made_sticking)} if I stuck"
  puts "Gain: #{percent_gain}%"
end

def run_simulation(run_count: 100000, verbose: false, randomize_values: true)
  puts "Randomize values: #{randomize_values}"
  puts "Total iterations: #{number_string(run_count)}"
  start_time = Time.now
  money_made_changing = 0
  money_made_sticking = 0

  run_count.times do |i|
    envelopes = get_envelopes(randomize_values: randomize_values)
    choice_index = rand(0..1)
    choice_value = envelopes[choice_index]
    money_made_sticking += choice_value

    if verbose
      puts "I chose envelope: ##{choice_index} which has €#{number_string(choice_value)}"
      puts "The other box either has €#{choice_value * 2} or €#{number_string(choice_value / 2)} or"
    end

    choice_index = choice_index == 0 ? 1 : 0
    choice_value = envelopes[choice_index]
    money_made_changing += choice_value

    if verbose
      puts "I'm changing my guess to: ##{choice_index} which has €#{number_string(choice_value)}"
      print_gain(money_made_changing: money_made_changing, money_made_sticking: money_made_sticking)
    end
  end

  print_gain(money_made_changing: money_made_changing, money_made_sticking: money_made_sticking)
  puts "Time: #{Time.now - start_time} seconds"
end

options = {run_count: 1_000_000, verbose: false, randomize_values: true}

OptionParser.new do|opts|
  opts.banner = "Usage: bundle exec ruby envelopes.rb [options]"
  opts.on('-c', '--count 10000', 'Number of iterations') do |run_count|
    options[:run_count] = Integer(run_count)
  end

  opts.on('-v', '--verbose false', 'Display verbose info per run') do |verbose|
    options[:verbose] = verbose.downcase == 'true'
  end

  opts.on('-r', '--randomize true', 'Randomizes the values in the envelopes on each run') do |randomize_values|
    options[:randomize_values] = randomize_values.downcase == 'true'
  end

  opts.on('-h', '--help', 'Displays Help') do
    puts opts
    exit
  end
end.parse!

run_simulation(**options)
