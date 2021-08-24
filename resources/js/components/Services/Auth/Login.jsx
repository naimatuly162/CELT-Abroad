import Http from "../Http";

const login = formData => {
    return new Promise((resolve, reject) => {
        console.log('fornt');
        Http.post("/api/login", formData)
            .then(res => resolve(res))
            .catch(err => reject(err));
    });
};

export default login;
