# -*- ruby -*-

$TESTING_MINIUNIT = true

require 'rubygems'
require 'hoe'

Hoe.plugin :seattlerb

Hoe.spec 'minitest-macruby-pride' do
  developer 'Ryan Davis', 'ryand-ruby@zenspider.com'
  developer 'Mark Rada', 'mrada@marketcircle.com'

  self.rubyforge_name = "bfts"
  self.testlib = :minitest
end

def loc dir
  system "find #{dir} -name \\*.rb | xargs wc -l | tail -1"
end

desc "stupid line count"
task :dickwag do
  puts
  puts "miniunit"
  puts
  print " lib  loc"; loc "lib"
  print " test loc"; loc "test"
  print " totl loc"; loc "lib test"
  print " flog = "; system "flog -s lib"

  puts
  puts "test/unit"
  puts
  Dir.chdir File.expand_path("~/Work/svn/ruby/ruby_1_8") do
    print " lib  loc"; loc "lib/test"
    print " test loc"; loc "test/testunit"
    print " totl loc"; loc "lib/test test/testunit"
    print " flog = "; system "flog -s lib/test"
  end
  puts
end

if Kernel.const_defined? :MACRUBY_REVISION
  if MACRUBY_REVISION.match /^git commit/
    require 'rake/compiletask'
    Rake::CompileTask.new do |t|
      t.files = FileList['lib/**/*.rb']
      t.verbose = true
    end
  end
end

# vim: syntax=Ruby
