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

module Xcodeproj
    module Pbxproj
        module PbxObject

            class PbxWrite

                def initialize(path,pbx, stdout,write)
                    @pbx = pbx
                    @stdout = stdout
                    @path = path
                    @write = write
                end

                # We will overwrite the pbxobject that re-sorted Xcode's xcodeproj into a file.
                #
                #
                def overWrite
                    isPbxGroup = false
                    pbxValue = ""
                    num = 0
                    isSuccess = true
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

                        if @stdout == true
                            puts pbxValue
                        end

                        writeFile(pbxValue)

                    rescue IOError => ioerr
                        isSuccess = false
                        puts "Error \e[31m#{ioerr.message}\e[0m"
                    rescue SystemCallError => sysCallErr
                        isSuccess = false
                        puts "Failuer! reason: \n\e[31m#{sysCallErr.message}\e[0m"
                        puts "The entered path is invalid."
                    end
                    if isSuccess == true
                        puts "\e[36mXsort Successful (☝ ՞ਊ ՞）☝!!!\e[0m"
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
