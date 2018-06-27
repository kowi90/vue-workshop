<template>
  <div>
    <div>
     Entry: <input type="text" v-model="entry">
     Price: <input v-model="amount" type="number">
     <button @click="createEntry">{{buttonText}}</button>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        buttonText: 'Add',
        amount: 0,
        entry: ''
      }
    },
    methods: {
      createEntry () {
        this.$emit('create-entry', {
          name: this.entry,
          price: this.amount
        })
        this.amount = 0
        this.entry = ''
      }
    }
  }
</script>
<style>
</style>
