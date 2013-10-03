require_relative 'scraper'
class YahooScraper < Scraper

  # Get the article text from the URL
  def scrape_text

    # Get the text of the article from <p> tag of class="ynDetailText"
    @text = @page.css("p.ynDetailText").text

  end

end