<template>
    <div style="margin: 25px 50px 75px 50px">
        <n-list bordered>
            <template #header>
                <h1>Enrolled Lessons</h1>
            </template>
            <template #footer>
                <n-space vertical>
                    <n-input size="large" round clearable placeholder="Enter a lesson id to drop the lesson" @change="handleInput" />
                </n-space>

            </template>
            <n-list-item v-for="lesson in lessons">
                <template #prefix>
                    <n-tag type="success" size="large" round>
                        {{ lesson.name }}
                    </n-tag>
                </template>
                <n-tag type="success" size="large" round>
                    Lesson id: {{ lesson.id }}
                </n-tag>
                    <n-tag type="success" size="large" round>
                    Category id: {{ lesson.category_id }}
                </n-tag>
                <n-tag type="success" size="large" round>
                    Lecturer id: {{ lesson.lecturer }}
                </n-tag>
            </n-list-item>
        </n-list>
    </div>
</template>




<script>
import { NButton, NInput, NList, NListItem, NSpace, NTag, NThing, useMessage } from 'naive-ui';
import { defineComponent } from 'vue';

var enrolledLessonsUrl = import.meta.env.VITE_API_URL + '/user/enrolled' + '/?user_id=' + localStorage.getItem('user_id');
var dropLessonUrl = import.meta.env.VITE_API_URL + '/user/enrolled/drop';
export default defineComponent({
    data() {
        return {
            "lessons": []
        }
    },
    methods: {
        
        async updateEnrolledLessons() {
            fetch(enrolledLessonsUrl)
                .then(response => response.json())
                .then(data => {
                    this.lessons = data.lessons;
                });
        },
        sendPostReq(lesson_id) {
            let data = { user_id: localStorage.getItem('user_id'), lesson_id: lesson_id };
            fetch(dropLessonUrl, {
                method: "POST",
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            }).then(response => response.json())
                .then(res => {
                    if (res.status == 200) {
                        this.updateEnrolledLessons();
                        this.showMessage(res.resultMessage);
                        this.$emit("lessonDropped", true);
                        this.$router.replace({ name: "EnrolledLessons" });
                    }
                    else {
                        this.showMessage(res.resultMessage);
                    }
                });
        },
        handleInput(v) {
            this.sendPostReq(v)
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
        this.updateEnrolledLessons()
    },
    components: {
        NButton, NList, NListItem, NThing, NTag, NInput, NSpace
    }
})
</script>