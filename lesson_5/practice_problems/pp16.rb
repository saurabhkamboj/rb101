def generate_uuid
  characters = []
  (0..9).each { |number| characters << number.to_s }
  ("a".."f").each { |letter| characters << letter }
  
  uuid = ""
  section_lengths = [8, 4, 4, 4, 12]
  section_lengths.each do |length|
    length.times { uuid += characters.sample }
    uuid += '-'
  end

  uuid.chop
end
