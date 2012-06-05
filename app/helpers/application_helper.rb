module ApplicationHelper
  #write a log using Resque
  def write_log(id,message,class_name = "ResqueLog")
  	if class_name == "ResqueLog"
  		Resque.enqueue(ResqueLog, id, message)	
  	end	
  end
end
