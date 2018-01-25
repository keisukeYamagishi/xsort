#! /usr/bin/ruby

require "./xcodeproj/pbxproj/pbxobject/Pbxproj"
require "./xcodeproj/pbxproj/pbxobject/PbxSort"
require "./xcodeproj/pbxproj/pbxobject/PbxWrite"
require "./version"
require "./option"

option = Option.new(ARGV)

puts option.path

if option.options.length == 0 && option.path.length == 0
    puts "Usage: xsort [-v] [<path>] [-o] "
    puts "These are common detect commands used in various situations:"
    puts "xsort version: #{Xsort::VERSION}"
    puts "option:"
    puts "-v: display xsort version number"
    puts "-o: output result"
    puts "\n"
    puts "Regars !"
elsif option.options.length == 1 && option.options[0] == "-v"
    puts "Version: #{Xsort::VERSION}"
elsif option.path.index(".pbxproj")
    pbx = Pbxproj.new(option.path,option.isOut)
    pbx.parse()
    sort = PbxSort.new(pbx.pbxGroups)
    s = sort.psort
    write = PbxWrite.new(s,option.isOut)
    write.overWrite
else
    puts "must select pbxproj file"
end
