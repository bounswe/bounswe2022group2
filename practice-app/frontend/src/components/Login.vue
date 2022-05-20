<template>
  <div>
    <form @submit.prevent="login">
      <div>
        <label for="email">email</label>
        <input name="email" v-model="email" placeholder="Enter email">
      </div>
      <div>
        <label for="password">password</label>
        <input name="password" v-model="password" placeholder="Enter password" type="password">
      </div>
      <br>
      <div class="button">
        <button class="submit" type="submit">Login</button>
      </div>
      <br>
      <div @click="signup">
        <p style="color:#111111">SIGN UP instead</p>
      </div>
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
      email: "",
      password: "",
    };
  },
  methods: {
    async login() {
      const { email, password } = this;
      try {
        const res = await fetch(
          import.meta.env.VITE_API_URL + "/user/login",
          {
            method: "POST",
            headers: {
              "Content-Type": "application/json"
            },
            body: JSON.stringify({
              email, password
            })
          }
        );
        const data = await res.json();
        if (res.status == 200) {
          this.$emit("authenticated", true);
          this.$router.replace({ name: "Categories" });
        } else {
          alert(data.resultMessage);
        }
      } catch (err) {
        alert(err);
      }
    },
    signup() {
      this.$router.push({ name: "Signup" });
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


