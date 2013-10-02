class Link

  attr_accessor :title, :url, :date, :source, :category

  def initialize(entry, source)
    @title = entry.title
    @url = entry.url
    @date = entry.published
    @source = source
    @category = title.split[0]
  end 

end