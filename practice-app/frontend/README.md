# frontend

Frontend for practice app developed by bounswe2022group2.


Following resources should help get you started developing with Vue 3 in Vite.


## Environment Variables

It is highly encoruged to fetch the api url from an environment variable.

Environment variable usage in Vite is in following:

Assume you have an .env file like following:
```
    Vite_SOME_KEY="localhost"
```

Then, following code returns "localhost" in .vue files.
```
    import.meta.env.VITE_SOME_KEY
```

It is crucial to add Vite to the beginning of the environment variable, this way you are telling that frontend user shall be able to read the environment variable.
You can read more about it [here](https://vitejs.dev/guide/env-and-mode.html#env-files)

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=johnsoncodehk.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=johnsoncodehk.vscode-typescript-vue-plugin).

## Customize configuration

See [Vite Configuration Reference](https://vitejs.dev/config/).