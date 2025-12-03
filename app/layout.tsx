// app/layout.tsx
import "./globals.css";
import type { ReactNode } from "react";
import { Inter } from "next/font/google";
import { QueryProvider } from "./query-client-provider";

const inter = Inter({
  subsets: ["latin"],
});

export const metadata = {
  title: "Uthopiq ERP",
  description: "ERP interno para la agencia Uthopiq",
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="es">
      <body
        className={`${inter.className} min-h-screen bg-[var(--bg-body)] text-[var(--text-main)] antialiased`}
      >
        <QueryProvider>{children}</QueryProvider>
      </body>
    </html>
  );
}
