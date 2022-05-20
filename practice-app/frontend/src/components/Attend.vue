<template>
  <div>
    <form @submit.prevent="attendEvent">
      <div>
        <label for="event_id">event_id</label>
        <input name="event_id" v-model="event_id" placeholder="Enter event_id">
      </div>
      <br>
      <div class="button">
        <button class="attend" type="attend">Attend Event</button>
      </div>
      <br>
    </form>
  </div>
</template>

<script>
var url = import.meta.env.VITE_API_URL + '/user/attend';
export default {
  watch: {
  },
  name: "App",
  data() {
    return {
      event_id: "",
      };
  },
  methods: {
    async attendEvent() {
      const { event_id } = this;
      const user_id = localStorage.getItem('user_id');
      const res = await fetch(url,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            user_id, event_id
          })
        }
      );
      const data = await res.json();
      if (res.status == 200) {
        this.$emit("attended", true);
        this.$router.replace({ name: "Attend" });
        alert(data.resultMessage);
      } else {
        alert(data.resultMessage);
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
