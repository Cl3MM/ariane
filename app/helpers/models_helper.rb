module ModelsHelper

  def model_info model
    if current_user
      s = "<h3 class=\"center\"> #{link_to raw("<i class='icon-edit icon-white'></i> Edit infos"), administration_model_path(model),
                class: "btn btn-small btn-warning"}&nbsp;&nbsp;#{model.name}:&nbsp;&nbsp;<small>"
    else
      s = "<h3 class=\"center\">#{model.name}:&nbsp;&nbsp;<small>"
    end

    collec = [:hair_color_id, :eyes_color_id]
    attributes = [:height, :suit, :neck, :shoe, :waist, :size, :bust, :hips ]

    model.attributes.each_pair do |attr, value|
      if attributes.index(attr.to_sym)
        s += "#{attr.capitalize}&nbsp;&nbsp;#{value}&nbsp;&nbsp;|&nbsp;&nbsp;" unless value.blank?
      end
      if collec.index(attr.to_sym)
        s += "#{t(attr.to_sym)}&nbsp;&nbsp;#{Color.find_by_id(value.to_i).name}&nbsp;&nbsp;|&nbsp;&nbsp;" unless value.blank?
      end
    end
    s = "#{s.gsub(/&nbsp;\|[&nbsp;]{2,}$/, "")}</small></h3>"
    return raw(s)
  end
end
