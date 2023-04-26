# Phoenix.HTML.Form.inputs_for is great, but it's old school. 
# This is how we make a component version of it

def children(assigns) do
  ~H"""
  <%= Phoenix.HTML.Form.inputs_for @form, @field, @options, fn section_form -> %>
    # note the second argument, 
    # which is available when providing the slot, via :let
    <%= render_slot(@inner_block, section_form) %>
  <% end %>
  """
end

# this can be used as 

<.form :let={my_form}>
  <.children form={my_form} field={my_field} options={my_options} :let={child_form}>
    <.input form={child_form} type="text" field={:some_field} />
    # ...
  </.children>
</.form>
