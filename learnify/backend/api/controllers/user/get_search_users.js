import { User } from '../../../models/index.js';

export default async (req, res) => {
    var users = await User.find();
    var result = [];
    users.forEach(user => {
        if(user.username.includes(req.params.username))
        result.push(user.username)
    });

    return res.status(200).json({
        users: result
    });
}