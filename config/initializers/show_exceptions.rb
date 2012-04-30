require 'action_dispatch/middleware/show_exceptions'

module ActionDispatch
  class ShowExceptions
    private
      def render_exception_with_template(env, exception)
        if rescue_responses[exception.class.name] == :internal_server_error
          env["action_dispatch.request.parameters"]["exception_message"] = exception.try(:message)
          env["action_dispatch.request.parameters"]["exception_trace"] = exception.try(:backtrace)
        end
        if exception.class.name == 'CanCan::AccessDenied'
          body = ErrorsController.action(:access_denied).call(env)
        else
          body = ErrorsController.action(rescue_responses[exception.class.name]).call(env)
        end
        log_error(exception)
        body
      rescue
        render_exception_without_template(env, exception)
      end

      alias_method_chain :render_exception, :template
  end
end