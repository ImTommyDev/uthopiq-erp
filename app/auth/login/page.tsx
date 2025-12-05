"use client";

import React from "react";
import Image from "next/image";
import "./login.css";

export default function LoginPage() {
  return (
    <main className="login-min-page">
      <section className="login-min-wrapper">
        <div className="login-min-card">
          <header className="min-header">
            <div className="min-logo">
              <Image
                src="/images/LOGO_CORPORATIVO_OSCURO NO BG (NAVBAR).png"
                alt="UTHOPIQ"
                width={140}
                height={40}
                priority
              />
            </div>
            <h1 className="min-title">Accede a tu cuenta</h1>
          </header>

          <form
            className="min-form"
            onSubmit={(e) => {
              e.preventDefault();
              // TODO: lógica de login
            }}
          >
            <label className="min-input-group">
              <span>Email</span>
              <div className="min-input-shell">
                <input
                  type="email"
                  placeholder="mail@empresa.com"
                  required
                  autoComplete="email"
                />
              </div>
            </label>

            <label className="min-input-group">
              <span>Contraseña</span>
              <div className="min-input-shell">
                <input
                  type="password"
                  placeholder="••••••••"
                  required
                  autoComplete="current-password"
                />
              </div>
            </label>

            <div className="min-meta-row">
              <button
                type="button"
                className="min-link-small"
                onClick={() => {
                }}
              >
                Recuperar contraseña
              </button>
            </div>

            <button type="submit" className="min-btn-primary">
              Entrar
            </button>
          </form>

          <footer className="min-footer">
            <p>© {new Date().getFullYear()} UTHOPIQ · Plataforma interna</p>
          </footer>
        </div>
      </section>
    </main>
  );
}
