class ImagePreviewInput < SimpleForm::Inputs::FileInput
  def input(wrapper_options = {})
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    out = ActiveSupport::SafeBuffer.new # the output buffer we're going to build
    # append file input. it will work accordingly with your simple_form wrappers
    attached = object.send(attribute_name)
    if attached.attached?
      out << @builder.file_field(attribute_name, merged_input_options.merge(value: attached.name))
      out << template.image_tag(attached, title: input_html_options[:title])
    else
      out << @builder.file_field(attribute_name, merged_input_options)
    end
    out
  end
end
