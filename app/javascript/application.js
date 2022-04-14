// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.querySelector('.click_btn').addEventListener('click', () => {
  document.querySelector('.modals').style.display = 'block'
 })

document.querySelector('.modal-contents > div:first-of-type > span').addEventListener('click', () => {
  document.querySelector('.modals').style.display = 'none'
})