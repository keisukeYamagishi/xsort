RSpec.describe Xsort do
  it "has a version number" do
    expect(Xsort::VERSION).not_to be nil
  end

  it "path validity" do
    option = Option.new(['../App/Xsort-Sample.xcodeproj/'])
    puts "Include: #{option.path.include?("project.pbxproj")}"
    expect(option.path.include?("project.pbxproj")).to be true

    option = Option.new(['../App/XsortSample.xcodeproj/'])
    expect(option.path.include?("project.pbxproj")).to be true

    option = Option.new(['../App/Xsort-Sample.xcodeproj/', '-r'])
    expect(option.notOverwrite).to be true

    option = Option.new(['../App/Xsort-Sample.xcodeproj/', '-o'])
    expect(option.stdout).to be true
  end
end
