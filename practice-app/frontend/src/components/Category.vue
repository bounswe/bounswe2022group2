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
                <br>
                <n-button round="" @click.prevent="fetchLessons(category.id)">See all lessons</n-button>
            </n-list-item>
        </n-list>
    </div>
</template>




<script>
import { NButton, NInput, NList, NListItem, NSpace, NTag, NThing, useMessage } from 'naive-ui';
import { defineComponent } from 'vue';

var url = import.meta.env.VITE_API_URL + '/category';
var lessonUrl = import.meta.env.VITE_API_URL + '/lesson/byCategory';
export default defineComponent({
    data() {
        return {
            "categories": [
                {
                    "title": "mock1",
                    "description": "desc1",
                    "id": "id1",
                },
                {
                    "title": "mock2",
                    "description": "desc2",
                    "id": "id2",
                }
            ],
            suggested: false,
            suggestion: ''
        }
    },
    methods: {
        async fetchLessons(categoryId) {
            try {
                const res = await fetch(
                    lessonUrl + `?category_id=${categoryId}`,
                    {
                        method: "GET",
                        headers: {
                            "Content-Type": "application/json"
                        },
                    }
                );
                const data = await res.json();
                if (res.status == 200) {
                    const params = { lessons: data['lessons'] };
                    localStorage.setItem('lessonsByCategory', JSON.stringify(data['lessons']));
                    localStorage.setItem('lessonsSelectedCategory', JSON.stringify(this.categories.find((c) => c.id == categoryId)));
                    this.$router.push({ name: "CategoryLessons", params: params });
                } else {
                    alert(data.resultMessage);
                }
            } catch (err) {
                alert(err);
            }
        },
        async updateCategories() {
            fetch(url)
                .then(response => response.json())
                .then(data => {
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
        this.updateCategories()
    },
    components: {
        NButton, NList, NListItem, NThing, NTag, NInput, NSpace
    }
})
</script>