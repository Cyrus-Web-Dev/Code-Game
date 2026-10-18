import { create } from "zustand";
import { api } from "./supabase";

export type SessionUser = { id: string; username: string } | null;

export const useUser = create<{
  user: SessionUser;
  status: "loading" | "in" | "out";
  refresh: () => Promise<void>;
  clear: () => void;
}>((set, get) => ({
  user: null,
  status: "loading",
  refresh: async () => {
    const d: any = await api("/api/session");
    const next: SessionUser = d.user ?? null;
    // Ganti akun pada tab yang sama: jangan biarkan cache akun sebelumnya terbawa
    if (get().user?.id !== next?.id) useMe.getState().reset();
    set(next ? { user: next, status: "in" } : { user: null, status: "out" });
  },
  clear: () => { useMe.getState().reset(); set({ user: null, status: "out" }); },
}));

/** Cache /api/me di client agar navigasi antar halaman tidak memukul Vercel tiap kali. */
const ME_TTL_MS = 60_000; // 60 detik — UI tetap fresh, invocations turun tajam

type MeState = {
  data: any | null;
  loading: boolean;
  fetchedAt: number;
  fetchMe: (opts?: { force?: boolean }) => Promise<any>;
  invalidate: () => void;
  reset: () => void;
};

let inflight: Promise<any> | null = null; // permintaan serupa yang sedang berjalan dipakai bersama

export const useMe = create<MeState>((set, get) => ({
  data: null,
  loading: false,
  fetchedAt: 0,
  invalidate: () => set({ fetchedAt: 0 }),
  reset: () => { inflight = null; set({ data: null, loading: false, fetchedAt: 0 }); },
  fetchMe: async (opts) => {
    const force = opts?.force === true;
    const { data, fetchedAt } = get();
    if (!force && data && Date.now() - fetchedAt < ME_TTL_MS) return data;
    if (inflight) return inflight;
    set({ loading: true });
    const p = api("/api/me").then((d: any) => {
      inflight = null;
      if (d?.error) { set({ loading: false }); return d; }
      set({ data: d, loading: false, fetchedAt: Date.now() });
      return d;
    });
    inflight = p;
    return p;
  },
}));

/** Jumlah permintaan teman yang menunggu (dari heartbeat); dipakai titik merah di navigasi. */
export const usePresence = create<{ pending: number; setPending: (n: number) => void }>((set) => ({ pending: 0, setPending: (pending) => set({ pending }) }));
