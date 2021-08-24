import Http from "./Http";

export function unique(formData) {
    return new Promise((resolve, reject) => {
        Http.post("api/validation/unique", formData)
            .then(res => resolve(res))
            .catch(err => {
                reject(err);
            });
    });
}

export function exists(formData) {
    return new Promise((resolve, reject) => {
        Http.post("api/validation/exists", formData)
            .then(res => resolve(res))
            .catch(err => {
                reject(err);
            });
    });
}
