require_relative "../lib/plane"

describe Plane do 

  let(:airport)	{ double("airport") }
  
  describe "#land" do
   
    it { is_expected.to respond_to(:land).with(1).argument }

    it "plane should give itself to hanger" do
      allow(airport).to receive(:land).with(subject).and_return(true)
      expect(subject.land(airport)).to be true
    end

    it "a landed plane should raise error if not landed" do
      allow(airport).to receive(:land)
      subject.land(airport)
      expect { subject.land(airport) } .to raise_error
    end
    
  end

end
