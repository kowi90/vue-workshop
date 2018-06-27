<template>
  <div>
    <list-element
      v-for="(element, index) in entries" 
      :key="index" 
      :name="element.name"
      :price="element.price"
      :index="index"
      @remove="remove"
      @edit="edit"
      @up="$emit('up', index)"
      @down="$emit('down', index)"
      />
  </div>
</template>
<script>
  import ListElement from './ListElement.vue'

  export default {
    components: { ListElement },
    props: ['entries'],
    methods: {
      remove(index) {
        this.$emit('remove', index)
      },
      edit(payload) {
        this.$emit('edit', payload)
      }
    }
  }
</script>
<style>
</style>
