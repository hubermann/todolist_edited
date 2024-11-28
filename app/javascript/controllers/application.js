import { Application } from "@hotwired/stimulus";
import TodoItemController from "./controllers/todo_item_controller";

const application = Application.start();

application.register("todo-item", TodoItemController);

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
