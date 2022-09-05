class TaskResultBuilder < ResultBuilderBase
  def autocomplete_hint
    "Cep: #{record.cep}, Scam type: #{record.scam_type}"
  end
end
