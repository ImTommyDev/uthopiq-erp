import "./globals.css";
import type { ReactNode } from "react";
import { QueryProvider } from "./query-client-provider";

export const metadata = {
  title: "Uthopiq ERP",
  description: "ERP interno para la agencia Uthopiq",
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="es">
      <body className="min-h-screen bg-[var(--bg-dark)] text-[var(--text-dark)] antialiased">
        <QueryProvider>{children}</QueryProvider>
      </body>
    </html>
  );
}
