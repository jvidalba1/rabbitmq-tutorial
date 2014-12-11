require 'bunny'

# Creating conection with hostname called rabbit.local
conn = Bunny.new
conn.start

# Channel where data resides
ch = conn.create_channel

# Queue to publish messages
q = ch.queue("hello")
ch.default_exchange.publish("Hello World!", :routing_key => q.name)
puts " [x] Sent Hello World!"

conn.close
