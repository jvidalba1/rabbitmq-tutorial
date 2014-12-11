require 'bunny'

# Creating conection with hostname called rabbit.local
conn = Bunny.new(:hostname => "localhost")
conn.start

# Channel where data resides
ch = conn.create_channel

# Queue to publish messages
q = ch.queue("hello")


while true do
  puts "Write a message to send: "
  message = gets.chomp
  if message == "exit"
    conn.close
    break
  end
  ch.default_exchange.publish(message, :routing_key => q.name)
  puts " [x] Sent #{message}"
end


