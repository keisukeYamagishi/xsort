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

                def self.emurateUUID(char)
                    return char.split(" ").first
                end
            end

        end
    end
end
