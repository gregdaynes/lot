class Card
  attr_reader :count, :shape, :fill, :color

  def initialize(args)
    args.map do |arg|
      arg_class = arg.class == Integer ? 'count' : arg.type

      instance_variable = "@#{arg_class}".downcase.to_sym
      instance_variable_set(instance_variable, arg)
    end
  end
end
