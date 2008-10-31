
module Commander
  module Interaction
    
    def log(msg)
      puts "... #{msg}" 
    end

    def say(msg)
      puts "    #{msg}"
    end
    
    def confirm(msg)
      case ask(msg)
        when /^y|yes$/ then true
        when /^n|no$/ then false
        else confirm msg
      end
    end
    
    def ask(msg)
      print "    #{msg} "
      value = stdin.gets.gsub /\n/, ''
      value
    end
    
    def ask_for_list(msg)
      msg += "\n     " and ask(msg).split
    end
    
    def stdin
      Commander::Manager.instance.info[:stdin] || STDIN
    end
  end
end