const slider = () => {
  const slider = document.getElementById("myRange");
  slider.addEventListener("mousemove", function(){
    const x = slider.value;
    const color = 'linear-gradient(90deg, rgb(243, 232, 215)' + x + '%, rgb(250, 250, 250)' + x + '%)'
    slider.style.background = color;
  });
}
