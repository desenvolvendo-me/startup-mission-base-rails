module.exports = {
    content: [
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js',
        './app/views/**/*',
        './node_modules/flowbite/**/*.js'
    ],
    theme: {
        extend: {},
    },
    plugins: [
        require('flowbite/plugin')
    ]
}