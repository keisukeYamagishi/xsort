#(☝ ՞ਊ ՞）☝------------------------------------------------------------------===#
#
# This source file is part of the xsort open source project
#
# Copyright (c) 2018 -  Keisuke Yamagishi. project authors
# Licensed under MIT LICENCE
#
# See https://github.com/keisukeYamagishi/xsort/blob/master/LICENSE.txt for license information
#
#===------------------------------------------------------------------(☝ ՞ਊ ՞）☝/

##
class Option
    attr_accessor :options, :path, :stdout, :notOverwrite
    def initialize(argv)
        @stdout = false
        argvs = Array.new
        @notOverwrite = false

        argv.each_with_index do |arg, i|
            argvs.push(arg)
        end

        @options = Array.new
        @path = ""
        argvs.each{|argv|
            if !argv.index(".xcodeproj")
                if argv == "-o"
                    @stdout = true
                elsif argv == "-r"
                    @notOverwrite = true
                end
                @options.push(argv)
            else
                @path = createPath(argv)
            end
        }
    end

    def createPath(path)
        if path.index(".pbxproj")
            return path
        else
            pbxproj = path.dup
            pbxproj << "/project.pbxproj"
            return pbxproj
        end
    end
end
