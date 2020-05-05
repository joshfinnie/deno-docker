import { serve } from "https://deno.land/std/http/server.ts";

const hostname = "0.0.0.0";
const port = 8080;

const s = serve({ hostname, port });
const body = new TextEncoder().encode("Hello World!");

console.log(`Listening on ${hostname}:${port}`);
for await (const req of s) {
  req.respond({ body });
}
