class HintBuilder
  attr_accessor :record

  def initialize(record)
    @record = record
  end

  def self.call(record)
    new(record).call
  end

  def call
    TaskResultBuilder.new(@record).autocomplete_hint
  end
end
