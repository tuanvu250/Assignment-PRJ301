function updateFilter(param, value) {
    let contextPath = "/" + window.location.pathname.split("/")[1]; // Lấy contextPath động
    let newController = contextPath + "/searchFilter"; 

    let url = new URL(window.location.href);
    let params = new URLSearchParams(url.search);

    if (params.get(param) === value) {
        params.delete(param);
    } else {
        params.set(param, value);
    }

    window.location.href = url.origin + newController + "?" + params.toString();
}