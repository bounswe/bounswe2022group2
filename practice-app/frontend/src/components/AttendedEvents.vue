<template>
    <div style="margin: 25px 50px 75px 100px">
        <n-list bordered>
            <template #header>
                <h1>Attended Events</h1>
            </template>
            <n-list-item v-for="event in events">
                <template #prefix>
                    <n-tag type="success" size="large" round>
                        {{ event[0].title }}
                    </n-tag>
                </template>
                <n-thing>
                    <b>Date (yyyy-mm-dd): </b>{{ event[0].date.substr(0, 10) }}<br>
                    <b>Location: </b>{{ event[0].location }}<br>
                    <b>Lesson ID: </b>{{ event[0].lesson_id }}<br>
                </n-thing>
            </n-list-item>
        </n-list>
    </div>
</template>




<script>
import { defineComponent } from 'vue'
import { NButton, NList, NListItem, NThing, NTag, NInput, NSpace, useMessage } from 'naive-ui'

var url = import.meta.env.VITE_API_URL + '/user/attendedEvents' + "?user_id=" + localStorage.getItem('user_id');
export default defineComponent({
    data() {
        return {
            "events": []
        }
    },
    methods: {
        async getAttendedEvents() {
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    console.log(data)
                    this.events = data.events
                });
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
        console.log(url)
        this.getAttendedEvents()
    },
    components: {
        NButton, NList, NListItem, NThing, NTag, NInput, NSpace
    }
})
</script>