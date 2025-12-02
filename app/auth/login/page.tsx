"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import { login } from "@/lib/auth";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

export default function LoginPage() {
  const router = useRouter();
  const [email, setEmail] = useState("");

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Aquí podrías validar email, etc.
    login();
    router.push("/dashboard");
  };

  return (
    <main className="min-h-screen flex items-center justify-center px-4">
      <Card className="w-full max-w-sm bg-[var(--bg-elevated)]/90 border-white/10 p-6 space-y-4">
        <h1 className="text-xl font-semibold text-center">Uthopiq ERP</h1>
        <p className="text-xs text-slate-400 text-center">
          Login simple para entorno de desarrollo. Más adelante se sustituye por Clerk/Auth0.
        </p>
        <form onSubmit={handleSubmit} className="space-y-3">
          <div className="space-y-1">
            <label className="text-xs text-slate-300">Email</label>
            <Input
              type="email"
              placeholder="you@uthopiq.com"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="bg-black/40 border-white/15 text-sm"
            />
          </div>
          <Button type="submit" className="w-full">
            Login
          </Button>
        </form>
      </Card>
    </main>
  );
}
