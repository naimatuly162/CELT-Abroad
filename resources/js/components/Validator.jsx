import ReeValidate from "ree-validate";
import { unique, exists } from "./Services/Validation";
import { trans } from "./Localization";

ReeValidate.extend("unique", {
    getMessage: field => "The " + field + " is already exists.",
    validate: (value, args) => {
        return unique({
            field: value,
            opts: args
        })
            .then(res => {
                console.log(res);
                return true;
            })
            .catch(err => {
                console.log(err);
                return false;
            });
    }
});

ReeValidate.extend("exists", {
    getMessage: field => "The " + field + " is invalid.",
    validate: (value, args) => {
        return exists({
            field: value,
            opts: args
        })
            .then(res => {
                return true;
            })
            .catch(err => {
                return false;
            });
    }
});

let messageObj = trans("validation");
let messages = {};

Object.keys(messageObj).forEach((key, index) => {
    if (typeof messageObj[key] != "string") {
        messageObj[key] = messageObj[key].numeric;
    }

    let message = messageObj[key];
    messages[key] = (field, ref = []) => {
        let _message = messageObj[key];
        message = _message.replace(":attribute", field);

        let i = 0;
        while (message.split(":").length - 1 > 0) {
            message = message.replace(new RegExp("\\:[a-z]+"), ref[i]);
            i++;
        }

        return message;
    };
});

ReeValidate.localize({ en: { messages: messages } });

export default ReeValidate;
