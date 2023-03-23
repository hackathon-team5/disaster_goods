module ApplicationHelper
  def default_meta_tags
    {
      site: "サイ適くん",
      title: "タイトル",
      reverse: true,
      separator: "|",
      canonical: request.original_url,
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
      site: "@saitekikun1"
    }
  end



end
