"use client";

import { FormEvent, useState } from "react";
import { useRouter } from "next/navigation";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

export default function LoginPage() {
  const router = useRouter();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = (e: FormEvent) => {
    e.preventDefault();
    console.log("Login demo:", { email, password });
    router.push("/dashboard");
  };

  return (
    <section className="w-full max-w-4xl grid gap-10 md:grid-cols-[1.1fr,0.9fr] items-center">
      <div className="space-y-4">
        <p className="inline-flex items-center gap-2 rounded-full border border-[var(--border-subtle)] bg-black/40 px-3 py-1 text-xs text-[var(--text-muted)]">
          <span className="h-1.5 w-1.5 rounded-full bg-[var(--primary)]" />
          ERP interno para la agencia Uthopiq
        </p>
        <h1 className="text-3xl md:text-4xl font-semibold leading-tight">
          Accede a tu{" "}
          <span className="text-[var(--primary)]">panel de control</span>
          <br />
          de proyectos y facturación.
        </h1>
        <p className="text-sm md:text-base text-[var(--text-muted)] max-w-lg">
          Gestiona clientes, proyectos, facturas y automatizaciones desde un
          único lugar. Esta versión es sólo para uso interno de Uthopiq.
        </p>

        <ul className="mt-4 grid gap-2 text-xs text-[var(--text-muted)]">
          <li className="flex items-center gap-2">
            <span className="h-1.5 w-1.5 rounded-full bg-[var(--primary-soft)]" />
            Control de proyectos y tareas en tiempo real.
          </li>
          <li className="flex items-center gap-2">
            <span className="h-1.5 w-1.5 rounded-full bg-[var(--primary-soft)]" />
            Facturación, bonos y mensualidades en un mismo sistema.
          </li>
          <li className="flex items-center gap-2">
            <span className="h-1.5 w-1.5 rounded-full bg-[var(--primary-soft)]" />
            Preparado para roles, permisos y auth con Clerk.
          </li>
        </ul>
      </div>

      <Card className="relative bg-[var(--bg-card)]/95 border-[var(--border-subtle)] shadow-xl rounded-[var(--radius-lg)] p-6 md:p-7 space-y-5">
        <div className="pointer-events-none absolute inset-x-6 -top-10 h-24 rounded-full bg-[var(--primary-soft)] blur-3xl -z-10" />

        <header className="space-y-1">
          <div className="text-xs font-medium text-[var(--primary)]">
            Uthopiq ERP
          </div>
          <h2 className="text-lg font-semibold">Inicia sesión</h2>
          <p className="text-xs text-[var(--text-muted)]">
            De momento esto es un login de prueba. Más adelante se conectará a
            Clerk y a los usuarios de la base de datos.
          </p>
        </header>

        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="space-y-1.5 text-sm">
            <label className="text-xs text-[var(--text-muted)]">Email</label>
            <Input
              type="email"
              placeholder="you@uthopiq.com"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="bg-black/40 border-[var(--border-subtle)] text-sm placeholder:text-[var(--text-muted)]/70"
            />
          </div>

          <div className="space-y-1.5 text-sm">
            <label className="text-xs text-[var(--text-muted)]">
              Contraseña
            </label>
            <Input
              type="password"
              placeholder="••••••••"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="bg-black/40 border-[var(--border-subtle)] text-sm placeholder:text-[var(--text-muted)]/70"
            />
          </div>

          <Button type="submit" className="w-full mt-2">
            Entrar
          </Button>
        </form>

        <footer className="pt-2 border-t border-white/5 text-[10px] text-[var(--text-muted)] flex items-center justify-between gap-2">
          <span>© {new Date().getFullYear()} Uthopiq. Uso interno.</span>
          <span className="text-[var(--primary)]/90">v0.1 · Auth fake</span>
        </footer>
      </Card>
    </section>
  );
}
