Deface::Override.new(
  virtual_path: 'spree/shared/_order_details',
  name: 'add_digital_downloads_to_invoice',
  insert_bottom: 'td[data-hook="order_item_description"]',
  text: <<-HTML
          <% if @order.state == 'complete' and item.variant.digital? %>
            <div data-hook='download_links'>
              <ul>
                <% item.digital_links.each do |digital_link| %>
                <% format = File.extname(digital_link.digital.attachment.path).downcase %>
                  <li>
                    <%= link_to Spree.t(:digital_download, scope: 'digitals', filename: raw(digital_link.digital.attachment_file_name)), digital_url(secret: digital_link.secret), class: "#{format}" %>
                  </li>
                <% end %>
              </ul>
            </div>
          <% end %>
        HTML
)