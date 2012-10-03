
module Tw::App
  class Render
    def self.color_code(str)
      colors = Sickill::Rainbow::TERM_COLORS.keys - [:default, :black, :white]
      n = str.each_byte.map{|c| c.to_i}.inject{|a,b|a+b}
      return colors[n%colors.size]
    end
    
    def self.display(arr)
      arr.flatten.sort{|a,b|
        a[:id] <=> b[:id]
      }.uniq.each{|m|
        user = m[:user].kind_of?(Hash) ? "@#{m[:user][:from]} > @#{m[:user][:to]}" : "@#{m[:user]}"
        line = "#{m[:time].strftime '[%m/%d %a] (%H:%M:%S)'} #{user} : #{m[:text]}"
        puts line.colorize(/@[a-zA-Z0-9_]+/)
      }
    end
  end
end
