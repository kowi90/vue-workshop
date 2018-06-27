<template>
  <div>
    <div v-if="!print">
      <entry @create-entry="addEntry" />
      <list 
        :entries="entryList"
        @remove="remove"
        @edit="modifyList"
        @up="up"
        @down="down"
         />
      <button v-if="this.entryList.length > 0" @click="()=> {print = true}">Print</button>
    </div>
    <div v-if="print">
      <h2>My shopping list</h2>
      <table>
      <tr>
        <td>
          Item name
        </td>
        <td>
          Item price
        </td>
      </tr>
      <tr v-for="(entry, index) in entryList" :key="index">
        <td>{{entry.name}}</td><td>{{entry.price}} $</td>
      </tr>
      </table>
      <button @click="reset">New shopping list</button>
    </div>
  </div>
</template>
<script>
  import List from './List.vue'
  import Entry from './Entry.vue'
  import Vue from 'vue'

  export default {
    data() {
      return {
        entryList: [],
        print: false
      }
    },
    components: { List, Entry },
    methods: {
     addEntry (payload) {
      this.entryList.push(payload)
     },
     remove(index) {
       this.entryList.splice(index, 1)
     },
     reset() {
       this.entryList = []
       this.print = false
     },
     modifyList (payload) {
       Vue.set(this.entryList, payload.index, {
         name: payload.newval.name,
         price: payload.newval.price
       })
     },
     up (index) {
       if (index == 0) {
         return
       }
       let current = this.entryList[index]
       let temp  = this.entryList[index - 1]
       
       Vue.set(this.entryList, index - 1, current)
       Vue.set(this.entryList, index, temp)
     },
     down (index) {
       if (index == (this.entryList.length -1) ) {
         return
       }
       let current = this.entryList[index]
       let temp  = this.entryList[index + 1]
       
       Vue.set(this.entryList, index + 1, current)
       Vue.set(this.entryList, index, temp)
     }
    }
  }
</script>
<style>
</style>
