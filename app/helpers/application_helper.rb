module ApplicationHelper
  def default_meta_tags
    {
      site: "well断",
      title: "well断",
      reverse: true,
      charset: "utf-8",
      description: "クローゼットを管理し、断捨離を促すサービス",
      og: {
        site_name: "well断",
        title: "well断",
        description: "クローゼットを管理し、断捨離を促すサービス",
        type: "website",
        url: request.original_url,
        image: image_url("top_image.jpg"),#なんの画像やねん
        local: "ja-JP"
      },
      twitter: {
        card: "summary_large_image",
        # site: 自分のツイッターアカウント
        image: image_url("top_image.jpg")#なんの画像やねん
      }
    }
  end
end
