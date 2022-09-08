class MyValidator < ApplicationRecord
  # Open txt file dependencies/validations.txt
  def load_validations
    file = File.open('dependencies/validations.txt', 'r')
    line.chomp
    file.close
  end

  def validate(record)
    if record.review_text.present?
      @review_text = record.review_text.dup
      @review_text.downcase!
    end
    # Load validations
    @bad_keywords = load_validations
    @bad_keywords.each do |_keyword|
      # Check if validations are valid
      if @review_text.include?(record.name)
        # Use regex to hidden word
        record.name = record.name.gsub(/./, '*')
      end
    end
  end
end
