require "./xsort"
require "./PbxSort"
require "./PbxWrite"
# start = Time.now
# str = ""
# str << "abc"
# str << "edf"
#
# puts str
# puts "String#<<  : #{Time.now - start}[sec]"
#
puts "\nParser Before Write\n"
p = Pbxproj.new("project.pbxproj")
p.parse()
#
# puts "\n\n SORT Before\n\n"
#
# p.pbxGroups.each{ |pbx|
#     # puts "parent PBX"
#     # puts pbx.parentName
#     # puts pbx.parentUUID
#     # puts pbx.parentPbx
#     # puts pbx.parentPbx
#     # puts pbx.parentName
#     # puts pbx.parentUUID
#     # puts pbx.pbxBase
#     # puts "children"
#     pbx.children.each {|pbx|
#         # puts pbx.uuid
#         # puts pbx.name
#         puts pbx.childPbx
#     }
#     # puts pbx.children
# }

# puts "\n\n After Sort"

sort = PbxSort.new(p.pbxGroups)

s = sort.psort
puts "After Sortted"
write = PbxWrite.new(s)
write.overWrite
