module ApplicationHelper
  def default_meta_tags
    {
      site: "well断",
      title: "well断",
      reverse: true,
      charset: "utf-8",
      description: "クローゼットを管理し、断捨離をサポートするサービス",
      canonical: "http://welldoneshari.com",
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "http://welldoneshari.com",
        image: image_url("ogp.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary_large_image",
        site: "@",
        image: image_url("ogp.png")
      }
    }
  end
end
