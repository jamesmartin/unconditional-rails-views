module UnconditionalView
  class Railtie < ::Rails::Railtie
    initializer "unconditonal_view.action_view" do |app|
      ActiveSupport.on_load :action_view do
        require "unconditional_view/helpers"
        include UnconditionalView::ActionView::Helpers
      end
    end
  end
end
