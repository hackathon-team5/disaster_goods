module ApplicationHelper
  def default_meta_tags
    {
      site: "最適くん",
      title: "タイトル",
      reverse: true,
      separator: "|",
      og: default_og,
      twitter: default_twittter_card
    }
  end

  private

  def default_og
    {
      title: :full_title,
      description: :description,
      url: request.url,
      image: image_url("ogp.png")
    }
  end

  def default_twittter_card
    {
      card: "summary_large_image",
      site: ""
    }
  end



end
