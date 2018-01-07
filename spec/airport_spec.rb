require_relative "../lib/airport.rb"

describe Airport do 
   
  let(:plane) { double("plane") }
  
  describe "#land" do

    it "a landed plane should be in hanger" do
      subject.land(plane)
      expect(subject.hanger).to include(plane)
    end

    it "won't land an already landed plane" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Already Grounded")
    end

    it "it won't let the plane land if weather is stormy" do 
      expect { subject.land(plane, "stormy") }.to raise_error("Weather too bad")
    end

    it "it won't let a plane land beyond its capacity" do 
      subject.capacity.times {subject.land(plane)}
      expect { subject.land(plane) }.to raise_error("Airport full")
    end
    
  end

  describe "#take_off" do

    it "a plane that takes off should be removed from hanger" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hanger).to eq []
    end

    it "a plane can only take off, if its in the hanger" do
      expect { subject.take_off(plane) }.to raise_error("No such plane in hanger")
    end
    
    it "should recieve confirmation a plane has taken off" do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq("#{plane} has taken off")
    end
    
    it "it won't let the plane take_off if weather is stormy" do 
      subject.land(plane)
      expect { subject.take_off(plane, "stormy") }.to raise_error("Weather too bad")
    end

  end
end
