"use client";
import { useMemo, useRef } from "react";
import { Canvas, useFrame } from "@react-three/fiber";
import { Sparkles } from "@react-three/drei";
import * as THREE from "three";
import { GOD_THEMES, isGodLevel, type AnyLevel } from "@/lib/config";

type Mode = "fall" | "rise" | "orbit" | "burst";
function Field({ mode, color, count, hot }: { mode: Mode; color: string; count: number; hot: boolean }) {
  const ref = useRef<THREE.Points>(null);
  const { pos, vel } = useMemo(() => {
    const pos = new Float32Array(count * 3), vel = new Float32Array(count * 3);
    for (let i = 0; i < count; i++) {
      const a = Math.random() * Math.PI * 2;
      if (mode === "orbit") { const r = 1.5 + Math.random() * 1.1; pos[i * 3] = Math.cos(a) * r; pos[i * 3 + 1] = Math.sin(a) * r; pos[i * 3 + 2] = -0.5; }
      else if (mode === "burst") { const s = 0.3 + Math.random() * 0.9; vel[i * 3] = Math.cos(a) * s; vel[i * 3 + 1] = Math.sin(a) * s + 0.25; }
      else if (mode === "rise") { pos[i * 3] = (Math.random() - 0.5) * 3.6; pos[i * 3 + 1] = -2.3 + Math.random() * 4.6; pos[i * 3 + 2] = (Math.random() - 0.5) * 1.2; vel[i * 3] = (Math.random() - 0.5) * 0.25; }
      else { pos[i * 3] = (Math.random() - 0.5) * 5; pos[i * 3 + 1] = (Math.random() - 0.5) * 4.4; pos[i * 3 + 2] = (Math.random() - 0.5) * 1.5; }
    }
    return { pos, vel };
  }, [count, mode]);
  useFrame((_, dt) => {
    const pts = ref.current; if (!pts) return;
    const attr = pts.geometry.attributes.position as THREE.BufferAttribute, p = attr.array as Float32Array;
    for (let i = 0; i < count; i++) {
      if (mode === "fall") { p[i * 3 + 1] -= dt * (0.5 + (i % 5) * 0.12); if (p[i * 3 + 1] < -2.3) p[i * 3 + 1] = 2.3; }
      else if (mode === "rise") { const k = hot ? 1.9 : 1; p[i * 3 + 1] += dt * k * (0.45 + (i % 6) * 0.14); p[i * 3] += vel[i * 3] * dt + Math.sin(performance.now() / 700 + i) * dt * 0.12; if (p[i * 3 + 1] > 2.4) { p[i * 3 + 1] = -2.4; p[i * 3] = (Math.random() - 0.5) * 3.6; } }
      else if (mode === "burst") {
        const k = hot ? 2.4 : 1;
        p[i * 3] += vel[i * 3] * dt * k; p[i * 3 + 1] += vel[i * 3 + 1] * dt * k;
        if (Math.hypot(p[i * 3], p[i * 3 + 1]) > (hot ? 3.4 : 2.3)) { p[i * 3] = 0; p[i * 3 + 1] = 0; }
      }
    }
    if (mode === "orbit") pts.rotation.z += dt * (hot ? 1.4 : 0.6);
    attr.needsUpdate = true;
  });
  return (
    <points ref={ref}>
      <bufferGeometry><bufferAttribute attach="attributes-position" array={pos} count={count} itemSize={3} /></bufferGeometry>
      <pointsMaterial color={color} size={0.07} transparent opacity={0.9} sizeAttenuation depthWrite={false} blending={THREE.AdditiveBlending} />
    </points>
  );
}
/** Cincin cahaya yang memuai keluar dan memudar (additive, tanpa tekstur) — kesan "aura dewa". */
function Halo({ color, hot, rings = 3 }: { color: string; hot: boolean; rings?: number }) {
  const g = useRef<THREE.Group>(null);
  useFrame((st) => {
    const t = st.clock.elapsedTime * (hot ? 0.85 : 0.42);
    g.current?.children.forEach((m, i) => { const k = (t + i / rings) % 1; m.scale.setScalar(0.75 + k * 1.7); ((m as THREE.Mesh).material as THREE.MeshBasicMaterial).opacity = (1 - k) * (hot ? 0.7 : 0.45); });
  });
  return (
    <group ref={g}>
      {Array.from({ length: rings }, (_, i) => (
        <mesh key={i}><ringGeometry args={[0.965, 1, 72]} /><meshBasicMaterial color={color} transparent depthWrite={false} blending={THREE.AdditiveBlending} /></mesh>
      ))}
    </group>
  );
}
function Swirl({ hot }: { hot: boolean }) {
  const g = useRef<THREE.Group>(null);
  useFrame((_, dt) => { if (g.current) g.current.rotation.z += dt * (hot ? 0.5 : 0.18); });
  return <group ref={g}><Sparkles count={55} scale={[5, 4, 2]} size={9} speed={0.35} opacity={0.35} color="#a855f7" /></group>;
}
const GL = { alpha: true, antialias: false, powerPreference: "low-power" as const };
export default function BadgeParticles({ level, hot }: { level: AnyLevel; hot: boolean }) {
  // Hemat: dpr ≤1.25, tanpa antialias, GPU daya-rendah. Canvas hanya dipasang saat kursor di atas lencana dan three.js dimuat malas.
  const cv = { camera: { position: [0, 0, 5] as [number, number, number], fov: 50 }, gl: GL, dpr: [1, 1.25] as [number, number], style: { pointerEvents: "none" as const } };
  if (isGodLevel(level)) {
    const c = GOD_THEMES[level].main, a = GOD_THEMES[level].accent;
    return (
      <Canvas {...cv}>
        {level === "demi_god" && <><Field mode="rise" color={c} count={60} hot={hot} /><Halo color={c} hot={hot} rings={2} /></>}
        {level === "god" && <><Field mode="orbit" color={c} count={64} hot={hot} /><Halo color="#fff1b8" hot={hot} rings={3} /></>}
        {level === "true_god" && <><Swirl hot={hot} /><Sparkles count={40} scale={[4.6, 3.8, 1.6]} size={7} speed={0.5} opacity={0.5} color="#e8eefc" /><Halo color={a} hot={hot} rings={2} /></>}
        {level === "primordial_god" && <><Field mode="burst" color={c} count={120} hot={hot} /><Halo color="#a855f7" hot={hot} rings={4} /><Sparkles count={36} scale={[5, 4, 1.6]} size={8} speed={0.6} opacity={0.5} color="#f5c451" /></>}
      </Canvas>
    );
  }
  return (
    <Canvas {...cv}>
      {level === "easy" && <Sparkles count={36} scale={[5, 4, 1]} size={2} speed={0} opacity={0.6} color="#9aa0aa" />}
      {level === "normal" && <Field mode="fall" color="#22e58a" count={70} hot={hot} />}
      {level === "hard" && <Field mode="orbit" color="#3da5ff" count={60} hot={hot} />}
      {level === "extreme" && <Swirl hot={hot} />}
      {level === "hell" && <Field mode="burst" color="#ff6a3d" count={110} hot={hot} />}
    </Canvas>
  );
}
