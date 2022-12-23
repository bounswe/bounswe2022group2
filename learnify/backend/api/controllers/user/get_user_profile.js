import { User } from '../../../models/index.js';
import get_user_profile from '../../../utils/user/get_user_profile.js';


export default async (req, res) => {
  return await get_user_profile(res, req.params.username)
};