require 'rails_helper'

describe Member do
  it "exists" do
    attributes = {name: "Lee", role: "student",
                  party: "animal", district: "12"}
    member = Member.new(attributes)

    expect(member).to be_a Member
    expect(member.name).to eq "Lee"
    expect(member.role).to eq "student"
    expect(member.party).to eq "animal"
    expect(member.district).to eq "12"
  end
end
