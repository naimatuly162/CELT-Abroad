import axios from "axios";

let csrf_token = document.head.querySelector('meta[name="csrf-token"]');
axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
axios.defaults.headers.common["X-CSRF-TOKEN"] = csrf_token.content;

const locale = localStorage["celt_locale"]
    ? localStorage["celt_locale"]
    : window.default_locale;

axios.defaults.headers.common["Content-Language"] = locale;

let state = localStorage["appState"];
let AppState = state ? JSON.parse(state) : false;

if (AppState["isLoggedIn"] == true) {
    axios.defaults.headers.common[
        "Authorization"
    ] = `Bearer ${AppState.user.token}`;
}

axios.interceptors.response.use(
    response => response.data,
    error => {
        console.log(error);
        if (error.response.status === 401) {
            localStorage["appState"] = JSON.stringify({
                isLoggedIn: false,
                isVerified: false,
                user: {}
            });
            alert("Session Expired");
        }

        if (error.response.status === 500) {
            return Promise.reject({
                statusCode: error.response.status,
                errors: [],
                message: "Some Internal Server Error !"
            });
        }

        return Promise.reject({
            statusCode: error.response.status,
            errors: error.response.data.errors,
            message: error.response.data.message
        });
    }
);

export default axios;
