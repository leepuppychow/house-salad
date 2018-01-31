require 'rails_helper'

describe PropublicaService do
  subject {PropublicaService.new("CA")}

  it "exists" do
    expect(subject).to be_a PropublicaService
  end

  context "Instance Methods" do
    context "#house_members" do
      it "returns collection of house member hashes" do
        VCR.use_cassette("house_members") do
          raw_house_member = subject.house_members.first
          expect(subject.house_members.count).to eq 53
          expect(raw_house_member).to be_a Hash

          expect(raw_house_member).to have_key :name
          expect(raw_house_member[:name]).to be_a String

          expect(raw_house_member).to have_key :role
          expect(raw_house_member[:role]).to be_a String

          expect(raw_house_member).to have_key :party
          expect(raw_house_member[:party]).to be_a String

          expect(raw_house_member).to have_key :district
          expect(raw_house_member[:district]).to be_a String
        end    
      end
    end
  end

end
