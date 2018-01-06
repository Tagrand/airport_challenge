require_relative "../lib/plane"

describe Plane do 

  let(:airport)	{ double("airport") }
  
  describe "#land" do
   
    it { is_expected.to respond_to(:land) }

    it "plane should give itself to hanger" do
      allow(airport).to receive(:land).with(subject).and_return(true)
      expect(subject.land(airport)).to be true
    end
    
  end

end
