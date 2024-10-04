# TODO List

This repository contains a very basic TODO list application with these
features:

- CRUD TODO lists
  - C: Add a new TODO list
  - R: See a list of TODO lists, and see a particular TODO list (with its items)
  - U: Change the name of a TODO list
  - D: Remove a TODO list (and all its items)
- CRUD TODO items
  - C: Add a new TODO item to a TODO list
  - R: See a list of TODO items for a particular TODO list
  - U: Change the status of a TODO item (`done = true / false`)
  - D: Remove all `done` TODO items for a particular TODO list

We want to improve its usability and make it a bit more modern.

We want to implement these features:

- When marking / unmarking a TODO item as done, instead of redirecting
  on change, update the view in place.
- When adding a new TODO item, instead of redirecting to the updated list, append
  the freshly created item to the list
- Add a search bar to filter the list of TODO items by name, filyer this in the front end.
- When editing a TODO list name, instead of redirecting to a new page,
  make the edit inline
- If two users are seeing the same TODO list, and one of the user
  creates a TODO item or marks / unmarks a TODO item as done, the other
  user should be able to see the change without needing to refresh the
  page

Other nice to have features would include:

- When creating a new TODO item, add an animation to see what changed.
- Add a delay to the updates in the TODO list items action, update the UI optimistically.
- If you're feeling creative you can propose any change you'd like

## Developing

You need ruby 3.3.4 and [bun](https://bun.sh/).

Run `bundle install` to install ruby dependencies.
Run `bun install` to install javascript dependencies.
Run `./bin/rails db:migrate` to create and migrate database.

Start all processes you need to run on local with `./bin/dev`

## Testing

Call `./bin/rails test`
