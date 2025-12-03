// app/auth/layout.tsx
import type { ReactNode } from "react";

export default function AuthLayout({ children }: { children: ReactNode }) {
  return (
    <main className="min-h-screen flex items-center justify-center px-4">
      <div className="absolute inset-0 -z-10 bg-[radial-gradient(circle_at_top,_rgba(56,189,248,0.25),_transparent_55%),radial-gradient(circle_at_bottom,_rgba(129,140,248,0.25),_transparent_55%)]" />
      {children}
    </main>
  );
}
