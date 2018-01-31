require 'rails_helper'

describe MemberSearch do
  let(:member_search) {MemberSearch.new("CO")} #only runs when called

  it "exists" do
    member_search = MemberSearch.new("CO")
    expect(member_search).to be_a MemberSearch
  end

  context "instance methods" do
    context "#members" do
      it "returns a collection of member objects" do
        VCR.use_cassette("members") do
          members = member_search.members
          member = members.first
          expect(members.count).to eq 7
          expect(member).to be_a Member
        end
      end
    end
  end
end
