function createInput(name, type, classes, required, event = null) {
    const input = document.createElement("input");
    input.type = type;
    input.name = name;
    input.className = classes;
    input.required = required;
    if (event !== null) {
        input.addEventListener(event.event, event.handler);
    }
    return input;
}

function createSelect(name, options, classes, required, event = null) {
    const select = document.createElement("select");
    select.name = name;
    select.className = classes;
    select.required = required;
    options.forEach(option => {
        const opt = document.createElement("option");
        opt.value = option.value;
        opt.text = option.text;
        opt.selected = option.selected;
        select.appendChild(opt);
    });
    if (event !== null) {
        select.addEventListener(event.event, event.handler);
    }
    return select;
}

function createButton(type, classes, text, event = null) {
    const btn = document.createElement("button");
    btn.type = type;
    btn.className = classes;
    btn.textContent = text;
    if (event !== null) {
        btn.addEventListener(event.event, event.handler);
    }
    return btn;
}