* I'm going to use Traversy, Mobile first, and Bootstrap for the NavBar.  
# form:

<% if @issue.errors.any? %>
  <div class="errors">
    <h5><%=pluralize(@issue.errors.count, "error") %> prevented this issue from saving </h5>
    <ul>
      <% @issue.errors.full_messages.each do |message| %>
      <li><%= message %></li>
      <% end %>
    </ul>
<% end %>
</div>

<div class="form-group">
  <%= form_for @issue do |f| %>
  <%= f.label :title %>
  <%= f.text_field :title, :placeholder => "title", :class => "form-control"%>
</div>

<div class="form-group">
  <%= f.label :description %>
  <%= f.text_field :description, :placeholder => "description", :class => "form-control" %>
</div>

<div class="form-group">
  <%= f.label :solution %>
  <%= f.text_area :solution,:placeholder => "solution", :class => "form-control" %>
</div>

<div>
  <%=f.label :category %>
  <% Category.all.each do |category|%>
  <ul>
    <li>
      <%= label_tag dom_id(category), category.name  %>
      <%= check_box_tag "issue[category_ids][]", category.id, @issue.category_ids.include?(category.id), id: dom_id(category)%>
    </li>
  </ul>
  <% end %>
</div>

<div >
  <%= f.submit :submit, class: "btn btn-success" %>

  <% end %>
</div>


# _Form stle.css

/* Form style */
.form-control::-webkit-input-placeholder{
  color: #b1c1e2;
}

.errors{
  color:red;
}
.btn-block:hover, .btn-block:focus{
  background: #92bde7;
  color: #fff;
  outline:0;
}

.btn-block{
  width:100%;
  padding:1em;
  border:1px solid #69e6ff;
  background: #c9e6ff;
  border:0;
}

<% if @issue.errors.any? %>
  <div class="errors">
    <h5><%=pluralize(@issue.errors.count, "error") %> prevented this issue from saving </h5>
    <ul>
      <% @issue.errors.full_messages.each do |message| %>
      <li><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>

  <div class="label-grid">
    <%= form_for @issue do |f| %>
      <p>
        <%= f.label :title %>
        <%= f.text_field :title%>
      </p>
      <p>
        <%= f.label :description %>
        <%= f.text_field :description%>
      </p>
  </div>
    <p>
      <%= f.label :solution %>
      <%= f.text_area :solution, :class => "solution-input"%>
    </p>
    <p>
      <%=f.label :category %>
      <% Category.all.each do |category|%>
      <ul>
        <li>
          <%= label_tag dom_id(category), category.name, :class => "category-label"  %>
          <%= check_box_tag "issue[category_ids][]", category.id, @issue.category_ids.include?(category.id), id: dom_id(category)%>
        </li>
      </ul>
      <% end %>
    </p>
    <p>
      <%= f.submit :submit%>
    </p>
  <% end %>
