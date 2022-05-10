import { Category } from '../../../models/index.js';
import { validateCategory } from '../../validators/category.validator.js';
import axios from 'axios';

async function getTitle(category) {

    var url = "https://en.wikipedia.org/w/api.php";

    var params = {
        action: "query",
        list: "search",
        srsearch: category,
        format: "json",
        srprop: "titlesnippet"
    };

    url = url + "?origin=*";
    Object.keys(params).forEach(function (key) { url += "&" + key + "=" + params[key]; });

    const res = await axios.get(url);
    if (res.data.query.search.length > 0) {
        return res.data.query.search[0].title;
    } else {
        return await getTitle(res.data.query.searchinfo.suggestion);
    }
}

async function getDescription(title) {
    try {
        const res = await axios.get(`https://en.wikipedia.org/api/rest_v1/page/summary/${title}`);
        let { extract } = res.data;
        return extract;
    } catch (error) {
        return error;
    }
}

async function createCategory(title) {

    const { error } = validateCategory({ "title": title });
    if (error) {
        throw new Error(error.details[0].message);
    }
    title = await getTitle(title);
    const existsingCategory = await Category.find({ title: title })
        .catch((err) => {
            return err;
        });

    if (existsingCategory.length > 0)
        return ({
            "resultMessage": "Category already exists.",
            category: existsingCategory
        });

    const description = await getDescription(title);

    let category = new Category({
        title: title,
        description: description,
    });

    category = await category.save().catch((err) => {
        return err;
    });


    return {
        resultMessage: "Category successfully created.", category: category.toJSON()
    };
}

export {createCategory}; 