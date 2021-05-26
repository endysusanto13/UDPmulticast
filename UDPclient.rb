require 'socket'

s = UDPSocket.new


s.send("ADD 100", 0, 'localhost', 3000)
sleep(2)
s.send("INT 10", 0, 'localhost', 4000)
sleep(2)
s.send("ADD 100", 0, 'localhost', 4000)
sleep(2)
s.send("INT 10", 0, 'localhost', 3000)
sleep(2)
s.send("END", 0, 'localhost', 3000)
s.send("END", 0, 'localhost', 4000)
