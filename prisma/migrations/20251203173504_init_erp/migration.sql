-- CreateTable
CREATE TABLE "roles" (
    "id" UUID NOT NULL,
    "nombre" VARCHAR(50) NOT NULL,
    "descripcion" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permisos" (
    "id" UUID NOT NULL,
    "clave" VARCHAR(100) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,

    CONSTRAINT "permisos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "rol_permisos" (
    "id_rol" UUID NOT NULL,
    "id_permiso" UUID NOT NULL,
    "puede_ver" BOOLEAN NOT NULL DEFAULT true,
    "puede_crear" BOOLEAN NOT NULL DEFAULT false,
    "puede_editar" BOOLEAN NOT NULL DEFAULT false,
    "puede_eliminar" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "rol_permisos_pkey" PRIMARY KEY ("id_rol","id_permiso")
);

-- CreateTable
CREATE TABLE "usuarios" (
    "id" UUID NOT NULL,
    "id_clerk" VARCHAR(255),
    "email" VARCHAR(255) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "apellidos" VARCHAR(150),
    "telefono" VARCHAR(50),
    "avatar_url" TEXT,
    "activo" BOOLEAN NOT NULL DEFAULT true,
    "id_rol" UUID NOT NULL,
    "notas" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creado_por" UUID,
    "actualizado_por" UUID,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipos_cliente" (
    "id" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,

    CONSTRAINT "tipos_cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "clientes" (
    "id" UUID NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "id_tipo_cliente" UUID,
    "cif" VARCHAR(50),
    "email" VARCHAR(255),
    "telefono" VARCHAR(50) NOT NULL,
    "sitio_web" VARCHAR(255),
    "direccion" TEXT,
    "ciudad" VARCHAR(100),
    "provincia" VARCHAR(100),
    "pais" VARCHAR(100),
    "codigo_postal" VARCHAR(20),
    "logo_url" TEXT,
    "notas" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creado_por" UUID,
    "actualizado_por" UUID,

    CONSTRAINT "clientes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contactos_cliente" (
    "id" UUID NOT NULL,
    "id_cliente" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "apellidos" VARCHAR(150),
    "email" VARCHAR(255),
    "telefono" VARCHAR(50),
    "puesto" VARCHAR(100),
    "notas" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creado_por" UUID,
    "actualizado_por" UUID,

    CONSTRAINT "contactos_cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipos_proyecto" (
    "id" UUID NOT NULL,
    "codigo" VARCHAR(50) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,

    CONSTRAINT "tipos_proyecto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "estados_proyecto" (
    "id" UUID NOT NULL,
    "codigo" VARCHAR(50) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,

    CONSTRAINT "estados_proyecto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "proyectos" (
    "id" UUID NOT NULL,
    "id_cliente" UUID NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "descripcion" TEXT,
    "id_tipo_proyecto" UUID NOT NULL,
    "id_estado_proyecto" UUID NOT NULL,
    "fecha_inicio" DATE,
    "fecha_fin" DATE,
    "presupuesto_estimado" DECIMAL(12,2),
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_creado_por" UUID NOT NULL,
    "actualizado_por" UUID,

    CONSTRAINT "proyectos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "proyecto_usuarios" (
    "id_proyecto" UUID NOT NULL,
    "id_usuario" UUID NOT NULL,
    "rol_en_proyecto" VARCHAR(100),
    "es_responsable" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "proyecto_usuarios_pkey" PRIMARY KEY ("id_proyecto","id_usuario")
);

-- CreateTable
CREATE TABLE "tareas" (
    "id" UUID NOT NULL,
    "id_proyecto" UUID NOT NULL,
    "titulo" VARCHAR(255) NOT NULL,
    "descripcion" TEXT,
    "estado" VARCHAR(50) NOT NULL DEFAULT 'pendiente',
    "prioridad" VARCHAR(50) NOT NULL DEFAULT 'media',
    "id_asignado_a" UUID,
    "id_creado_por" UUID NOT NULL,
    "fecha_vencimiento" DATE,
    "completado_en" TIMESTAMP(3),
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tareas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "proveedores" (
    "id" UUID NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "cif" VARCHAR(50),
    "email" VARCHAR(255),
    "telefono" VARCHAR(50),
    "sitio_web" VARCHAR(255),
    "notas" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "proveedores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gastos" (
    "id" UUID NOT NULL,
    "id_proyecto" UUID,
    "id_proveedor" UUID,
    "categoria" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,
    "importe" DECIMAL(12,2) NOT NULL,
    "fecha_gasto" DATE NOT NULL,
    "recibo_url" TEXT,
    "facturable" BOOLEAN NOT NULL DEFAULT false,
    "id_creado_por" UUID NOT NULL,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "gastos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "definicion_bonos" (
    "id" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,
    "horas_totales" DECIMAL(5,2) NOT NULL,
    "precio_total" DECIMAL(12,2) NOT NULL,
    "activo" BOOLEAN NOT NULL DEFAULT true,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "definicion_bonos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bonos_cliente" (
    "id" UUID NOT NULL,
    "id_cliente" UUID NOT NULL,
    "id_definicion_bono" UUID NOT NULL,
    "id_proyecto" UUID,
    "horas_contratadas" DECIMAL(5,2) NOT NULL,
    "horas_consumidas" DECIMAL(5,2) NOT NULL,
    "fecha_compra" DATE NOT NULL,
    "fecha_vencimiento" DATE,
    "estado" VARCHAR(20) NOT NULL DEFAULT 'activo',
    "notas" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creado_por" UUID,
    "actualizado_por" UUID,

    CONSTRAINT "bonos_cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consumo_bonos" (
    "id" UUID NOT NULL,
    "id_bono_cliente" UUID NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "horas_consumidas" DECIMAL(5,2) NOT NULL,
    "descripcion" TEXT,
    "id_usuario" UUID,
    "id_proyecto" UUID,
    "id_tarea" UUID,

    CONSTRAINT "consumo_bonos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mensualidades_cliente" (
    "id" UUID NOT NULL,
    "id_cliente" UUID NOT NULL,
    "id_proyecto" UUID,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,
    "importe_mensual" DECIMAL(12,2) NOT NULL,
    "dia_cobro" INTEGER NOT NULL,
    "fecha_inicio" DATE NOT NULL,
    "fecha_fin" DATE,
    "activo" BOOLEAN NOT NULL DEFAULT true,
    "notas" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creado_por" UUID,
    "actualizado_por" UUID,

    CONSTRAINT "mensualidades_cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "estados_presupuesto" (
    "id" UUID NOT NULL,
    "codigo" VARCHAR(50) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,

    CONSTRAINT "estados_presupuesto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "estados_factura" (
    "id" UUID NOT NULL,
    "codigo" VARCHAR(50) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,

    CONSTRAINT "estados_factura_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "formas_pago" (
    "id" UUID NOT NULL,
    "codigo" VARCHAR(50) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,
    "numero_cuotas" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "formas_pago_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "presupuestos" (
    "id" UUID NOT NULL,
    "numero" VARCHAR(50) NOT NULL,
    "id_cliente" UUID NOT NULL,
    "id_proyecto" UUID,
    "fecha_emision" DATE NOT NULL,
    "validez_hasta" DATE,
    "id_estado_presupuesto" UUID NOT NULL,
    "id_forma_pago" UUID,
    "total_base" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "total_impuestos" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "total" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "notas_cliente" TEXT,
    "notas_internas" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creado_por" UUID,
    "actualizado_por" UUID,

    CONSTRAINT "presupuestos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "presupuesto_lineas" (
    "id" UUID NOT NULL,
    "id_presupuesto" UUID NOT NULL,
    "tipo_concepto" VARCHAR(50) NOT NULL,
    "descripcion" TEXT NOT NULL,
    "cantidad" DECIMAL(10,2) NOT NULL DEFAULT 1,
    "precio_unitario" DECIMAL(12,2) NOT NULL,
    "porcentaje_descuento" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "importe_total" DECIMAL(12,2) NOT NULL,
    "id_proyecto" UUID,
    "id_bono_cliente" UUID,
    "id_mensualidad_cliente" UUID,

    CONSTRAINT "presupuesto_lineas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "facturas" (
    "id" UUID NOT NULL,
    "numero" VARCHAR(50) NOT NULL,
    "id_cliente" UUID NOT NULL,
    "id_proyecto" UUID,
    "fecha_emision" DATE NOT NULL,
    "fecha_vencimiento" DATE,
    "id_estado_factura" UUID NOT NULL,
    "id_forma_pago" UUID,
    "id_presupuesto" UUID,
    "total_base" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "total_impuestos" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "total" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "notas_cliente" TEXT,
    "notas_internas" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "actualizado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creado_por" UUID,
    "actualizado_por" UUID,

    CONSTRAINT "facturas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "factura_lineas" (
    "id" UUID NOT NULL,
    "id_factura" UUID NOT NULL,
    "tipo_concepto" VARCHAR(50) NOT NULL,
    "descripcion" TEXT NOT NULL,
    "cantidad" DECIMAL(10,2) NOT NULL DEFAULT 1,
    "precio_unitario" DECIMAL(12,2) NOT NULL,
    "porcentaje_descuento" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "importe_total" DECIMAL(12,2) NOT NULL,
    "id_proyecto" UUID,
    "id_bono_cliente" UUID,
    "id_mensualidad_cliente" UUID,

    CONSTRAINT "factura_lineas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pagos" (
    "id" UUID NOT NULL,
    "id_factura" UUID NOT NULL,
    "fecha_pago" DATE NOT NULL,
    "importe" DECIMAL(12,2) NOT NULL,
    "metodo" VARCHAR(50),
    "referencia_externa" VARCHAR(100),
    "notas" TEXT,
    "creado_en" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "creado_por" UUID,

    CONSTRAINT "pagos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "roles_nombre_key" ON "roles"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "permisos_clave_key" ON "permisos"("clave");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_id_clerk_key" ON "usuarios"("id_clerk");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "tipos_cliente_nombre_key" ON "tipos_cliente"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "tipos_proyecto_codigo_key" ON "tipos_proyecto"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "estados_proyecto_codigo_key" ON "estados_proyecto"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "estados_presupuesto_codigo_key" ON "estados_presupuesto"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "estados_factura_codigo_key" ON "estados_factura"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "formas_pago_codigo_key" ON "formas_pago"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "presupuestos_numero_key" ON "presupuestos"("numero");

-- CreateIndex
CREATE UNIQUE INDEX "facturas_numero_key" ON "facturas"("numero");

-- AddForeignKey
ALTER TABLE "rol_permisos" ADD CONSTRAINT "rol_permisos_id_rol_fkey" FOREIGN KEY ("id_rol") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rol_permisos" ADD CONSTRAINT "rol_permisos_id_permiso_fkey" FOREIGN KEY ("id_permiso") REFERENCES "permisos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "usuarios_id_rol_fkey" FOREIGN KEY ("id_rol") REFERENCES "roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "clientes" ADD CONSTRAINT "clientes_id_tipo_cliente_fkey" FOREIGN KEY ("id_tipo_cliente") REFERENCES "tipos_cliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contactos_cliente" ADD CONSTRAINT "contactos_cliente_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "clientes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "proyectos" ADD CONSTRAINT "proyectos_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "clientes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "proyectos" ADD CONSTRAINT "proyectos_id_tipo_proyecto_fkey" FOREIGN KEY ("id_tipo_proyecto") REFERENCES "tipos_proyecto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "proyectos" ADD CONSTRAINT "proyectos_id_estado_proyecto_fkey" FOREIGN KEY ("id_estado_proyecto") REFERENCES "estados_proyecto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "proyecto_usuarios" ADD CONSTRAINT "proyecto_usuarios_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "proyecto_usuarios" ADD CONSTRAINT "proyecto_usuarios_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tareas" ADD CONSTRAINT "tareas_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tareas" ADD CONSTRAINT "tareas_id_asignado_a_fkey" FOREIGN KEY ("id_asignado_a") REFERENCES "usuarios"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gastos" ADD CONSTRAINT "gastos_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gastos" ADD CONSTRAINT "gastos_id_proveedor_fkey" FOREIGN KEY ("id_proveedor") REFERENCES "proveedores"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bonos_cliente" ADD CONSTRAINT "bonos_cliente_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "clientes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bonos_cliente" ADD CONSTRAINT "bonos_cliente_id_definicion_bono_fkey" FOREIGN KEY ("id_definicion_bono") REFERENCES "definicion_bonos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bonos_cliente" ADD CONSTRAINT "bonos_cliente_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consumo_bonos" ADD CONSTRAINT "consumo_bonos_id_bono_cliente_fkey" FOREIGN KEY ("id_bono_cliente") REFERENCES "bonos_cliente"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consumo_bonos" ADD CONSTRAINT "consumo_bonos_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "usuarios"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consumo_bonos" ADD CONSTRAINT "consumo_bonos_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consumo_bonos" ADD CONSTRAINT "consumo_bonos_id_tarea_fkey" FOREIGN KEY ("id_tarea") REFERENCES "tareas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mensualidades_cliente" ADD CONSTRAINT "mensualidades_cliente_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "clientes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mensualidades_cliente" ADD CONSTRAINT "mensualidades_cliente_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presupuestos" ADD CONSTRAINT "presupuestos_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "clientes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presupuestos" ADD CONSTRAINT "presupuestos_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presupuestos" ADD CONSTRAINT "presupuestos_id_estado_presupuesto_fkey" FOREIGN KEY ("id_estado_presupuesto") REFERENCES "estados_presupuesto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presupuestos" ADD CONSTRAINT "presupuestos_id_forma_pago_fkey" FOREIGN KEY ("id_forma_pago") REFERENCES "formas_pago"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presupuesto_lineas" ADD CONSTRAINT "presupuesto_lineas_id_presupuesto_fkey" FOREIGN KEY ("id_presupuesto") REFERENCES "presupuestos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presupuesto_lineas" ADD CONSTRAINT "presupuesto_lineas_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presupuesto_lineas" ADD CONSTRAINT "presupuesto_lineas_id_bono_cliente_fkey" FOREIGN KEY ("id_bono_cliente") REFERENCES "bonos_cliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presupuesto_lineas" ADD CONSTRAINT "presupuesto_lineas_id_mensualidad_cliente_fkey" FOREIGN KEY ("id_mensualidad_cliente") REFERENCES "mensualidades_cliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "facturas" ADD CONSTRAINT "facturas_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "clientes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "facturas" ADD CONSTRAINT "facturas_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "facturas" ADD CONSTRAINT "facturas_id_estado_factura_fkey" FOREIGN KEY ("id_estado_factura") REFERENCES "estados_factura"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "facturas" ADD CONSTRAINT "facturas_id_forma_pago_fkey" FOREIGN KEY ("id_forma_pago") REFERENCES "formas_pago"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "facturas" ADD CONSTRAINT "facturas_id_presupuesto_fkey" FOREIGN KEY ("id_presupuesto") REFERENCES "presupuestos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "factura_lineas" ADD CONSTRAINT "factura_lineas_id_factura_fkey" FOREIGN KEY ("id_factura") REFERENCES "facturas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "factura_lineas" ADD CONSTRAINT "factura_lineas_id_proyecto_fkey" FOREIGN KEY ("id_proyecto") REFERENCES "proyectos"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "factura_lineas" ADD CONSTRAINT "factura_lineas_id_bono_cliente_fkey" FOREIGN KEY ("id_bono_cliente") REFERENCES "bonos_cliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "factura_lineas" ADD CONSTRAINT "factura_lineas_id_mensualidad_cliente_fkey" FOREIGN KEY ("id_mensualidad_cliente") REFERENCES "mensualidades_cliente"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pagos" ADD CONSTRAINT "pagos_id_factura_fkey" FOREIGN KEY ("id_factura") REFERENCES "facturas"("id") ON DELETE CASCADE ON UPDATE CASCADE;
