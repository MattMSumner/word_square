class Dictionary

  def initialize(language)
    @lexicon = self.send(language)
  end

  def words_with_length(integer)
    @lexicon.select { |word| word.length == integer }
  end

  private

  def english
    @_english ||= read_from_file("lib/mydictionary.json")
  end

  def read_from_file(path)
    file = File.open(path, "r")
    content = file.read
    file.close
    JSON.parse content
  end
end
