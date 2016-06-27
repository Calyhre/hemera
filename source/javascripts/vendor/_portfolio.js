var logos = document.querySelectorAll('.portfolio-section')
var modals = document.querySelectorAll('.portfolio-modal')
var overlay = document.querySelector('.overlay')

for (var i = 0; i < logos.length; i++) {
    logos[i].addEventListener('click', function(evt) {
        evt.preventDefault
        var namePortfolio = this.className.split('--')[1]

        for (var i = 0; i < modals.length; i++) {
            var nameModal = modals[i].className.split('--')[1]
            if (nameModal === namePortfolio) {
                modals[i].classList.add('portfolio-modal--active')
              overlay.classList.add('overlay--active')
            }
        }
    })
}

function hideModal() {
    var modalActive = document.querySelector('.portfolio-modal--active')
		overlay.classList.remove('overlay--active')
    modalActive.classList.remove('portfolio-modal--active')
}

overlay.addEventListener('click', function() {
    hideModal()
})

document.onkeydown = function(e) {
    if (e.keyCode === 27) {
        hideModal()
    }
};
