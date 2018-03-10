require "xsort/xcodeproj/pbxproj/pbxobject/Pbxproj"
require "xsort/xcodeproj/pbxproj/pbxobject/PbxSort"
require "xsort/xcodeproj/pbxproj/pbxobject/PbxWrite"
require "xsort/version"
require "xsort/option"

module Xsort
    class XsortMain
        def initialize (argv)
            @option = Option.new(argv)
        end

        def execute
            if @option.options.length == 0 && @option.path.length == 0
                puts "Usage: xsort [-v] [<path>] [-o] "
                puts "These are common detect commands used in various situations:"
                puts "xsort version: #{Xsort::VERSION}"
                puts "option:"
                puts "-v: display xsort version number"
                puts "-o: output result"
                puts "-r: Just extracting output.pbxproj will not write to pbxproj of Xcode project"
                puts "\n"
                puts "Regars !"
            elsif @option.options.length == 1 && @option.options[0] == "-v"
                puts "Version: #{Xsort::VERSION}"
            elsif @option.path.index("project.pbxproj")

                pbx = Xcodeproj::Pbxproj::PbxObject::Pbxproj.new(@option.path,@option.isOut)
                pbx.parse()
                sort = Xcodeproj::Pbxproj::PbxObject::PbxSort.new(pbx.pbxGroups)
                s = sort.psort
                write = Xcodeproj::Pbxproj::PbxObject::PbxWrite.new(@option.path,s,@option.isOut, @option.notOverWrite)
                write.overWrite
            else
                puts "(*_*).oO not pbxproj file"
                puts "must select pbxproj file"
                puts "($_$).oO omg"
            end
        end
    end
end
