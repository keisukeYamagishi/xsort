require "./Emurate"

class PbxGroup

    def initialize
        @parentPbx = ""
        @parentName = ""
        @parentUUID = ""
        @pbxBase = ""
        @children = Array.new
    end

    def parentPbx
        @parentPbx
    end

    def parentName
        @parentName
    end

    def parentUUID
        @parentUUID
    end

    def pbxBase
        @pbxBase
    end

    def setParentName(name)
        @parentName = name
    end

    def setParentUUID(uuid)
        @parentUUID = uuid
    end

    def setParentPbx(pbx)
        @parentPbx = pbx
    end

    def setPbxBase(base)
        @pbxBase = base
    end

    def setChildren(pbx)
        @children.push(pbx)
    end
    def children
        @children
    end

end

class PbxChild

    def initialize(uuid, name, childPbx)
        @uuid = uuid
        @name = name
        @childPbx = childPbx
    end

    def uuid
        @uuid
    end

    def name
        @name
    end

    def childPbx
        @childPbx
    end

end

class Pbxproj

    def initialize(path, out)
        puts "#{out}"
        @path = path
        @isOut = out
        @pbxGroups = Array.new
    end

    def parse ()

        isPbxGroup = false
        isPbxOneValue = false
        isPbxChild = false
        pbxValue = ""

        File.open(@path, "r") do |pbx|
            pbx.each_line do |pbx_line|

                if @isOut == true
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
                        uuid = Emurate.emurateUUID(pbx_line)
                        @child = PbxChild.new(uuid,name,pbx_line)
                        @group.setChildren(@child)
                    end

                    # Children
                    if pbx_line.index("children = (")
                        isPbxChild = true
                    end

                    if pbx_line.index(" = {")
                        isPbxOneValue = true
                        name = Emurate.emurates(pbx_line)
                        uuid = Emurate.emurateUUID(pbx_line)
                        @group = PbxGroup.new
                        @group.setParentName(name)
                        @group.setParentUUID(uuid)
                        @group.setParentPbx(pbx_line)
                    end

                    if isPbxOneValue == true
                        pbxValue << pbx_line
                    end

                    if pbx_line.index("};")
                        isPbxOneValue = false
                        @group.setPbxBase(pbxValue)
                        @pbxGroups.push(@group)
                        pbxValue = ""
                    end
                end

                if pbx_line.index("/* Begin PBXGroup section */")
                    isPbxGroup = true
                end
            end
        end
    end

    def pbxGroups
        @pbxGroups
    end
end
