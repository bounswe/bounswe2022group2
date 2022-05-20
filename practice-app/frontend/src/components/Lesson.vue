<template>
  <div>
    <h1>Create New Course</h1>
    <form @submit="createLesson">
      <div>
        <label for="name">Name</label>
        <input name="name" v-model="name" placeholder="Lesson name">
      </div>
      <div>
        <label for="category">Category</label>
        <input name="category" v-model="category" placeholder="Category">
      </div>
     <!--  <div>
        <label for="lecturer_id">Lecturer ID</label>
        <input name="lecturer_id" v-model="lecturer" placeholder="Lecturer ID">
      </div> -->
      <br>
      <div class="button">
        <button class="submit" type="submit">Create</button>
      </div>
    </form>
  </div>
</template>

<script>


export default {
  name: "App",
  data() {
    return {
      name: "",
      category: "",
      lecturer_id: localStorage.getItem('user_id'),
    };
  },
  methods: {
    async createLesson() {
      const { name, category, lecturer_id } = this;
      console.log(name);
      console.log(category);
      console.log(lecturer_id);
      try {
        const res = await fetch(
          import.meta.env.VITE_API_URL + "/lesson/",
          {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({name, category, lecturer_id})
          }
        );
        const data = await res.json();
        if (res.status == 200) {
          this.$emit("lessonCreated", true);
         // this.$router.replace({ name: "Categories" });
        } else {
          alert(data.resultMessage);
        }
      } catch (err) {
        alert(err);
      }
    },
  },
};
</script>


<style scoped>
form {
  max-width: 600px;
  margin: 30px auto;
  background: #fff;
  text-align: left;
  padding: 20px;
  border-radius: 10px;
}

label {
  color: #aaa;
  display: inline-block;
  margin: 25px 0 15px;
  text-transform: uppercase;
}

input,
select {
  display: block;
  padding: 10px 6px;
  width: 100%;
  box-sizing: bordre-box;
  border: none;
  border-bottom: 1px solid #ddd;
  color: #555;
}

input[type="checkbox"] {
  display: inline-block;
  width: 16px;
  margin: 0 10px 0;
  position: relative;
  top: 2px;
}

.pill {
  display: inline-block;
  margin: 20px 10px 0 0;
  padding: 6px 12px;
  border-radius: 20px;
  font-size: 12px;
  cursor: pointer;
  background: #eee;
}

button {
  background: rgb(7, 24, 7);
  border: 0;
  padding: 10px 20px;
  color: white;
  border-radius: 20px;
}

.submit {
  text-align: center;
}

.error {
  color: #ff0000;
  margin-top: 10px;
  font-size: 0.8em;
  font-weight: bold;
}
</style>


