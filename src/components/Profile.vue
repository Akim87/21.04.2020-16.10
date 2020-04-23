<template>
  <div class="profile">
    <section class="profile__user user d-flex align-start">
      <img class="user__photo" :src="require(`../assets/${user.avatar}`)" alt="User photo" />
      <div class="user__info d-flex flex-column">
        <span class="user__name">{{ user.name }}</span>
        <span class="user__position">{{ user.position }}</span>
        <p class="user__status">{{ user.status }}</p>
        <div class="user__services services">
          <span class="services__title">Услуг</span>
          <div class="services__block">
            <div
              class="services__item d-flex justify-between align-center"
              v-for="service in user.services"
              :key="service.id"
            >
              <div class="services__progress">
                <span class="services__name">{{ service.name }}</span>
                <div
                  class="services__current-progress"
                  :style="{
                    width: (service.value / getTotalServices) * 100 + '%',
                    backgroundColor: service.value / getTotalServices > 0.5 ? `#b1e19b` : `#ACE2F8`
                  }"
                ></div>
              </div>
              <span class="services__value">{{ service.value }}</span>
            </div>
          </div>
          <div class="services__total d-flex justify-between align-center">
            <span>Всего</span>
            <span>{{ getTotalServices }}</span>
          </div>
        </div>
      </div>
    </section>
    <section class="profile__comments comments">
      <div class="comments__header d-flex justify-between align-center">
        <div class="comments__categories">
          <button class="comments__selector--active">Последние отзывы</button>
          <button class="comments__selector">Все отзывы</button>
        </div>
        <div class="comments__icons-container d-flex">
          <div class="comments__icon-box d-flex align-center">
            <button @click.prevent="onLikeClick">
              <icon-like class="comments__icon" :class="{ like__active: user.isLiked }" />
            </button>
            <span class="comments__icons-number">{{ user.likes }}</span>
          </div>
          <div class="comments__icon-box d-flex align-center">
            <icon-comment class="comments__icon" />
            <span class="comments__icons-number">{{ user.comments.length }}</span>
          </div>
        </div>
      </div>
      <div class="comments__body">
        <comment
          class="comments__item"
          v-for="comment in user.comments"
          :key="comment.id"
          v-bind="comment"
        />
      </div>
    </section>
    <div class="input-box d-flex flex-column align-center">
      <textarea
        class="input-box__textarea"
        v-model="newComment"
        @keyup.ctrl.enter.prevent="addComment"
      ></textarea>
      <button class="input-box__button" @click.prevent="addComment">Написать консультанту</button>
    </div>
  </div>
</template>

<script>
import iconLike from './icons/iconLike.vue';
import iconComment from './icons/iconComment.vue';
import comment from './base/comment.vue';

export default {
  name: 'Profile',
  components: {
    iconLike,
    iconComment,
    comment,
  },
  data() {
    return {
      user: {
        avatar: 'avatar-veronica.jpg',
        name: 'Вероника Ростова',
        position: 'Менеджер по продажам',
        status: 'Подберу для вас самые лучшие предложения. Мои услуги абсолютно бесплатны',
        services: [
          {
            id: 1,
            name: 'Ручное бронирование',
            value: 11,
          },
          {
            id: 2,
            name: 'Пакетные туры',
            value: 3,
          },
          {
            id: 3,
            name: 'Отели',
            value: 1,
          },
        ],
        likes: 131,
        isLiked: false,
        comments: [
          {
            id: 1,
            userName: 'Самуил',
            date: '13 октября 2011',
            text: 'Привет, Верунь! ниче себе ты крутая. фотка класс!!!!',
          },
          {
            id: 2,
            userName: 'Лилия Семёновна',
            date: '14 октября 2011',
            text:
              'Вероника, здравствуйте! Есть такой вопрос: Особый вид куниц жизненно стабилизирует кинетический момент, это и есть всемирно известный центр огранки алмазов и торговли бриллиантами?',
          },
          {
            id: 3,
            userName: 'Лилия Семёновна',
            date: '14 октября 2011',
            text:
              'Вероника, здравствуйте! Есть такой вопрос: Особый вид куниц жизненно стабилизирует кинетический момент?',
          },
        ],
      },
      newComment: '',
    };
  },
  computed: {
    getTotalServices() {
      return this.user.services.reduce((acc, x) => acc + x.value, 0);
    },
    newCommentId() {
      return this.user.comments.length + 1;
    },
  },
  methods: {
    onLikeClick() {
      this.user.isLiked = !this.user.isLiked;
      if (this.user.isLiked) {
        this.user.likes += 1;
      } else {
        this.user.likes -= 1;
      }
    },
    addComment() {
      this.user.comments.push({
        id: this.newCommentId,
        userName: 'Джон Доу',
        date: new Date().toLocaleDateString(),
        text: this.newComment,
      });
      this.newComment = '';
    },
  },
};
</script>

<style lang="scss">
.profile {
  max-width: 720px;
  width: 100%;
  background-color: #ffffff;
}

.user {
  line-height: 1.25rem;
  padding: 4%;

  &__photo {
    border-radius: 50%;
    z-index: 2;
    max-width: 125px;
    width: 25vw;
  }
  &__info {
    position: relative;
    align-self: baseline;
    width: 100%;
    margin: 1% 0 1% 2%;
  }
  &__name {
    font-weight: bold;
  }
  &__position {
    font-size: 0.875rem;
    color: #808080;
    margin-bottom: 2%;
  }
  &__status {
    background-color: #fffbc8;
    border: 1px solid #dadada;
    border-radius: 5px;
    transform: translateX(-9%);
    padding: 2% 2% 2% 10%;
    z-index: 1;
    width: 110%;
    font-size: 0.875rem;
    margin-bottom: 5%;
  }
}

.services {
  &__title {
    font-size: 0.8125rem;
    margin: 0 5% 2% 0;
    display: block;
    text-align: end;
  }
  &__block {
    border-top: 1px solid #dadada;
    border-bottom: 1px solid #dadada;
    padding: 3% 6% 2% 0;
  }
  &__item {
    margin-bottom: 1%;
  }
  &__progress {
    position: relative;
    display: flex;
    justify-content: space-between;
    width: 100%;
    max-width: 90%;
  }
  &__name {
    position: absolute;
    transform: translateY(-50%);
    top: 50%;
    padding-left: 2%;
    font-size: 0.8125rem;
  }
  &__current-progress {
    height: 100%;
    min-height: 24px;
  }
  &__value {
    font-weight: bold;
    min-width: 12px;
  }
  &__total {
    padding: 3% 6% 2% 0;
    font-weight: bold;
  }
}

.comments {
  padding: 4%;
  &__header {
    margin-bottom: 3%;
  }
  &__categories {
    flex-grow: 1;
  }
  &__selector {
    font-size: 0.875rem;
    text-decoration-line: underline;
    color: #005da1;
    margin-right: 3%;
    &--active {
      font-weight: bold;
      margin-right: 3%;
    }
  }
  &__icon-box {
    padding-left: 12px;
  }
  &__icons-number {
    font-size: 0.75rem;
    padding-left: 2px;
  }
  &__item {
    margin-bottom: 3%;
  }
}

.input-box {
  padding: 4%;
  background-color: #f2f2f2;

  &__textarea {
    border: 1px solid #000000;
    border-radius: 1px;
    resize: none;
    width: 100%;
    margin-bottom: 3%;
    min-height: 60px;
    padding: 1%;
  }
  &__button {
    background: #fdd639;
    border-radius: 23px;
    width: 60%;
    padding: 2% 0;
    transition: all 0.3s linear;
    &:hover {
      background-color: #333333;
      color: #fdd639;
    }
    @media only screen and (max-width: 400px) {
      font-size: 0.875rem;
    }
  }
}
</style>
