* I'm going to use Traversy, Mobile first, and Bootstrap for the NavBar.  
# form:

<div class="issue-new">

  <% if @issue.errors.any? %>
    <div class="errors">
      <h3><%=pluralize(@issue.errors.count, "error") %> prevented this issue from saving </h3>
      <ul>
        <% @issue.errors.full_messages.each do |message| %>
        <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>

  <form action="<%= issues_path %>" method="POST">
    <p>
      <label>Title</label>
      <input type="text" id="issue_title" name="issue[title]">
    </p>
    <p>
      <label>Description</label>
      <input type="text" id="issue_description" name="issue[description]">
    </p>
    <p class="full">
      <label>Solution</label>
      <textarea name="issue[solution]" rows="5"></textarea>
    </p>

    <p class="full">
      <label>Category</label>
      <% Category.all.each do |category|%>
        <p>
          <label for="category_id <%= category.id %>"><%= category.name %></label>
          <input type="checkbox" name="issue[category_ids][]" value="<%= category.id %>" id>
        </p>
      <% end %>
    </p>

    <p class="full">
      <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
      <button href="issues/create">Submit</button>
    </p>
  </form>
</div>

*form_for:


<%= form_for @issue do |f| %>
  <% if @issue.errors.any? %>
    <div id="errors">
      <h2><%pluralize(@issue.errors.count, "error") %> prevented this issue from saving </h2>
      <ul>
        <% @issue.errors.full_messages.each do |message| %>
        <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
  <p>
    <%= f.label :title, :class => "issue-new-label" %><br>
    <%= f.text_field :title %>
  </p>

  <p>
    <%= f.label :description, :class => "issue-new-description" %><br>
    <%= f.text_area :description, :placeholder => "Issue Description"%>
  </p>

  <p>
    <%= f.label :solution, :class => "issue-new-full" %><br>
    <%= f.text_area :solution, :placeholder => "Your Solution" %>
  </p>

  <%= f.label :categories, :class => "issue-new-full" %><br></br>
  <% Category.all.each do |category|%>
  <p>
    <label for="category_id <%= category.id %>"><%= category.name %></label>
    <input type="checkbox" name="issue[category_ids][]" value="<%= category.id %>" id>

  </p>
  <% end %>

  <p>
    <%= f.submit "Submit", :class => "issue-new-button" %>
  </p>
<% end %>
