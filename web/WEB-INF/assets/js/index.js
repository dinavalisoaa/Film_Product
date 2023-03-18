function openPopup() {
    var variable = document.getElementById("idea-full");
    var main =document.getElementById("idea-main-card");
    variable.style.display = "block";
    main.style.animation = "scale";
    main.style.animationDirection = "forward";
    main.style.animationDuration = "200ms";
    let close = document.getElementById("idea-close");
    close.addEventListener('click',function () {
        variable.style.display = "none";
    });
}
function openModal(id ) {
    var variable = document.getElementById("idea-full-"+id);
    var main =document.getElementById("idea-main-card");
    variable.style.display = "block";
    main.style.animation = "scale";
    main.style.animationDirection = "forward";
    main.style.animationDuration = "200ms";
    let close = document.getElementById("idea-close-"+id);
    close.addEventListener('click',function () {
        variable.style.display = "none";
    });
}