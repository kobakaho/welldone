import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category"
export default class extends Controller {
  connect() {
    console.log("category.js 読み込みに成功しました")
  }
  fetchParents(event) {
    const rootId = event.target.value;

    document.getElementById("get_parents").innerHTML = `<option value="" style="display: none;"></option>`;    
    document.getElementById("get_children").innerHTML = `<option value="" style="display: none;"></option>`;    

    if (rootId) {
      fetch(`/categories/get_parents?root_id=${rootId}`, {
        headers: {
          Accept: "text/vnd.turbo-stream.html"
        }
      })
      .then(response => response.text())
      .then(html => {
        document.getElementById("get_parents").innerHTML = html;
      })
      .catch(error => console.error("Error:", error));
    }
  };

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
