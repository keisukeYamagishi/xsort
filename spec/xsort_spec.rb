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

  def xsortExecute(option)
    xsort = Xsort::Sortproj.new(option.path)
    xsort.sort(option.stdout,option.notOverwrite)
  end
end
