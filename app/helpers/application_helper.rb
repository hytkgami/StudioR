module ApplicationHelper
  def menu_link_to(text, path)
    link_to_unless_current(text, path) { content_tag(:span, text) }
  end

  def material_image_tag(material, options = {})
    if material.image.present?
      path = material_path(material, format: material.image.extension)
      link_to(image_tag(path, { alt: material.name }.merge(options)), path)
    else
      ""
    end
  end
end
