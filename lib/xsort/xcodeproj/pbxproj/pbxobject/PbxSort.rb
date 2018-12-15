#(☝ ՞ਊ ՞）☝------------------------------------------------------------------===#
#
# This source file is part of the xsort open source project
#
# Copyright (c) 2018 -  Keisuke Yamagishi. project authors
# Licensed under MIT LICENCE
#
# See https://github.com/keisukeYamagishi/xsort/blob/develop/LICENSE.txt for license information
#
#===------------------------------------------------------------------(☝ ՞ਊ ՞）☝/

module Xcodeproj
    module Pbxproj
        module PbxObject
            class PbxSort

                def initialize(pbxs)
                    @pbxs = pbxs
                end

                def psort

                    sorteds = Array.new
                    productPbx = ""

                    @pbxs.each{ |pbx|
                        # puts "parent PBX"
                        # puts pbx.parentName
                        # puts pbx.parentUUID
                        # puts pbx.parentPbx
                        # puts pbx.parentPbx
                        # puts pbx.parentName
                        # puts pbx.parentUUID
                        # ->> puts pbx.pbxBase
                        # puts "children"

                        sort = pbx.children.sort{|pbx1, pbx2|
                            pbx1.name <=> pbx2.name
                        }

                        child = Array.new
                        sort.each {|pbx|

                            if pbx.name == "Products"
                                productPbx = pbx.childPbx
                            else
                                child.push(pbx.childPbx)
                            end
                            # child.push(pbx.childPbx)
                            # puts pbx.uuid
                            # puts pbx.name
                            # ->> puts pbx.childPbx
                        }

                        if productPbx.length != 0
                            child.push(productPbx)
                            productPbx = ""
                        end

                        sorteds.push(childrenSort(pbx.pbxBase,child))

                    }
                    return sorteds
                end

                def childrenSort (children, sort)
                    pbx = ""
                    pbxSplit = children.split("\n")
                    isPbxChild = false
                    num = 0
                    pbxSplit.each{|pbxLine|

                        if pbxLine.index(");")
                            isPbxChild = false
                        end

                        if isPbxChild == true
                            pbxLine = sort[num]
                            num += 1
                        else
                            pbxLine << "\n"
                        end

                        # Children
                        if pbxLine.index("children = (")
                            isPbxChild = true
                        end
                        pbx << pbxLine
                    }
                    return pbx
                end
            end
        end
    end
end
