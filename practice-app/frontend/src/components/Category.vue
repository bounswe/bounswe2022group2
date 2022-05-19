<template>
    <div style="margin: 25px 50px 75px 100px">
        <n-list bordered>
            <template #header>
                <h1>Categories</h1>
            </template>
            <template #footer>
                <n-space vertical>
                    <n-input size="large" round clearable placeholder="Add Category" @change="handleInput" />
                    <n-space v-if="suggested">
                        <n-thing :description="'Did you mean ' + suggestion + '?'" />
                        <n-button style="margin-top: 25px" @click="handleSuggestion">Yes</n-button>
                    </n-space>
                </n-space>

            </template>
            <n-list-item v-for="category in categories">
                <template #prefix>
                    <n-tag type="success" size="large" round>
                        {{ category.title }}
                    </n-tag>
                </template>
                <n-thing :description="category.description" />
            </n-list-item>
        </n-list>
    </div>
</template>




<script>
import { defineComponent } from 'vue'
import { NButton, NList, NListItem, NThing, NTag, NInput, NSpace, useMessage } from 'naive-ui'

var url = import.meta.env.VITE_API_URL + '/category';
export default defineComponent({
    data() {
        return {
            "categories": [
                {
                    "title": "mock1",
                    "description": "desc1"
                },
                {
                    "title": "mock2",
                    "description": "desc2"
                }
            ],
            suggested: false,
            suggestion: ''
        }
    },
    methods: {
        async updateCategories() {
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    console.log(data)
                    this.categories = data
                });
        },
        sendPostReq(title) {
            let data = { title: title };
            fetch(url, {
                method: "POST",
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            }).then(response => response.json())
                .then(res => {
                    console.log(res)
                    if (res.resultMessage.match(/successfully created/)) {
                        this.updateCategories();
                    }
                    else if (res.resultMessage.match(/mean/)) {
                        this.suggested = true
                        this.suggestion = res.suggestion
                    }
                    else {
                        this.showMessage(res.resultMessage)
                    }
                });
        },
        handleInput(v) {
            this.sendPostReq(v)
        },
        handleSuggestion() {
            this.suggested = false
            this.sendPostReq(this.suggestion)
        }
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
        this.updateCategories()
    },
    components: {
        NButton, NList, NListItem, NThing, NTag, NInput, NSpace
    }
})
</script>