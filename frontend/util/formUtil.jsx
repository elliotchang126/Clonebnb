export const checkEmail = async email => {
    const res = await csrfFetch(`/api/users?email=${email}`);
    if (res.ok) {
        const user = await res.json()
        return user;
    }
}