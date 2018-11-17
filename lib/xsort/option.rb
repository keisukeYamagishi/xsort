class Option

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
            if argv.index("-")

                if argv == "-o"
                    @stdout = true
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

    def stdout
        @stdout
    end

    def notOverwrite
        @notOverwrite
    end

end
