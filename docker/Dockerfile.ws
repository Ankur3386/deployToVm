FROM node:22-alpine
WORKDIR /usr/src/app
RUN corepack enable
COPY ./package.json ./package.json
COPY ./pnpm-workspace.yaml ./pnpm-workspace.yaml
COPY ./turbo.json ./turbo.json
COPY ./pnpm-lock.yaml ./pnpm-lock.yaml
COPY ./apps/ws/package.json  ./apps/ws/package.json 
COPY packages/*/package.json ./packages/*/
COPY ./packages ./packages
RUN pnpm install  
COPY ./apps/ws   ./apps/ws
# "dev:generate":"cd packages/db && npx prisma generate && cd ../.."--> added in base package.json
RUN pnpm run dev:generate
RUN cd apps/ws && npx tsc -b && cd ../..
EXPOSE 8081
# "start:ws":"cd apps/ws && node dist/index.js",
CMD ["pnpm","run","start:ws"]
