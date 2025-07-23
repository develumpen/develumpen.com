class Entry < ApplicationRecord
  before_validation :set_body_html

  validates :body_markdown, presence: true
  validates :body_html, presence: true

  scope :published, -> () {
    where(draft: false).and(
      where("published_at < ?", Time.current)
    )
  }

  private

  def set_body_html
    self.body_html = body_markdown
  end
end
