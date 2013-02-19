module ApplicationHelper

	#http://ruby.zigzo.com/2011/10/02/flash-messages-twitters-bootstrap-css-framework/
	#を参考にしてflash-messageのtypeを設定する
	def twitterized_type(type)
	  case type
	    when :alert
	      "alert-block"
	    when :error
	      "alert-error"
	    when :notice
	      "alert-info"
	    when :success
	      "alert-success"
	    else
	      type.to_s
	  end
	end

end
