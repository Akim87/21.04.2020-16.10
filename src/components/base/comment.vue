<template>
  <div class="comment">
    <div class="comment__header">
      <span class="comment__user-name">{{ userName }}</span>
      <span class="comment__date">{{ date }}</span>
    </div>
    <div class="comment__body">
      <p class="comment__text">{{ text }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'comment',
  props: {
    userName: String,
    date: String,
    text: String,
  },
};
</script>

<style lang="scss">
.comment {
  &__header {
    margin-bottom: 3%;
  }
  &__user-name {
    font-weight: bold;
    margin-right: 2%;
  }
  &__date {
    font-size: 0.75rem;
    color: #808080;
  }
  &__body {
    background: #f2fbff;
    border: 1px solid #c4cbcf;
    padding: 3%;
    position: relative;
    box-shadow: 0px 4px 10px rgba(128, 128, 128, 0.1);
    &:before {
      content: ' ';
      position: absolute;
      width: 0;
      height: 0;
      left: 50px;
      top: -10px;
      border: 5px solid;
      border-color: transparent transparent #c4cbcf #c4cbcf;
    }
    &::after {
      content: ' ';
      position: absolute;
      width: 0;
      height: 0;
      left: 51px;
      top: -8px;
      border: 4px solid;
      border-color: transparent transparent #f2fbff #f2fbff;
    }
  }
}
</style>
