# Copied from Josh Knowles' excellent Rspec on Rails Matchers
# (http://github.com/joshknowles/rspec-on-rails-matchers/tree/master)

module RSpec
  module Core
    class ExampleGroup
      
      RSpec::Matchers.define :belong_to do |association|
        match do |model|
          model = model.class if model.is_a? ActiveRecord::Base
          model.reflect_on_all_associations(:belongs_to).find { |a| a.name == association }
        end
      end
      
      RSpec::Matchers.define :have_many do |association|
        match do |model|
          model = model.class if model.is_a? ActiveRecord::Base
          model.reflect_on_all_associations(:has_many).find { |a| a.name == association }
        end
      end
      
      RSpec::Matchers.define :have_one do |association|
        match do |model|
          model = model.class if model.is_a? ActiveRecord::Base
          model.reflect_on_all_associations(:has_one).find { |a| a.name == association }
        end
      end
      
      RSpec::Matchers.define :have_and_belong_to_many do |association|
        match do |model|
          model = model.class if model.is_a? ActiveRecord::Base
          model.reflect_on_all_associations(:has_and_belongs_to_many).find { |a| a.name == association }
        end
      end
      
    end
  end
end