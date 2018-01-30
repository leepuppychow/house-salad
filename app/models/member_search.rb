class MemberSearch
  #this is like the Merchant Repository
  def initialize(attributes = {})
    @raw_members = attributes["results"]
  end

  def members
    @raw_members.map do |raw_member|
      Member.new(raw_member)
    end
  end

end
