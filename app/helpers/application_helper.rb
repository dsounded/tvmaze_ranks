module ApplicationHelper
  def present(object, presenter_class)
    presenter_class ||= "#{object.class}Presenter".safe_constantize ||
                          "BasePresenter".constantize

    presenter = presenter_class.new(object, self)

    yield(presenter) if block_given?
    presenter
  end
end