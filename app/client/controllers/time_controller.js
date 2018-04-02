import { Controller } from 'stimulus'

export default class extends Controller {

  static targets = ['time_zone', 'display_time', 'display_time_zone']

  initialize() {
    var time = this
    this.setTimeZone = this.time_zone
    setInterval(function() {
      time.render()
    }, 1000)
  }

  render() {
    console.log(this.time_zone)
    this.display_time.innerHTML = moment().tz(this.time_zone).format('MMMM Do YYYY, h:mm:ss a')
    this.display_time_zone.innerHTML = this.time_zone
    console.log(this.data.get('endpoint'))
  }

  changed_zone() {
    this.setPreviousTimeZone = this.data.get('time_zone')
    this.setTimeZone = this.time_zone
    this.render()
  }

  set_previous_time_zone() {
    this.select_time_zone.value = this.data.get('previous_time_zone')
    this.render()
  }

  get select_time_zone() {
    return this.time_zoneTarget
  }

  get time_zone() {
    return this.time_zoneTarget.value
  }

  get display_time() {
    return this.display_timeTarget
  }
  get display_time_zone() {
    return this.display_time_zoneTarget
  }

  set setTimeZone(value) {
    this.data.set('time_zone', value)
  }

  set setPreviousTimeZone(value) {
    this.data.set('previous_time_zone', value)
  }
}
