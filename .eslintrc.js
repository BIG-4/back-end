module.exports = {
  parserOptions: {
    ecmaVersion: 6,
    sourceType: 'module',
  },
  env: {
    node: true,
    es6: true,
    browser: true,
  },
  parser: 'babel-eslint',
  extends: ['airbnb-base'],
  rules: {
    quotes: [2, 'single'],
    semi: [2, 'never'],
    'no-plusplus': ['error', { allowForLoopAfterthoughts: true }],
    'no-console': 0,
    'no-shadow': 0,
    'no-param-reassign': 0,
  },
}
