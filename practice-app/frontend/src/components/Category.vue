<template>
    <div style="margin: 25px 50px 75px 100px">
        <n-list bordered>
            <template #header>
                <h1>Categories</h1>
            </template>
            <template #footer>
                <n-input size="large" round clearable placeholder="Add Category" @change="handleInput" />
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
import { NButton, NList, NListItem, NThing, NTag, NInput, useMessage } from 'naive-ui'

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
            ]
        }
    },
    methods: {
        async updateCategories() {
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    this.categories = data
                });
        },
        handleInput(v) {
            let data = { title: v };

            fetch(url, {
                method: "POST",
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            }).then(response => response.json())
                .then(res => {
                    if (res.resultMessage.match(/successfully created/)) {
                        this.updateCategories();
                    }
                    else {
                        this.showMessage(res.resultMessage)
                    }
                });
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
        NButton, NList, NListItem, NThing, NTag, NInput
    }
})
</script>