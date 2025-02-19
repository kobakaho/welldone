import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category"
export default class extends Controller {
  connect() {
    console.log("category.js 読み込みに成功しました")
  }

  fetchChildren(event) {
    const parentId = event.target.value;

    if (parentId) {
      fetch(`/categories/get_children?parent_id=${parentId}`, {
        headers: { 
          Accept: "text/vnd.turbo-stream.html"
        }
      })
      .then(response => response.text())
      .then(html => {
        document.getElementById("get_children").innerHTML = html;
      })
      .catch(error => console.error("Error:", error));
    }
  }
}
