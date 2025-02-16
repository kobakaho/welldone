import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  getChildren(event) {
    const parentId = event.target.value;
    if(parentId) {
      fetch(`/categories/get_children?parent_id=${parentId}`, {
        headers: { Accept: "text/vnd.turbo-stream.html" }
      })
        .then(response => response.text())
        .then(html => Turbo.renderStreamMessage(html));
    }
  }

  getGrandchildren(event){
    const childId = event.target.value;
    if(childId) {
      fetch(`/categories/get_grandchildren?child_id=${childId}`, {
        headers: { Accept: "text/vnd.turbo-stream.html" }
      })
        .then(response => response.text())
        .then(html => Turbo.renderStreamMessage(html));
    }
  }
}