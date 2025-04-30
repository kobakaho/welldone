import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading"
export default class extends Controller {
  static targets = ["spinner"]

  connect() {
    console.log("loading.js 読み込みに成功しました")
    this.hide()
  }
  show() {
    this.spinnerTarget.classList.remove("hidden")
  }
  hide() {
    this.spinnerTarget.classList.add("hidden")
    //リロードして閉じる 現状画面遷移までの間で閉じる
  }
}
