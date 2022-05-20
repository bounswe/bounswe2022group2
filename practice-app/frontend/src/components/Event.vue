<template>
  <div>
    <form @submit.prevent="createEvent">
      <div>
        <label for="title">title</label>
        <input name="title" v-model="title" placeholder="Enter event title">
      </div>
      <div>
        <label for="description">description</label>
        <input name="description" v-model="description" placeholder="Enter description">
      </div>
      <div>
        <label for="date">date</label>
        <input name="date" v-model="date" placeholder="Enter date in form of MM-DD-YYY" type="date">
      </div>
      <div>
          <label for="location">location</label>
          <input name="location" v-model="location" placeholder="Enter the location of event">
      </div>
      <div>
          <label for="lesson_id">lesson_id</label>
          <input name="lesson_id" v-model="lesson_id" placeholder="Lesson ID">
      </div>
      <br>
      <div class="button">
        <button class="submit" type="submit">Create Event</button>
      </div>
      <br>
    </form>
  </div>
</template>

<script>


export default {
  watch: {
  },
  name: "App",
  data() {
      return {
          title: "",
          description: "",
          date: "",
          location: "",
          lesson_id: "",
          host_id: localStorage.getItem('user_id'),
        };
  },
  methods: {
    async createEvent() {
        const { title, description, date, location, lesson_id, host_id } = this;
        try {
        const res = await fetch(
            import.meta.env.VITE_API_URL + "/event/createEvent",
            {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                title, description, date, location, lesson_id, host_id
            })
            }
        );
        const data = await res.json();
        if (res.status == 200) {
            this.$emit("eventCreated", true);
            this.$router.replace({ name: "CreateEvent" });
            alert(data.resultMessage);
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


