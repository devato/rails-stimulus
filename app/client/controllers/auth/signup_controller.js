import { Controller } from "stimulus"

export default class extends Controller {
  // static targets = [ "output" ]

  initialize() {
    this.render()
  }

  render() {
    console.log('rendered signup controller')
  }
}
