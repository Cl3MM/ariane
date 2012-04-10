module ModelsHelper

  def model_info model
    s = "<h3 class=\"center\">#{model.name}:&nbsp;&nbsp;<small>"

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
