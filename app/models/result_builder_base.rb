class ResultBuilderBase
  def initialize(record)
    @record = record
  end

  private

  attr_reader :record
end
