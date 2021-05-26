require 'socket'
load './config.rb'

@s = UDPSocket.new
@s.bind($hostP1, $portP1)       

@account = 1000
@timeP1 = 0

def local_event()
  @timeP1 += 1
  puts "Executing event, current time is #{@timeP1}."
end

def updateP2()
  @s.send("UPD #{@account}", 0, $hostP2, $portP2)
  @s.send("TIM #{@timeP1}", 0, $hostP2, $portP2)
end

loop do
  text, sender = @s.recvfrom(16)
  
  case text[0..2]
  when "ADD"
    local_event()
    @account += text[4..15].to_i
    puts "Updated account balance is #{@account}"
    updateP2()
  when "INT"
    local_event()
    @account *= (1 + (text[4..15].to_f)/100)
    puts "Updated account balance is #{@account}"
    updateP2()
  when "TIM"
    timeP2 = text[4..15].to_i
    @timeP1 = timeP2 if @timeP1 < timeP2 
    @timeP1 += 1
    puts "Message received. Current time is #{@timeP1}."
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