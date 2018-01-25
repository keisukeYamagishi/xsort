class Option

    def initialize(argv)
        @isOut = false
        argvs = Array.new

        argv.each_with_index do |arg, i|
            argvs.push(arg)
        end

        @options = Array.new
        @path = ""
        argvs.each{|argv|
            if argv.index("-")
                if argv.index("o")
                    @isOut = true
                end
                @options.push(argv)
            else
                @path = argv
            end
        }
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

end
