module Xsort
    class Sortproj

        def initialize (option)
            @option = option
        end

        def sort
            pbx = Xcodeproj::Pbxproj::PbxObject::Pbxproj.new(@option.path,@option.isOut)
            pbx.parse
            sort = Xcodeproj::Pbxproj::PbxObject::PbxSort.new(pbx.pbxGroups)
            s = sort.psort
            write = Xcodeproj::Pbxproj::PbxObject::PbxWrite.new(@option.path,s,@option.isOut, @option.notOverWrite)
            write.overWrite
        end
    end
end
