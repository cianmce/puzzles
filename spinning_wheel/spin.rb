require "pry"

def play_game(num_segments:)
  total = 0
  while (value = rand(num_segments)) > 0
    total += value
  end
  total
end

def run_simulation(num_plays:, num_segments:)
  start_time = Time.now
  total_sum = num_plays.times.collect { play_game(num_segments: num_segments) }.sum
  avg_sum = total_sum / num_plays.to_f
  avg_sum_rounded = avg_sum.round
  {
    num_plays: num_plays,
    num_segments: num_segments,
    total_sum: total_sum,
    avg_sum: avg_sum,
    avg_sum_rounded: avg_sum_rounded,
    time: Time.now - start_time
  }
end

2.upto(100) do |num_segments|
  info = run_simulation(num_plays: 1000000, num_segments: num_segments)
  j info
  puts "[#{num_segments}] expected gain: €#{info[:avg_sum_rounded]}"
end

