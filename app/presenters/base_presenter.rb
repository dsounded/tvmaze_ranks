class BasePresenter < SimpleDelegator
  def self.presents(name)
    define_method(name) do
      @model
    end
  end

  def initialize(model, view)
    @model = model
    @view = view

    super(@model)
  end
end
