require "minitest/unit"

##
# Show your testing pride!

class PrideIO
  attr_reader :io

  # stolen from /System/Library/Perl/5.10.0/Term/ANSIColor.pm
  COLORS = (31..36).to_a
  COLORS_SIZE = COLORS.size
  CHARS = ["*"]
  CHARS_SIZE = CHARS.size

  def initialize io
    @io = io
    @colors = COLORS
    @chars  = CHARS
    @index  = 0
  end

  def print o
    case o
    when "." then
      @index += 1
      io.print "\e[#{@colors[@index % COLORS_SIZE]}m#{@chars[@index % CHARS_SIZE]}\e[0m"
    when "E", "F" then
      io.print "\e[41m\e[37m#{o}\e[0m"
    else
      io.print o
    end
  end

  def method_missing msg, *args
    io.send(msg, *args)
  end
end

MiniTest::Unit.output = PrideIO.new(MiniTest::Unit.output)
