export function isLoggedIn() {
  if (typeof window === "undefined") return false;
  return localStorage.getItem("uthopiq_auth") === "1";
}

export function login() {
  if (typeof window === "undefined") return;
  localStorage.setItem("uthopiq_auth", "1");
}

export function logout() {
  if (typeof window === "undefined") return;
  localStorage.removeItem("uthopiq_auth");
}
