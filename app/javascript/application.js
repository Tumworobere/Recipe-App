// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.querySelector('.click_btn').addEventListener('click', () => {
  document.querySelector('.form-group').classList.toggle('hide')
})