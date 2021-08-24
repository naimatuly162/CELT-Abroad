import Http from "../Http";

export function sendResetPasswordLinkEmail(formData) {
    return new Promise((resolve, reject) => {
        Http.post("api/reset-password", formData)
            .then(res => resolve(res))
            .catch(err => reject(err));
    });
}
