require_relative "../lib/airport.rb"

describe Airport do 
   
  let(:plane) { double("plane") }
  
  describe "#land" do

    it "plane should give itself to hanger" do
      allow(plane).to receive(:land).and_return(true)
      allow(plane).to receive(:flying).and_return(false)
      subject.land(plane)
      expect(subject.hanger).to include(plane)
    end

    it "only lands a plane that can land" do
      allow(plane).to receive(:land).and_return(true)
       allow(plane).to receive(:flying).and_return(false)
      subject.land(plane)
      expect(subject.hanger).to include(plane)
    end
    
    it "it won't land a plane that isn't able to" do 
      allow(plane).to receive(:land).and_return(false)
      allow(plane).to receive(:flying).and_return(false)
      subject.land(plane)
      expect(subject.hanger).to eq []
    end

      it "it won't store a plane that still thinks its flying" do 
      allow(plane).to receive(:land).and_return(false)
      allow(plane).to receive(:flying).and_return(true)
      subject.land(plane)
      expect(subject.hanger).to eq []
    end
    
  end

  describe "#take_off" do

    it "a plane that takes off should be removed from hanger" do
      allow(plane).to receive(:land).and_return(true)
      allow(plane).to receive(:flying).and_return(false)
      allow(plane).to receive(:take_off).and_return(true)	
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hanger).to eq []
    end

    it "a plane can only take off, if its in the hanger" do
      expect { subject.take_off(plane) }.to raise_error("No such plane in hanger")
    end
    
    it "plane is only removed from hanger if it has taken off" do
      allow(plane).to receive(:take_off).and_return(true)
      expect { subject.take_off(plane) }.to raise_error("No such plane in hanger")
    end

 
  end

end
