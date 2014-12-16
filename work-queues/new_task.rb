require 'bunny'

# Creating conection with hostname called rabbit.local
conn = Bunny.new(:hostname => "localhost")
conn.start

# Channel where data resides
ch = conn.create_channel

# Queue to publish messages
q = ch.queue("hello")

msg = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

q.publish(msg, :persistent => true)
puts " [x] Sent #{msg}"

conn.close