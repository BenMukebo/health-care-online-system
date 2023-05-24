const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/**/*.{html,js,erb}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'primary': '#171717',
        'secondary': '#2719C5',
        'white': '#FFFFFF',
        'nav-color': 'rgba(255, 255, 255, 0.75',
        'nav-bg': '#90BADD',
        'footer-bg': '#0d0d0d',
        'footer-color': '#d0daf5',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
