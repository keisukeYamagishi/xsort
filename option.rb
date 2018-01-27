class Option

    def initialize(argv)
        @isOut = false
        argvs = Array.new
        @notOverWrite = false

        argv.each_with_index do |arg, i|
            argvs.push(arg)
        end

        @options = Array.new
        @path = ""
        argvs.each{|argv|
            if argv.index("-")

                if argv == "-o"
                    @isOut = true
                elsif argv == "-r"
                    @notOverWrite = true
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

    def options
        @options
    end

    def path
        @path
    end

    def isOut
        @isOut
    end

    def notOverWrite
        @notOverWrite
    end

end
