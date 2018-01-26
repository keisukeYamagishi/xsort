class PbxSort

    def initialize(pbxs)
        @pbxs = pbxs
    end

    def psort

        sorteds = Array.new
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

                child.push(pbx.childPbx)
                # puts pbx.uuid
                # puts pbx.name
                # ->> puts pbx.childPbx
            }
            sorteds.push(childrenSort(pbx.pbxBase,child))
            # pbx.children.each {|pbx|
            #
            #
                # # puts pbx.uuid
                # # puts pbx.name
                # puts pbx.childPbx
            # }
        }
        return sorteds
    end

    def childrenSort (children, sort)
        pbx = ""
        pbxSplit = children.split("\n")
        isPbxChild = false
        num = 0
        pbxSplit.each{|pbx_line|

            if pbx_line.index(");")
                isPbxChild = false
            end

            if isPbxChild == true
                pbx_line = sort[num]
                num += 1
            else
                pbx_line << "\n"
            end

            # Children
            if pbx_line.index("children = (")
                isPbxChild = true
            end
            pbx << pbx_line
        }
        return pbx
    end
end
