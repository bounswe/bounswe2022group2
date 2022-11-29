
import jwt from "jsonwebtoken"

export default (user) => {

    const token = jwt.sign(
        { user_id: user._id, email:user.email, username:user.username },
        process.env.JWT_KEY,
        {
            expiresIn: "24h",
        }
        );

    return token;
}