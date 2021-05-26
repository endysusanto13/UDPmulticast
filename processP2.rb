require 'socket'
load './config.rb'

@s = UDPSocket.new
@s.bind($hostP2, $portP2)       

@account = 1000
@timeP2 = 0

def local_event()
  @timeP2 += 1
  puts "Executing event, current time is #{@timeP2}."
end

def updateP1()
  @s.send("UPD #{@account}", 0, $hostP1, $portP1)
  @s.send("TIM #{@timeP2}", 0, $hostP1, $portP1)
end

loop do
  text, sender = @s.recvfrom(16)
  
  case text[0..2]
  when "ADD"
    local_event()
    @account += text[4..15].to_i
    puts "Updated account balance is #{@account}"
    updateP1()
  when "INT"
    local_event()
    @account *= (1 + (text[4..15].to_f)/100)
    puts "Updated account balance is #{@account}"
    updateP1()
  when "TIM"
    timeP1 = text[4..15].to_i
    @timeP2 = timeP1 if @timeP2 < timeP1 
    @timeP2 += 1
    puts "Message received. Current time is #{@timeP2}."
    puts "Updated account balance is #{@account}"
  when "UPD"
    @account = text[4..15].to_i
  when "END"
    puts "Final balance is #{@account}"
    break
  else
    puts "Invalid input"
    next
  end

end