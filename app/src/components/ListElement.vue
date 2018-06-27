<template>
<div>
  <input type="text" :value="name" @keyup="editName($event)"> - <input type="number" :value="price" @keyup="editPrice($event)">
  <button @click="remove">Remove</button>
  <button @click="up" >Move Up</button>
  <button @click="down">Move Down</button>
</div>
</template>
<script>
export default {
  props: ['name', 'price', 'index'],
  methods: {
    remove() {
      this.$emit('remove', this.index)
    },
    editName(e) {
      this.emitEdit({
          name: e.target.value,
          price: this.price
        })
    },
    editPrice(e) {
      this.emitEdit({
          name: this.name,
          price: e.target.value
        })
    },
    emitEdit(values) {
      this.$emit('edit', {
        index: this.index,
        newval: values
      })
    },
    up () {
      this.$emit('up', this.index)
    },
    down () {
      this.$emit('down', this.index)
    }
  }
}
</script>
<style>
</style>
