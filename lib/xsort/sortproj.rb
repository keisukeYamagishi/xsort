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

        def self.sort (path, stdout, notOverwrite)
            puts path
            begin
                pbxproj = Xcodeproj::Pbxproj::PbxObject::Pbxproj.new(path)
                pbxproj.parse
                sort = Xcodeproj::Pbxproj::PbxObject::PbxSort.new(pbxproj.pbxGroups)
                pbxObject = sort.psort
                write = Xcodeproj::Pbxproj::PbxObject::PbxWrite.new(path,pbxObject,stdout,notOverwrite)
                write.overWrite
            rescue IOError => error
                raise error
            rescue SystemCallError => error
                raise error
            end
        end
    end
end