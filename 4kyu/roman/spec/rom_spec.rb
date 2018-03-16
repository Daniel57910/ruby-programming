require "rom"

describe "conv" do
  it "should print 1 when 1 entered" do
    expect(conv(1)).to eq "I"
  end

  it "should print V when 5 entered" do
    expect(conv(5)).to eq "V"
  end

  it "should print D when 1000 entered" do
    expect(conv(500)).to eq "D"
  end

  it "should print MCCXCI when 1291 entered" do
    expect(conv(1291)).to eq "MCCXCI"
  end

  it "should print MMMCXXV when 3125 entered" do
    expect(conv(3125)).to eq "MMMCXXV"
  end

end