// tailwind.config.js
module.exports = {
  content: [
    './app/**/*.{html,erb,js,jsx,ts,tsx}',
    './app/views/**/*.{html,erb,js,jsx,ts,tsx}'
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('daisyui')
  ],
  daisyui: {
    themes: [
      {
        'mytheme': {  // 白とグレー基調のカスタムテーマ
          'primary': '#4B5563', // ダークグレー
          'secondary': '#9CA3AF', // ライトグレー
          'accent': '#F3F4F6', // オフホワイト
          'neutral': '#F9FAFB', // ホワイト
          'base-100': '#FFFFFF', // 背景色はホワイト
          'btn-secondary': '#f3f4f6', // ボタンの背景色
        },
      },
      // 他のテーマも追加可能
    ],
  },
}
