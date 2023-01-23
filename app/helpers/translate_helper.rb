module TranslateHelper
  def pluralize_model(class_name)
    I18n.t("activerecord.models.#{class_name.to_s.underscore.downcase}")
  end

  def translate_model(class_name)
    I18n.t("activerecord.models.#{class_name.to_s.underscore.downcase}")
  end

  def singularize_model(class_name)
    I18n.t("activerecord.models.#{class_name.to_s.underscore}").singularize
  end

  def translate_attr(class_name, attr_name)
    I18n.t("activerecord.attributes.#{class_name.to_s.underscore}.#{attr_name}")
  end

  def translate_enum_name(class_name, enum_name, enum_value)
    return nil unless enum_value

    I18n.t("activerecord.attributes.#{class_name.to_s.underscore}.#{enum_name}.#{enum_value}")
  end

  def label_translate(label_name)
    I18n.t("labels.#{label_name}")
  end
end
