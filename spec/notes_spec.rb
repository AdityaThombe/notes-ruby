require "tmpdir"
require_relative "../lib/notes"

RSpec.describe Notes do
  it "counts words" do
    Dir.mktmpdir do |dir|
      path = File.join(dir, "a.txt")
      File.write(path, "one two three")
      expect(Notes.word_count(path)).to eq("3")
    end
  end

  it "reads a note" do
    Dir.mktmpdir do |dir|
      File.write(File.join(dir, "n.txt"), "hello")
      expect(Notes.read(dir, "n.txt")).to eq("hello")
    end
  end

  it "restores a draft" do
    blob = Marshal.dump({ "title" => "x" }).unpack1("H*")
    expect(Notes.restore(blob)).to eq({ "title" => "x" })
  end

  it "title-cases names" do
    expect(Notes.title("weekly-plan_notes")).to eq("Weekly Plan Notes")
  end
end
