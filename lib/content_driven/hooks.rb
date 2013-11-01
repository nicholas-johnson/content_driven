
module ContentDriven
  module Hooks

    attr :after_hooks
    def after_hooks
      @after_hooks ||= []
    end

    def call_after_hooks
      after_hooks.each do |hook|
        self.instance_eval &hook
      end
    end

    def after &block
      after_hooks << block
    end

  end
end
