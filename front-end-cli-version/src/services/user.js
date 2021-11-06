import axios from "axios";

// Etablir la communication entre backend et frontend grace à l'URL et via la bibliothèque AXIOS
export const login = (user) =>
    axios.post("http://localhost:3000/api/auth/login", user);

export const signup = (user) =>
    axios.post("http://localhost:3000/api/auth/signup", user);
/*export const getAdmin = () =>
    axios.get("http://localhost:3000/api/auth/admin", user);
export const findUser = () =>
    axios.get("http://localhost:3000/api/auth/user", user);
export const deleteUser = (password) =>
    axios.delete("http://localhost:3000/api/auth/user", user);*/