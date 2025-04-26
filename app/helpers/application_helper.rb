module ApplicationHelper
  def default_meta_tags
    {
      site: "well断",
      title: "well断",
      reverse: true,
      charset: "utf-8",
      description: "クローゼットを管理し、断捨離を促すサービス",
      canonical: "welldoneshari.com",
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "welldoneshari.com",
        image: image_url("top_image.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary",
        site: "@",
        image: image_url("top_image.png")
      }
    }
  end
end
