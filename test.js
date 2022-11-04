const axios = require("axios/index.js");
const fs = require("fs");
async function request(url_request, data_post = {}, method = 'post') {
    
    const params = new URLSearchParams();

    Object.entries(data_post).forEach(entry => {
        const [key, value] = entry;
        params.append(key, value);
    });

    var result = await axios({
        method: method,
        maxContentLength: Infinity,
        maxBodyLength: Infinity,
        url: url_request,
        data: params,
    })
    return result;
}
const varfile = fs.readFileSync('file.txt');

request('http://localhost/prova.php',{mes: varfile.toString()});