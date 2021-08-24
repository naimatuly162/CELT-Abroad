import Http from "../Http";

export function register(UserData) {
    return new Promise((resolve, reject) => {
        Http.post("api/register", UserData)
            .then(res => resolve(res))
            .catch(err => {
                reject(err);
            });
    });
}

export function resendOTP() {
    return new Promise((resolve, reject) => {
        Http.get("api/resend-otp")
            .then(res => resolve(res))
            .catch(err => {
                reject(err);
            });
    });
}

export function verifyOTP(otp) {
    return new Promise((resolve, reject) => {
        Http.post("api/verify-otp", { otp })
            .then(res => resolve(res))
            .catch(err => {
                reject(err);
            });
    });
}
