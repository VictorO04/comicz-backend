-- CreateEnum
CREATE TYPE "status_publicacao_enum" AS ENUM ('completo', 'andamento', 'hiato');

-- CreateEnum
CREATE TYPE "tipo_obra_enum" AS ENUM ('comic book', 'mangá', 'manhwa', 'manhua', 'graphic novel', 'tirinha', 'gibi', 'novel', 'one shot');

-- CreateTable
CREATE TABLE "escritores" (
    "id_escritor" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "pais_origem" VARCHAR(60) NOT NULL,
    "bio" TEXT NOT NULL,
    "data_nascimento" DATE NOT NULL,
    "atualizado_em" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "escritores_pkey" PRIMARY KEY ("id_escritor")
);

-- CreateTable
CREATE TABLE "generos" (
    "id_genero" SERIAL NOT NULL,
    "nome" VARCHAR(30) NOT NULL,
    "descricao" TEXT,
    "atualizado_em" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "generos_pkey" PRIMARY KEY ("id_genero")
);

-- CreateTable
CREATE TABLE "ilustradores" (
    "id_ilustrador" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "pais_origem" VARCHAR(60) NOT NULL,
    "bio" TEXT NOT NULL,
    "data_nascimento" DATE NOT NULL,
    "atualizado_em" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ilustradores_pkey" PRIMARY KEY ("id_ilustrador")
);

-- CreateTable
CREATE TABLE "obra_escritor" (
    "id_obra_escritor" SERIAL NOT NULL,
    "id_escritor" INTEGER NOT NULL,
    "id_obra" INTEGER NOT NULL,

    CONSTRAINT "obra_escritor_pkey" PRIMARY KEY ("id_obra_escritor")
);

-- CreateTable
CREATE TABLE "obra_genero" (
    "id_obra_genero" SERIAL NOT NULL,
    "id_obra" INTEGER NOT NULL,
    "id_genero" INTEGER NOT NULL,

    CONSTRAINT "obra_genero_pkey" PRIMARY KEY ("id_obra_genero")
);

-- CreateTable
CREATE TABLE "obra_ilustrador" (
    "id_obra_ilustrador" SERIAL NOT NULL,
    "id_ilustrador" INTEGER NOT NULL,
    "id_obra" INTEGER NOT NULL,

    CONSTRAINT "obra_ilustrador_pkey" PRIMARY KEY ("id_obra_ilustrador")
);

-- CreateTable
CREATE TABLE "obras" (
    "id_obra" SERIAL NOT NULL,
    "capa_url" VARCHAR(255) NOT NULL,
    "titulo" VARCHAR(100) NOT NULL,
    "sinopse" TEXT NOT NULL,
    "tipo_obra" "tipo_obra_enum" NOT NULL,
    "ano_lancamento" SMALLINT NOT NULL,
    "status_publicacao" "status_publicacao_enum" NOT NULL,
    "total_capitulos" INTEGER,
    "total_volumes" INTEGER,
    "data_cadastro" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "obras_pkey" PRIMARY KEY ("id_obra")
);

-- CreateIndex
CREATE UNIQUE INDEX "generos_nome_key" ON "generos"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "unq_obra_escritor" ON "obra_escritor"("id_obra", "id_escritor");

-- CreateIndex
CREATE UNIQUE INDEX "unq_obra_genero" ON "obra_genero"("id_obra", "id_genero");

-- CreateIndex
CREATE UNIQUE INDEX "unq_obra_ilustrador" ON "obra_ilustrador"("id_obra", "id_ilustrador");

-- CreateIndex
CREATE UNIQUE INDEX "obras_titulo_key" ON "obras"("titulo");

-- AddForeignKey
ALTER TABLE "obra_escritor" ADD CONSTRAINT "fk_obra_escritor_escritor" FOREIGN KEY ("id_escritor") REFERENCES "escritores"("id_escritor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "obra_escritor" ADD CONSTRAINT "fk_obra_escritor_obra" FOREIGN KEY ("id_obra") REFERENCES "obras"("id_obra") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "obra_genero" ADD CONSTRAINT "fk_obra_genero_genero" FOREIGN KEY ("id_genero") REFERENCES "generos"("id_genero") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "obra_genero" ADD CONSTRAINT "fk_obra_genero_obra" FOREIGN KEY ("id_obra") REFERENCES "obras"("id_obra") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "obra_ilustrador" ADD CONSTRAINT "fk_obra_ilustrador_ilustrador" FOREIGN KEY ("id_ilustrador") REFERENCES "ilustradores"("id_ilustrador") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "obra_ilustrador" ADD CONSTRAINT "fk_obra_ilustrador_obra" FOREIGN KEY ("id_obra") REFERENCES "obras"("id_obra") ON DELETE CASCADE ON UPDATE NO ACTION;
