<template>
  <div id="app" class="d-flex flex-column justify-center">
    <Profile class="centered"/>
  </div>
</template>

<script>
import Profile from './components/Profile.vue';

export default {
  name: 'App',
  components: {
    Profile,
  },
};
</script>

<style lang="scss">
#app {
 background-color: #E5E5E5;
}
</style>
