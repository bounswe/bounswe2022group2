<template>
    <div style="margin: 25px 50px 75px 100px">
        <n-list bordered>
            <template #header>
                <h1>Lesson Events</h1>
            </template>
            <template #footer>
                <n-space vertical>
                    <n-input size="large" round clearable placeholder="Enter a lesson id to get its events" @change="handleInput" />
                </n-space>
            </template>
            <n-list-item v-for="event in events">
                <template #prefix>
                    <n-tag type="success" size="large" round>
                        {{ event.title }}
                    </n-tag>
                </template>
                <n-thing>
                    <b>Date (yyyy-mm-dd): </b>{{ event.date.substr(0, 10) }}<br>
                    <b>Location: </b>{{ event.location }}<br>
                    <b>Host ID: </b>{{ event.host_id }}<br>
                    <b>Lesson ID: </b>{{ event.lesson_id }}<br>
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
            "events": []
        }
    },
    methods: {
        async getLessonEvents(lessonId) {
            try {
                const res = await fetch(
                    import.meta.env.VITE_API_URL + '/lesson/events/' + `?lesson_id=${lessonId}`,
                    {
                        method: "GET",
                        headers: {
                            "Content-Type": "application/json"
                        },
                    }
                );
                const data = await res.json();
                if (res.status == 200) {
                    this.events = data.events;
                    this.showMessage(data.resultMessage);
                    this.$emit("lessonEventFetched", true);
                    this.$router.replace({ name: "LessonEvents" });
                } else {
                    this.showMessage(data.resultMessage);
                }
            } catch (err) {
                this.showMessage(err);
            }
        },

        handleInput(v) {
            this.getLessonEvents(v)
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