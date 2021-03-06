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
            class Emurate

                def self.emurates(chars)
                    splits = chars.split(" ")
                    isName = false
                    splits.each { |char|
                        if char == "*/"
                            isName = false
                        end
                        if isName == true
                            return char
                        end
                        if char == "/*"
                            isName = true
                        end
                    }
                end
            end
        end
    end
end
