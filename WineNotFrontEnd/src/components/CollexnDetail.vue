<template>
    <div v-if="collexn">
        <h1 class="text-3xl text-center">{{ collexn.name }}</h1>
        <hr class="border-t-2 border-blue-200 my-3"/>
        <form @submit.prevent="submitForm" method="post">
            <h3 class="font-extralight text-right mt-1">Add a wine to this collection:</h3>
            <div v-for="(wine, index) in form.wines" :key="index" class="wine-form">
                <input type="text" v-model="wine.name" placeholder="Wine name" />
                <input type="text" v-model="wine.link" placeholder="Wine link" />
                <input type="text" v-model="wine.thumb" placeholder="Wine thumb" />
                <input type="text" v-model="wine.country" placeholder="Wine country" />
                <input type="text" v-model="wine.region" placeholder="Wine region" />
                <input
                    type="number"
                    v-model.number="wine.average_rating"
                    step="0.01"
                    placeholder="Wine average rating"
                />
                <input
                    type="number"
                    v-model.number="wine.number_of_ratings"
                    placeholder="Number of ratings"
                />
                <input
                    type="number"
                    v-model.number="wine.price"
                    step="0.01"
                    placeholder="Wine price"
                />
                <button type="button" @click="removeWine(index)">Cancel</button>
                <br />
                <br />
            </div>
            <div class="flex justify-end">
                <button
                    type="button"
                    @click="addWine"
                    class="border 2 border-blue-200 bg-blue-100 rounded-xl px-3 font-semibold text-sm"
                >
                    +
                </button>
            </div>
            <div class="font-semibold flex justify-center ">
            <button class="border-2 border-blue-300 rounded-xl bg-blue-200 px-2 text-lg" type="submit">Update collection</button>
            </div>
        </form>
        <hr class="border-t-2 border-blue-200 my-3"/>
        <h2 class="pb-5 font-semibold">Wines in this collection:</h2>
        <ul>
            <li v-for="wine in collexn.wines" :key="wine.id" class="flex py-3 items-center">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="w-6 h-6 cursor-pointer mr-2 -mb-1 bg-red-100 rounded-xl border border-red-300"
                    @click="removeWine(wine.id)"
                >
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                </svg>
                {{ wine.name }} - ${{ wine.price }}
            </li>
        </ul>
    </div>
    <div v-else>
        <p>Loading...</p>
    </div>
</template>

<script>
import axios from "axios";

export default {
    name: "CollexnDetail",
    props: ["id"],
    data() {
        return {
            form: {
                name: "",
                wines: [],
            },
            collexn: null,
        };
    },
    async mounted() {
        this.getCollexnDetail();
    },
    methods: {
        async getCollexnDetail() {
            try {
                const response = await axios.get(`/api/collexns/${this.id}`);
                this.collexn = response.data;
            } catch (error) {
                console.error(error);
            }
        },

        addWine() {
            this.form.wines.push({
                name: "",
                link: "",
                thumb: "",
                country: "",
                region: "",
                average_rating: "",
                number_of_ratings: "",
                price: "",
            });
        },

        async submitForm() {
            try {
                const response = await axios.put(`/api/collexns/${this.id}/add_wines/`, { wines: this.form.wines });
                // this.collexn.wines.push(...response.data.wines);
                this.collexn = response.data;
                this.form.wines = [];
            } catch (error) {
                console.error(error);
            }
        },

        async removeWine(wineId) {
            try {
                await axios.put(`/api/collexns/${this.id}/remove_wine/${wineId}/`);
                this.collexn.wines = this.collexn.wines.filter((wine) => wine.id !== wineId);
            } catch (error) {
                console.error(error);
            }
        },
    },
};
</script>
