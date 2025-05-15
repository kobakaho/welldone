module ApplicationHelper
  def default_meta_tags # 静的OGP
    {
      site: "well断",
      title: "みんなも断捨離 | well断",
      reverse: true,
      charset: "utf-8",
      description: "クローゼットを管理し、断捨離をサポートするサービス",
      canonical: request.original_url,
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.original_url,
        image: image_url("top_image.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary_large_image",
        site: "@",
        image: image_url("top_image.png")
      }
    }
  end
end
