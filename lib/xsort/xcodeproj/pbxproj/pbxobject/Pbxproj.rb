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
            class PbxGroup
                attr_accessor :pbxBase, :children
                def initialize
                    @pbxBase = ""
                    @children = Array.new
                end
            end
        end
    end
end

module Xcodeproj
    module Pbxproj
        module PbxObject
            class PbxChild
                attr_accessor :name, :childPbx
                def initialize(name, childPbx)
                    @name = name
                    @childPbx = childPbx
                end
            end
        end
    end
end

module Xcodeproj
    module Pbxproj
        module PbxObject
            class Pbxproj
                def initialize(path, stdout)
                    @path = path
                    @stdout = stdout
                    @pbxGroups = Array.new
                end

                def parse ()

                    isPbxGroup = false
                    isPbxOneValue = false
                    isPbxChild = false
                    pbxValue = ""

                    begin
                        File.open(@path, "r") do |pbx|
                            pbx.each_line do |pbx_line|

                                if @stdout == true
                                    puts pbx_line
                                end

                                if pbx_line.index("/* End PBXGroup section */")
                                    isPbxGroup = false
                                end

                                # In PBX Group
                                if isPbxGroup == true

                                    if pbx_line.index(");")
                                        isPbxChild = false
                                    end

                                    if isPbxChild == true
                                        name = Emurate.emurates(pbx_line)
                                        @child = Xcodeproj::Pbxproj::PbxObject::PbxChild.new(name,pbx_line)
                                        @group.children.push(@child)
                                    end

                                    # Children
                                    if pbx_line.index("children = (")
                                        isPbxChild = true
                                    end

                                    if pbx_line.index(" = {")
                                        isPbxOneValue = true
                                        name = Emurate.emurates(pbx_line)
                                        @group = Xcodeproj::Pbxproj::PbxObject::PbxGroup.new                                        
                                    end

                                    if isPbxOneValue == true
                                        pbxValue << pbx_line
                                    end

                                    if pbx_line.index("};")
                                        isPbxOneValue = false
                                        @group.pbxBase = pbxValue
                                        @pbxGroups.push(@group)
                                        pbxValue = ""
                                    end
                                end

                                if pbx_line.index("/* Begin PBXGroup section */")
                                    isPbxGroup = true
                                end
                            end
                        end
                    rescue IOError => ioerr
                        puts "Error #{ioerr.message}"
                    rescue SystemCallError => sysCallErr
                        puts "Failuer: reason #{sysCallErr.message}"
                        puts "The entered path is invalid."
                    end
                end

                def pbxGroups
                    @pbxGroups
                end
            end
        end
    end
end
