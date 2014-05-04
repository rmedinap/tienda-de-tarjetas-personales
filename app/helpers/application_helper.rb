module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

# Customized helpers =)
  def user_tools(object, params={}, options={:text => true})
    txt = []

    txt << show_tool(object, params, options)
    txt << edit_tool(object, params, options)
    txt << delete_tool(object, options)

    content_tag(:div, (txt.join(" ")).html_safe, :class=>"btn-group btn-group-sm") if txt.compact.present?
  end

  def show_tool object, params={}, options={:text => true}
    obj = object.is_a?(Array) ? object.last : object
    if can? :show, obj
      text = options[:text] ? "Revisar" : ""
      link_to(content_tag(:span, nil, :class=>"glyphicon glyphicon-eye-open")+" #{text}", polymorphic_path(object, params),
              {:title=>"Revisar", :class => 'btn btn-primary btn-sm'}.merge(options))
    end
  end

  def edit_tool object, params={}, options={:text => true}
    obj = object.is_a?(Array) ? object.last : object
    if can? :edit, obj
      text = options[:text] ? "Editar" : ""
      link_to(content_tag(:span, nil, :class=>"glyphicon glyphicon-edit")+" #{text}", edit_polymorphic_path(object, params),
              {:title=>"Editar", :class => 'btn btn-primary btn-sm'}.merge(options))
    end
  end

  def delete_tool object, options={:text => true}
    obj = object.is_a?(Array) ? object.last : object
    if can? :destroy, obj
      text = options[:text] ? "Eliminar" : ""
      link_to(content_tag(:span, nil, :class=>"glyphicon glyphicon-trash") + " #{text}", object,
              {:title=>"Eliminar", :"data-confirm" => "¿Desea eliminar #{obj.class.name}?",
                :method => :delete, :class => 'btn btn-danger btn-sm'}.merge(options))
    end
  end

  def new_tool object, params={}, options={}
    html = []
    obj  = object.is_a?(Array) ? object.last : object
    if can? :new, obj
      if obj.is_a?Class
        class_name = obj.name
      else
        class_name = obj.class.name
        obj = obj.class
      end

      html << link_to(content_tag(:i,nil,:class=>"glyphicon glyphicon-plus-sign")+" Nuevo #{class_name}", new_polymorphic_path(object, params),
              {:title=>"Crear", :class => 'btn btn-success'}.merge(options))
      html << [tag(:br), tag(:br)]

      content_tag(:div, (html.join(" &nbsp; ")).html_safe)
    end
  end

  def list_tool object, params={}, options={}
    if can? :index, object
      if object.is_a?Class
        object = object
      else
        object = object.class.name.classify.constantize
      end
      url = [[:controller, object.name.underscore.pluralize], [:action=>:index]] + params.to_a
      link_to(content_tag(:span, nil, :class=>"glyphicon glyphicon-eye-open")+" Listar todos",
              url_for( Hash[url]),
              {:title=>"Revisar", :class => 'btn btn-primary btn-sm'}.merge(options))
    end
  end

  def tick v = false
    if v
      content_tag(:span, "Si", :class=>"label label-success")
    else
      content_tag(:span, "No", :class=>"label label-danger")
    end
  end



end
