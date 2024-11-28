import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { url: String };

  update(event) {
    fetch(this.urlValue, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({ todo_item: { done: event.target.checked } }),
    });
  }
}
