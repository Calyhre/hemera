var portfolio_logos = document.querySelectorAll('.portfolio-section');
var portfolio_modals = document.querySelectorAll('.portfolio-modal');
var portfolio_overlay = document.querySelector('.overlay');

for (var i = 0; i < portfolio_logos.length; i++) {
    portfolio_logos[i].addEventListener('click', function(evt) {
        evt.preventDefault;
        var portfolio_name = this.className.split('--')[1];

        var colorsArray = ['#F6A623','#00DF94','#FD587B','#88D1FC']

        var randomColor = colorsArray[Math.floor(Math.random() * colorsArray.length)];

        for (var i = 0; i < portfolio_modals.length; i++) {
            var portfolio_modal = portfolio_modals[i].className.split('--')[1];
            if (portfolio_modal === portfolio_name) {
                portfolio_modals[i].classList.add('portfolio-modal--active');
                portfolio_modals[i].style.backgroundColor = randomColor;
                portfolio_overlay.classList.add('overlay--active');

            }
        }
    });
    portfolio_logos[i].addEventListener('mouseenter', function(evt) {
        var shapesArray = ['circle', 'triangle', 'hamburger', 'cutdot'];
        var randomShape = shapesArray[Math.floor(Math.random() * shapesArray.length)];
        this.style.background = 'url("/images/join-deco--' + randomShape + '.svg") no-repeat center center';
        this.style.backgroundSize = 'contain';

    });
    portfolio_logos[i].addEventListener('mouseleave', function(evt) {
        this.style.background = '';
        this.style.backgroundSize = '';
    });

}

function hideModal() {
    var portfolio_modal__active = document.querySelector('.portfolio-modal--active');
    portfolio_overlay.classList.remove('overlay--active');
    portfolio_modal__active.classList.remove('portfolio-modal--active');
}

if (portfolio_overlay) {
    portfolio_overlay.addEventListener('click', function() {
        hideModal();
    });
}

document.onkeydown = function(e) {
    if (e.keyCode === 27) {
        hideModal();
    }
};
