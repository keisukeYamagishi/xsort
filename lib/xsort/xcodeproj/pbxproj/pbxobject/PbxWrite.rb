module Xcodeproj
    module Pbxproj
        module PbxObject

            class PbxWrite

                def initialize(path,pbx, out,write)
                    @pbx = pbx
                    @isOut = out
                    @path = path
                    @write = write
                end

                def overWrite
                    isPbxGroup = false
                    pbxValue = ""
                    num = 0

                    begin
                        File.open(@path, "r") do |pbx|
                            pbx.each_line do |pbx_line|

                                if pbx_line.index("/* End PBXGroup section */")
                                    sorted = @pbx.join
                                    sorted << pbx_line
                                    pbx_line = sorted
                                    isPbxGroup = false
                                end

                                if isPbxGroup == true
                                    pbx_line = ""
                                end

                                if pbx_line.index("/* Begin PBXGroup section */")
                                    isPbxGroup = true
                                end

                                pbxValue << pbx_line
                            end
                        end

                        if @isOut == true
                            puts pbxValue
                        end

                        writeFile(pbxValue)

                    rescue IOError => ioerr
                        puts "Error #{ioerr.message}"
                    rescue SystemCallError => sysCallErr
                        puts "Failuer: reason #{sysCallErr.message}"
                        puts "The entered path is invalid."
                    end
                end

                def writeFile(value)
                    if @write == true
                        @path = "./output.pbxproj"
                    end
                    File.open(@path,"w") do |write|
                        write.puts(value)
                    end
                end
            end
        end
    end
end
