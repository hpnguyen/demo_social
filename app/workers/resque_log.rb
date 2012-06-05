class ResqueLog
  @queue = :log_queue

  def self.perform(id, message)
  	my_time = Time.now
  	begin  
  		if message.kind_of?(Array)
  			message.each do |item|
  				puts "[#{my_time.to_datetime}] #{id} : #{item}"  				
  			end
  		else
  			puts "[#{my_time.to_datetime}] #{id} : #{message}"
  		end

	rescue Exception => e
	  	puts "[#{my_time.to_datetime}] #{id} : Error message: #{e.message}"
	    raise
	end  	    
  end
end

