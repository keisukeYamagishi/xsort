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

        def initialize (path)
            @path = path
        end

        def sort (stdout,notOverwrite)
            puts @path
            pbxproj = Xcodeproj::Pbxproj::PbxObject::Pbxproj.new(@path,stdout)
            pbxproj.parse
            sort = Xcodeproj::Pbxproj::PbxObject::PbxSort.new(pbxproj.pbxGroups)
            pbxObject = sort.psort
            write = Xcodeproj::Pbxproj::PbxObject::PbxWrite.new(@path,pbxObject,stdout,notOverwrite)
            write.overWrite
        end
    end
end
