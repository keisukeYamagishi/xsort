class PbxSort

    def initialize(pbxs)
        @pbxs = pbxs
    end

    def psort

        # pbxsort = @pbxs.sort{|pbxp1,pbxp2|
        #     pbxp1.partition <=> pbxp2.parentName
        # }
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

            # pbx.children.each {|pbx|
            #
            #     puts pbx.childPbx
            #
            # }

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
            # puts "\nArrays\n"
            # child.each{|p|
            #     puts p
            # }
            sorteds.push(childrenSort(pbx.pbxBase,child))
            # pbx.children.each {|pbx|
            #
            #
                # # puts pbx.uuid
                # # puts pbx.name
                # puts pbx.childPbx
            # }
        }
        # puts "\n\nSORTS\n\n"
        # sorteds.each{|pbx|
        #     puts pbx
        # }
        return sorteds
    end

    def childrenSort (children, sort)
        # puts "\n\nchildSort\n\n"
        pbx = ""
        pbxSplit = children.split("\n")
        isPbxChild = false
        num = 0
        pbxSplit.each{|pbx_line|

            # puts pbx_line

            if pbx_line.index(");")
                # puts "FALSE HIT"
                isPbxChild = false
            end

            if isPbxChild == true
                pbx_line = sort[num]
                # puts "pbx_line #{pbx_line}"
                num += 1
            else
                pbx_line << "\n"
            end

            # # Children
            if pbx_line.index("children = (")
                # puts "HIT"
                isPbxChild = true
            end
            pbx << pbx_line
        }
        # puts "\n\nPBXSORT\n\n"
        # puts pbx
        return pbx
    end
end
