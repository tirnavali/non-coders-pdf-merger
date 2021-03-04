require "hexapdf"

target = HexaPDF::Document.new
Dir.glob("*.pdf").sort.each do |file|
  pdf = HexaPDF::Document.open(file)
  pdf.pages.each{|page| target.pages << target.import(page)}
end
target.write("master-file.pdf", optimize: true)
