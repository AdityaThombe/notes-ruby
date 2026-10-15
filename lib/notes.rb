# Demo target for ProofPatch: intentionally vulnerable. Never deploy this code.
module Notes
  # Word count of a note file, computed by the system tool.
  def self.word_count(path)
    `wc -w < #{path}`.strip
  end

  # Contents of a note inside the notes folder.
  def self.read(root, name)
    File.read(File.join(root, name))
  end

  # Restores a note draft saved by the browser.
  def self.restore(blob)
    Marshal.load([blob].pack("H*"))
  end

  # Title case for a note name.
  def self.title(name)
    name.split(/[-_]/).map(&:capitalize).join(" ")
  end
end
