# class MyValidator < ApplicationRecord
#   # Open txt file dependencies/validations.txt
#   # def load_validations
#   def load_validations
#     file = File.open("validations.txt", "r")
#     @file_data = file.readlines.map(&:chomp)
#   end

#   def validate(record)
#     if record.description.present?
#       @description = record.review_text.dup
#       @description.downcase!
#     end
#     # Load validations
#     @bad_keywords = load_validations
#     @bad_keywords.each do |_keyword|
#       # Check if validations are valid
#       if @description.include?(record.name)
#         # Use regex to hidden word
#         record.name = record.name.gsub(/./, '*')
#         raise
#       end
#     end
#   end
# end
