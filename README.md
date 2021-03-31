# Live Lecture - Rails Models and ReSTful Routing

## Week 2 (CRUD)

1. Make a migration for products table
    - name, category, price, sku_number, availability
2. Make a model  
    - associations (for when we will build more than one model)
    - validations  
    - custom methods
3. Create routes
4. Build index page
5. Build Show page
6. Build all routes
7. Build new/create actions
8. Build new form
9. Build edit/update actions
10. Build edit form
11. Build destroy action
12. Delete form

## Week 3 (validations)

1. Add built-in validations
2. Add logic for displaying error messages in new/edit forms
3. Add style to stylesheets for error messages
4. Add custom validations with separate class TwoWordsValidator
5. Add an index and the uniqueness constraint directly to the name column in the products table
6. General conversation about race conditions

## Week 3 (nested forms)

1. Review how the .new method works and what methods are actually being called behind the scenes.
2. Implement a nested form for a belongs_to relationship
3. Optionally allow a user to choose from a brand that already exists or create a new brand
4. Implement a nested form for a has_many relationship
5. Understand the methods provided by the accepts_nested_attributes_for macro
6. Create custom attribute writers and understand why/when they are useful

## Week 4 (Partials, Layout, Helpers)

1. Introduction on refactoring in Rails: the process and the layers
2. Talk about layouts and build new brands.html.erb and products.html.erb
3. Discuss about partials and abstract reused code into new partial files
4. Introduce helpers and create new methods to remove logic from the views

## Week 5 (Nested Routes, N+1 queries, Search Form)

1. Add extra nested and non-nested routes
2. Adjust existing files to support both types of routes
3. Discuss N+1 queries and the differences between count/size/length
4. Implement a search form with form_with and use scope method to query the db

## Week 6 (Authentication and Omniauth)

1. Implement regular authentication: add routes, user model, bcrypt, SessionsController, UsersController, view files
2. Include third-party oauth with omniauth
3. Use env variables and implement each strategy