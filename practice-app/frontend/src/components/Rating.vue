<template>
    <div style="margin: 25px 50px 75px 100px">
        <n-list bordered>
            <template #header>
                <h1>Filter Ratings</h1>
                <n-input pair separator="-" :placeholder="placeholder_filter" clearable @change="handleInputChange" />

                <h1>Add Rating</h1>
                <n-input pair separator="-" :placeholder="placeholder" clearable @change="handleInput" />

            </template>
            <n-list-item v-for="rating in ratings">
                <n-space horizontal>
                    <n-tag size="large" round>
                        {{ rating.name }}
                    </n-tag>
                    <n-tag size="large" round>
                        {{ rating.rating }}
                    </n-tag>

                </n-space>
            </n-list-item>
        </n-list>
        Welcome to rating area.
        You can filter ratings by entering minimum and maximum rating values.
        To rate a lesson, please enter the name and the rating of the class. When rated successfully, the page will
        reload with a pop up message.
        <div class="di">
            You can see the new rating if you filter again. Please clear the input area after every filtering and
            rating.
        </div>
    </div>
</template>




<script>
import axios from 'axios';
import { NButton, NInput, NList, NListItem, NTag, NThing, useMessage } from 'naive-ui';
import { defineComponent } from 'vue';
var url = import.meta.env.VITE_API_URL + '/rating';
export default defineComponent({
    data() {
        return {
            name: [],
            ratings: []
        }
    },
    methods: {
        async handleInputChange(v) {
            axios.get(url, {
                params: {
                    min: v[0],
                    max: v[1]
                }
            })
                .then(data => {
                    this.ratings = data.data
                });
        },

        handleInput(v) {
            let data = { lessonID: v[0], rating: v[1] };
            fetch(url, {
                method: "POST",
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            }).then(response => response.json())
                .then(res => {
                    if (res.resultMessage.match(/successfully created/)) {
                        this.showPopUp();
                        this.$router.go();
                    }
                    else {
                    }
                });
        }
    },
    setup() {
        const message = useMessage()
        return {
            placeholder_filter: ['From', 'To'],
            placeholder: ['LessonID', 'Rating'],
            showPopUp() {
                message.info("Rating was successfully created!");

            }
        }
    },
    async created() { },
    components: {
        NButton, NList, NListItem, NThing, NTag, NInput
    }
})
</script> 