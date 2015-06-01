require "spec_helper"
require "hexflex/templater"

describe Hexflex::Templater do
  describe "#new" do
    it "takes a hexaflexagon" do
      hexaflexagon = double("hexaflexagon")
      templater = Hexflex::Templater.new(hexaflexagon)
      expect(templater.hexaflexagon).to eq hexaflexagon
    end
  end

  describe "#make_template" do
    it "returns a template with the hexaflexagon's triangles placed therein" do
      hexaflexagon = Hexflex::Hexaflexagon.new
      templater = Hexflex::Templater.new(hexaflexagon)

      template = double("template")
      expect(Hexflex::Template).to receive(:new).and_return(template)
      hexaflexagon.triangles.each_with_index do |triangle, index|
        expect(template).to receive(:place_triangle).with(triangle, index)
      end

      expect(templater.make_template).to eq template
    end
  end

end
