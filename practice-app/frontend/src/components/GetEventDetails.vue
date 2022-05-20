<template>
    <div style="margin: 25px 50px 75px 50px">
        <n-list bordered>
            <template #header>
                <h1>Event Details</h1>
            </template>
            <template #footer>
                <n-space vertical>
                    <n-input size="large" round clearable placeholder="Enter an event id to get its details" @change="handleInput" />
                </n-space>
            </template>
            <n-list-item v-for="event in event">
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
            "event": []
        }
    },
    methods: {
        async getDetails(eventId) {
            try {
                const res = await fetch(
                    import.meta.env.VITE_API_URL + '/event/details/' + `?event_id=${eventId}`,
                    {
                        method: "GET",
                        headers: {
                            "Content-Type": "application/json"
                        },
                    }
                );
                const data = await res.json();
                if (res.status == 200) {
                    this.event = data.event;
                    this.showMessage(data.resultMessage);
                    this.$emit("getDetailsFetched", true);
                    this.$router.replace({ name: "GetEventDetails" });
                } else {
                    this.showMessage(data.resultMessage);
                }
            } catch (err) {
                this.showMessage(err);
            }
        },

        handleInput(v) {
            this.getDetails(v)
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
