import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["template", "addItem"]

    addAssociation(event) {
        event.preventDefault()

        let content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, Math.floor(Math.random() * 20))
        this.addItemTarget.insertAdjacentHTML("beforebegin", content)
    }

    deleteAssociation(event) {
        event.preventDefault()

        let item = event.target.closest(".nested-fields")
        item.querySelector("input[name*='_destroy']").value = 1
        item.hidden = true
    }
}
