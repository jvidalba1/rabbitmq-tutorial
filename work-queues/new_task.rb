require 'bunny'

# Creating conection with hostname called rabbit.local
conn = Bunny.new(:hostname => "localhost")
conn.start

# Channel where data resides
ch = conn.create_channel

# Queue to publish messages, with durable true messages doesnot lose
q = ch.queue("task_queue", :durable => true)

msg = ARGV.empty? ? "Hello World!" : ARGV.join(" ")

q.publish(msg, :persistent => true)
puts " [x] Sent #{msg}"

sleep 1.0
conn.close