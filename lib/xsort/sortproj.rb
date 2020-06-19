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

module Xsort    
    class Sortproj
        include Xcodeproj::Pbxproj::PbxObject

        def initialize (path)
            @path = path
        end

        def sort (stdout,notOverwrite)
            puts @path
            pbxproj = Pbxproj.new(@path,stdout)
            pbxproj.parse
            sort = PbxSort.new(pbxproj.pbxGroups)
            pbxObject = sort.psort
            write = PbxWrite.new(@path,pbxObject,stdout,notOverwrite)
            write.overWrite
        end
    end
end
