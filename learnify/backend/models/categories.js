import { readFile } from 'fs/promises';

const categories = JSON.parse(
    await readFile(
      new URL('./categories.json', import.meta.url)
    )
  ).categories;

  export default categories;