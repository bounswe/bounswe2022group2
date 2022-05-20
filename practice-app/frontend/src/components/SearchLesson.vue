<template>
     <div style="margin: 25px 50px 75px 50px">
         <n-list bordered>
             <template #header>
                 <h1>Search Lesson</h1>
             </template>
             <template #footer>
                 <n-space vertical>
                     <n-input size="large" round clearable placeholder="Enter a lesson name to get lessons with the given name" @change="handleInput" />
                 </n-space>
             </template>
             <n-list-item v-for="lesson in lessons">
                 <template #prefix>
                     <n-tag type="success" size="large" round>
                         {{ lesson.name }}
                     </n-tag>
                 </template>
                 <n-thing>
                     <b>Category ID: </b>{{ lesson.category_id }}<br>
                     <b>Lecturer ID: </b>{{ lesson.lecturer }}<br>
                 </n-thing>
             </n-list-item>
         </n-list>
     </div>
 </template>




 <script>
 import { defineComponent } from 'vue'
 import { NButton, NList, NListItem, NThing, NTag, NInput, NSpace, useMessage } from 'naive-ui'
 var url = "";
 export default defineComponent({
     data() {
         return {
             "lessons": []
         }
     },
     methods: {
         async getLessons(name) {
             try {
                 const res = await fetch(
                     import.meta.env.VITE_API_URL + '/lesson/byName/' + `?name=${name}`,
                     {
                         method: "GET",
                         headers: {
                             "Content-Type": "application/json"
                         },
                     }
                 );
                 const data = await res.json();
                 if (res.status == 200) {
                     this.lessons = data.lessons;
                     this.showMessage(data.resultMessage);
                     this.$emit("lessonFetched", true);
                     this.$router.replace({ name: "SearchLesson" });
                 } else {
                     this.showMessage(data.resultMessage);
                 }
             } catch (err) {
                 this.showMessage(err);
             }
         },
         handleInput(v) {
             this.getLessons(v)
         },
     },
     setup() {
         const message = useMessage()
         return {
             showMessage(m) {
                 message.info(m)
             }
         };
     },
     async created() {
         console.log(url);
     },
     components: {
         NButton, NList, NListItem, NThing, NTag, NInput, NSpace
     }
 })
 </script>