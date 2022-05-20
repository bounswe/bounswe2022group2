<template>
    <div style="margin: 25px 50px 75px 100px">
        <n-list bordered>
            <template #header>
                <h1>Filter Ratings</h1>
                <n-input pair separator="-" :placeholder="placeholder_filter" clearable @change="storeFValue" @keyup.enter="handleInputChange" />

                <h1>Add Rating</h1>
                <n-input pair separator="-" :placeholder="placeholder" clearable @change="storeRValue" @keyup.enter="handleInput" />

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
        To rate a lesson, please enter the name and the rating of the class.
    </div>
</template>




<script>
import axios from 'axios';
import { NButton, NInput, NList, NListItem, NTag, NThing, useMessage } from 'naive-ui';
import { defineComponent } from 'vue';
var url = import.meta.env.VITE_API_URL + '/rating';
var rating = [];
var filter = [];
export default defineComponent({
    data() {
        return {
            name: [],
            ratings: []
        }
    },
    methods: {
        async handleInputChange() {
            axios.get(url, {
                params: {
                    min: filter[0],
                    max: filter[1]
                }
            })
                .then(data => {
                    this.ratings = data.data
                });
        },
        storeRValue(v){
            rating = v;
        },
        storeFValue(v){
            filter = v;
        },
        handleInput() {

            let data = { lessonID: rating[0], rating: rating[1] };
            fetch(url, {
                method: "POST",
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            }).then(response => response.json())
                .then(res => {
                    if (res.resultMessage.match(/successfully created/)) {
                        this.showPopUp(true);
                        setTimeout(() => { console.log("World!"); }, 5000);
                        // this.$router.go();
                    }
                    else {
                        this.showPopUp(false);
                    }
                });
        }
    },
    setup() {
        const message = useMessage()
        return {
            placeholder_filter: ['From', 'To'],
            placeholder: ['LessonID', 'Rating'],
            showPopUp(flag) {
                if(flag){
                    message.info("Rating was successfully created!");
                }else{
                    message.info("Couldn't rate successfully!")
                }

            }
        }
    },
    async created() { },
    components: {
        NButton, NList, NListItem, NThing, NTag, NInput
    }
})
</script> 