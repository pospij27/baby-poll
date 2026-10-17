# 👶 Baby Pool
The guessing game is closed — the site now shows the final results: gender predictions, birth date guesses (as a chart of guesses per day of October) and the suggested names. Guesses are anonymous; the page never shows who guessed what.

Languages: 🇬🇧 English · 🇨🇿 Česky · 🇺🇦 Yкраїнська · 🇳🇴 Norsk

Built with plain HTML/CSS/JS, hosted on GitHub Pages, data stored in Supabase.

https://pospij27.github.io/baby-poll/

## When the baby arrives
Open `index.html`, find the `BABY` block near the top of the script and fill it in:

```js
const BABY = {
  date: '2026-10-19',  // birth date (required — this switches the page into "arrived" mode)
  time: '14:32',       // optional
  gender: 'boy',       // 'girl' or 'boy'
  weight: '',          // optional, e.g. '3.4 kg'
};
```

The page then announces the birth ("It's a boy! · Born 19 October at 14:32"), marks the birth day on the chart and shows how many guessed the gender and the exact day and how close the nearest guess was. The baby's name is never shown.

## Database lock-down
Run [`supabase/lock-down.sql`](supabase/lock-down.sql) once in the Supabase SQL Editor. It makes the table read-only for the public key and hides the guessers' names.

## Archive
The original voting site is kept read-only in [`archive/index.html`](archive/index.html) (https://pospij27.github.io/baby-poll/archive/).
