<template>
  <div>
    <div class="columns">
      <div class="column is-1"></div>
      <div class="column is-4">
        <button type="button"  class="button is-primary" @click="setupStream">Ping送信</button>
        <p>{{ storedDatas }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PingMonitoring',
  data () {
    return {
      storedDatas: [],
      param: 'Now Ping Start',
    }
  },
  methods: {
    setupStream () {

      let es = new EventSource("http://localhost:8080/event")
      es.addEventListener('pingmonitor', event => {
        let res = event.data
        this.storedDatas.push(res)
      }, false)

      es.addEventListener('error', event => {
        if (event.readyState === EventSource.CLOSED) {
          console.log('Event was closed')
        }
      }, false)
    }
  }
}
</script>
