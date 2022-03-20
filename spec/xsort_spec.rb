include Xcodeproj::Pbxproj::PbxObject

RSpec.describe Xsort do
  it "has a version number" do
    expect(Xsort::VERSION).not_to be nil
  end

  it "execute" do
    puts Dir.pwd
    option = Option.new(['./test/XcodeProj/XcodeProj.xcodeproj'])
    puts option.path    
    expect(option.path.include?("project.pbxproj")).to be true
    xsortExecute option
  end

  it "do not over write" do
    option = Option.new(['./test/XcodeProj/XcodeProj.xcodeproj', '-r'])
    puts "option not over write #{option.notOverwrite}"
    expect(option.notOverwrite).to be true
    xsortExecute option
    expect(File.exist?('./output.pbxproj')).to be true    
  end

  it "standard out put" do
    option = Option.new(['./test/XcodeProj/XcodeProj.xcodeproj', '-o'])
    puts option.stdout
    expect(option.stdout).to be true
    xsortExecute option
  end

  it "permission denied file pbxprojo parse class" do
    option = Option.new(['/test/Permission/Permission.xcodeproj'])
    pbxproj = Pbxproj.new(option.path)
    expect { pbxproj.parse }.to raise_error(SystemCallError)
  end

  it "no such file or directory pbxprojo parse class" do
    option = Option.new(['/test/noSuchFile.xcodeproj'])
    pbxproj = Pbxproj.new(option.path)
    expect { pbxproj.parse }.to raise_error(SystemCallError)
  end

  it "permission denied file pbx write class" do
    validOption = Option.new(['./test/XcodeProj/XcodeProj.xcodeproj'])    
    invalidOption = Option.new(['/test/Permission/Permission.xcodeproj'])
    pbxproj = Pbxproj.new(validOption.path)
    pbxproj.parse
    sort = PbxSort.new(pbxproj.pbxGroups)
    pbxObject = sort.psort
    write = PbxWrite.new(invalidOption.path,pbxObject,invalidOption.stdout,invalidOption.notOverwrite)
    expect { write.overWrite }.to raise_error(SystemCallError)
  end

  it "no such file or directory pbx write class" do
    validOption = Option.new(['./test/XcodeProj/XcodeProj.xcodeproj'])    
    invalidOption = Option.new(['/test/noSuchDirectory.xcodeproj'])
    pbxproj = Pbxproj.new(validOption.path)
    pbxproj.parse
    sort = PbxSort.new(pbxproj.pbxGroups)
    pbxObject = sort.psort
    write = PbxWrite.new(invalidOption.path,pbxObject,invalidOption.stdout,invalidOption.notOverwrite)
    expect { write.overWrite }.to raise_error(SystemCallError)
  end

  def xsortExecute(option)
    begin
      Xsort::Sortproj.sort(option.path,option.stdout,option.notOverwrite)
    rescue IOError => ioerr
      puts "(*_*).oO Oh no Exception!"
      puts "(*_*).oO reason: \e[31m#{ioerr.message}\e[0m"
    rescue SystemCallError => sysCallErr
      puts "\e[31m(*_*).oO Oh no Exception!\e[0m"
      puts "\e[31m(*_*).oO Failuer! reason: \n#{sysCallErr.message}\e[0m"
    else
      puts "\e[36mXsort Successful (☝ ՞ਊ ՞）☝!!!\e[0m"
    end
  end
end
