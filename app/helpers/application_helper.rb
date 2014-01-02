module ApplicationHelper
  def javascript_include_tag(*files)
    files.map{ |file| "<script src='#{url "assets/#{file}.js"}'></script>"}.join
  end

  def stylesheet_include_tag(*files)
    files.map{ |file| "<link href='#{url "assets/#{file}.css"}' media='screen, projection' rel='stylesheet' />"}.join
  end
end
