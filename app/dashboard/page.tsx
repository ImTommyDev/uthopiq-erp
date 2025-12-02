"use client";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { zodResolver } from "@hookform/resolvers/zod";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { isLoggedIn } from "@/lib/auth";
import { useEffect } from "react";
import { useRouter } from "next/navigation";

const projectSchema = z.object({
  name: z.string().min(2, "Name too short"),
});

type ProjectForm = z.infer<typeof projectSchema>;

type Project = {
  id: string;
  name: string;
  status: string;
};

export default function DashboardPage() {
  const router = useRouter();

  useEffect(() => {
    if (!isLoggedIn()) {
      router.replace("/auth/login");
    }
  }, [router]);
  const queryClient = useQueryClient();

  // GET projects
  const { data: projects, isLoading } = useQuery<Project[]>({
    queryKey: ["projects"],
    queryFn: async () => {
      const res = await fetch("/api/projects");
      if (!res.ok) throw new Error("Error fetching projects");
      return res.json();
    },
  });

  // Form
  const {
    register,
    handleSubmit,
    formState: { errors },
    reset,
  } = useForm<ProjectForm>({
    resolver: zodResolver(projectSchema),
  });

  // POST project
  const { mutate, isPending } = useMutation({
    mutationFn: async (values: ProjectForm) => {
      const res = await fetch("/api/projects", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(values),
      });
      if (!res.ok) throw new Error("Error creating project");
      return res.json();
    },
    onSuccess: () => {
      reset();
      queryClient.invalidateQueries({ queryKey: ["projects"] });
    },
  });

  const onSubmit = (values: ProjectForm) => mutate(values);

  return (
    <main className="min-h-screen max-w-4xl mx-auto px-4 py-10 space-y-8">
      <h1 className="text-3xl font-semibold">Dashboard</h1>
      <p className="text-sm text-slate-300">
        Pequeña prueba: listado de proyectos + formulario para crear uno nuevo.
      </p>

      <Card className="bg-[var(--bg-elevated)]/80 border-white/10 p-4 space-y-3">
        <h2 className="text-lg font-semibold">New project</h2>
        <form
          onSubmit={handleSubmit(onSubmit)}
          className="flex flex-col gap-3 sm:flex-row"
        >
          <div className="flex-1">
            <Input
              placeholder="Project name"
              {...register("name")}
              className="bg-black/40 border-white/15"
            />
            {errors.name && (
              <p className="text-xs text-red-400 mt-1">{errors.name.message}</p>
            )}
          </div>
          <Button
            type="submit"
            disabled={isPending}
            className="sm:w-auto w-full"
          >
            {isPending ? "Saving..." : "Add"}
          </Button>
        </form>
      </Card>

      <section className="space-y-2">
        <h2 className="text-lg font-semibold">Projects</h2>
        {isLoading && <p className="text-sm text-slate-400">Loading...</p>}
        {!isLoading && projects?.length === 0 && (
          <p className="text-sm text-slate-400">No projects yet.</p>
        )}
        <ul className="space-y-2">
          {projects?.map((p) => (
            <li
              key={p.id}
              className="rounded-xl border border-white/10 bg-black/40 px-3 py-2 text-sm flex justify-between"
            >
              <span>{p.name}</span>
              <span className="text-xs text-slate-400">{p.status}</span>
            </li>
          ))}
        </ul>
      </section>
    </main>
  );
}
