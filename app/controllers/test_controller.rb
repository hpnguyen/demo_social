require 'application_helper'
class TestController < ApplicationController
	def write_resque_log
		write_log(self.class.name, "Resque has been set successfully")
		render :text => "Resque has been set."
#		debugger
	end
end
