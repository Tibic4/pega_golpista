class ScammerResultBuilder < ResultBuilderBase
  def autocomplete_hint
    "Name: #{record.name}, Email: #{record.email}, Phone: #{record.phone}, Website: #{record.website}"
  end
end
