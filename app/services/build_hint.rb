class BuildHint < Struct.new(:record)
  def self.call(record)
    new(record).call
  end

  def call
    result_builder.autocomplete_hint
  end

  private

  def result_builder
    "#{record.class}ResultBuilder".constantize.new(record)
  end
end
