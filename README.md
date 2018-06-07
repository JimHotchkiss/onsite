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

<-- css
// Place all the styles related to the issues controller here.
// They will automatically be included in application.css.
// You can use Sass (SCSS) here: http://sass-lang.com/

/* Form style */

.issue-new form{
  height: 100%;
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-gap: 20px;
}

.issue-new form label{
  display: block;
}

.issue-new form p{
  margin:0;
}

.new-solution{
  width: 100%;
}

.issue-new form .full{
  grid-column: 1 / 3;
}

.issue-new form button, .issue-new input, .issue-new textarea {
  width:100%;
  padding:1em;
  border:1px solid #69e6ff;
}

.new-submit{
  width:100%;
  padding:1em;
  border:1px solid #69e6ff;
  background: #c9e6ff;
  border:0;
}

.new-submit:hover, .new-submit:focus{
  background: #92bde7;
  color: #fff;
  outline:0;
  transition: background-color 2s ease-out;
}

.issue-description{
  text-align: left;
}

.issue-solution{
  text-align: left;
}

.issue-edit-delete{
  text-align: left;
}

.checkbox-grid {
  display: grid;
  grid-template-areas: "left right";
  width: 150px;
}



.comment_content{
  border-bottom: 1px solid #d6dce0;
  margin-bottom:10px;
}

.errors{
  color:red;
}

-->

<-- html-form
<% if @issue.errors.any? %>
  <div class="errors">
    <h5><%=pluralize(@issue.errors.count, "error") %> prevented this issue from saving </h3>
    <ul>
      <% @issue.errors.full_messages.each do |message| %>
      <li><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>
<div class="issue-new">
  <%= form_for @issue do |f| %>
    <div>
      <%= f.label :title %>
      <%= f.text_field :title %>
    </div>
    <div>
      <%= f.label :description %>
      <%= f.text_field :description %>
    </div>
    <p class="full">
      <%= f.label :solution %>
      <%= f.text_area :solution, :class => "new-solution" %>
    </p>
    <p>
      <%=f.label :category %>
    </p>
    <p class="checkbox-grid full">
      <% Category.all.each do |category|%>
      <%= label_tag dom_id(category), category.name %>
      <%= check_box_tag "issue[category_ids][]", category.id, @issue.category_ids.include?(category.id), id: dom_id(category), :class => "css-checkbox" %>

      <% end %>
    </p>
    <p class="full">
      <%= f.submit :submit, :class => "new-submit" %>
    <p>
  <% end %>
</div>

-->
