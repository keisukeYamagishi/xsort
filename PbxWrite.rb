class PbxWrite

    def initialize(pbx)
        @pbx = pbx
    end

    def overWrite
        isPbxGroup = false
        pbxValue = ""
        num = 0
        File.open("./project.pbxproj", "r") do |pbx|
            pbx.each_line do |pbx_line|
                # puts pbx_line
                # puts "PBX_LINE"
                # pbxValue << pbx_line
                if pbx_line.index("/* End PBXGroup section */")
                    sorted = @pbx.join
                    sorted << pbx_line
                    pbx_line = sorted
                    isPbxGroup = false
                end

                if isPbxGroup == true
                    # puts pbx_line
                    pbx_line = ""
                end
                # In PBX Group
                # if isPbxGroup == true
                #     pbxValue << @pbx[num]
                #     num += 1
                # else
                #     pbxValue << pbx_line
                # end

                if pbx_line.index("/* Begin PBXGroup section */")
                    # puts "HIT Begine"
                    isPbxGroup = true
                end

                pbxValue << pbx_line
            end
        end
        writeFile(pbxValue)
        # return pbxValue
    end

    def writeFile(value)
        File.open("./output.pbxproj","w") do |write|
            write.puts(value)
        end
    end

end
