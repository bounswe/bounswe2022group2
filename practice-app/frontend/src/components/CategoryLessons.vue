<template>
  <div class="container">
    <div class="child">
      <div style="margin: 25px 50px 75px 100px">
        <n-list bordered>
          <template #header>
            <h1>
              Lessons of the {{ selectedCate.title }} Category</h1>
            <tr>
              <th>Item Index</th>
              <th>Id</th>
              <th>Name</th>
            </tr>
          </template>
          <n-list-item v-for="lesson in lessons">
            <tr v-for="(lesson, i) in lessons" :key="lesson.id">
              <td>{{ i + 1 }}</td>
              <td>{{ lesson.id }}</td>
              <td>{{ lesson.name }}</td>
            </tr>
          </n-list-item>
        </n-list>
      </div>
    </div>
  </div>
</template>

<script>
import { NButton, NInput, NList, NListItem, NSpace, NTag, NThing } from 'naive-ui';
export default {
  data() {
    return {
      lessons: [
        {
          "id": "id",
          "category_id": "id",
          "name": "name",
        }
      ],
      selectedCate: {
        "title": "mock1",
        "description": "desc1",
        "id": "id1",
      },
    };
  },
  created() {
    this.lessons = JSON.parse(localStorage.getItem('lessonsByCategory'));
    this.selectedCate = JSON.parse(localStorage.getItem('lessonsSelectedCategory'));
  },

  components: {
    NButton, NList, NListItem, NThing, NTag, NInput, NSpace
  }
};
</script>


<style scoped>
.container {
  font-family: arial;
  font-size: 24px;
  margin: 25px;
  width: 80%;
  outline: dashed 1px black;
  display: flex;
  justify-content: center;
  align-items: center;
}

.child {
  width: 80%;
  height: 100px;
}

th,
td {
  text-align: center;
  width: 400px;
  margin-top: 10px;
  margin-bottom: 10px;
  margin-left: 90px;
  margin-right: 20px;
}
</style>