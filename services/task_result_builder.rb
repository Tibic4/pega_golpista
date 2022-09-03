class TaskResultBuilder < ResultBuilderBase
  def autocomplete_hint
    "#{record.cep}, #{record.scam_type}"
  end
end
