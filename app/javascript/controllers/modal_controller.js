import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["dialog"]

  connect() {
    this.dialog = this.dialogTarget
    console.log("modal.js 読み込みに成功しました")
  }
  
  open(event) {
    event.preventDefault()
    this.dialog.showModal()
  }

  close(event) {
    event.preventDefault()
    this.dialog.close()
  }

  backdropClick(event) {
    // モーダルの外側（backdrop）クリックで閉じる
    if (event.target === this.dialog) {
      this.dialog.close()
    }
  }

  closeModal() {
    this.dialog.close()
  }
  hide(event) {
    event.preventDefault();
    
    this.element.remove();
  }

  hideOnSubmit(event) {
    if (event.detail.success) {
      this.hide();
    }
  }

  disconnect() {
    this.#modalTurboFrame.src = null;
  }

  // private

  get #modalTurboFrame() {
    return document.querySelector("turbo-frame[id='modal']");
  }
}

