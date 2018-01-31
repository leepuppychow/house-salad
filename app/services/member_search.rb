class MemberSearch

  def initialize(state)
    @state = state
  end

  def members
    PropublicaService.new(state).house_members.map do |raw_member|
      Member.new(raw_member)
    end
  end

  private
    attr_reader :state

end
