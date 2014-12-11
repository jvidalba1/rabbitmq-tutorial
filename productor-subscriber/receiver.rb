require 'bunny'

conn = Bunny.new
conn.start

ch = conn.create_channel
q = ch.queue("hello")

puts " [x] Waiting for messages in #{q.name}. To exit press CTRL+C"
q.subscribe(:block => true) do |delivery_info, properties, body|
  # puts " [!] delivery info => #{delivery_info}"
  # puts " [!] properties => #{properties}"
  puts " [x] Received #{body}"

  # cancel the consumer to exit
  # delivery_info.consumer.cancel
end