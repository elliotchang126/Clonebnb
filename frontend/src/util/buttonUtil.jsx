const handleMouseover = e => {
    const rect = e.target.getBoundingClientRect();
    const x = (e.clientX - rect.left) * 100 / e.target.clientWidth;
    const y = (e.clientY - rect.top) * 100 / e.target.clientHeight;
    
    e.target.style.setProperty('--mouse-x', x)
    e.target.style.setProperty('--mouse-y', y)
}

export default handleMouseover;