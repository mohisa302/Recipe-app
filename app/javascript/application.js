// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

// document.addEventListener("DOMContentLoaded", function() {
var modal = document.getElementById('myModal');
var openBtn = document.getElementById('openModalButton');
var closeBtn = document.getElementsByClassName('close')[0];

// Open the modal
function openModal() {
  modal.style.display = 'block';
}

// Close the modal
function closeModal() {
  modal.style.display = 'none';
}

// Close the modal when the close button is clicked
closeBtn.onclick = closeModal;

// Close the modal when the user clicks outside of it
window.onclick = function (event) {
  if (event.target === modal) {
    closeModal();
  }
};

// Open the modal by default
openBtn.onclick = openModal;
// });
