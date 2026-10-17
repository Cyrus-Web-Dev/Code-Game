"use client";
import { useMemo, useRef } from "react";
import { Canvas, useFrame } from "@react-three/fiber";
import { Sparkles } from "@react-three/drei";
import * as THREE from "three";
import { GOD_THEMES, isGodLevel, type AnyLevel } from "@/lib/config";

type Mode = "fall" | "orbit" | "burst";
function Field({ mode, color, count, hot }: { mode: Mode; color: string; count: number; hot: boolean }) {
  const ref = useRef<THREE.Points>(null);
  const { pos, vel } = useMemo(() => {
    const pos = new Float32Array(count * 3), vel = new Float32Array(count * 3);
    for (let i = 0; i < count; i++) {
      const a = Math.random() * Math.PI * 2;
      if (mode === "orbit") { const r = 1.5 + Math.random() * 1.1; pos[i * 3] = Math.cos(a) * r; pos[i * 3 + 1] = Math.sin(a) * r; pos[i * 3 + 2] = -0.5; }
      else if (mode === "burst") { const s = 0.3 + Math.random() * 0.9; vel[i * 3] = Math.cos(a) * s; vel[i * 3 + 1] = Math.sin(a) * s + 0.25; }
      else { pos[i * 3] = (Math.random() - 0.5) * 5; pos[i * 3 + 1] = (Math.random() - 0.5) * 4.4; pos[i * 3 + 2] = (Math.random() - 0.5) * 1.5; }
    }
    return { pos, vel };
  }, [count, mode]);
  useFrame((_, dt) => {
    const pts = ref.current; if (!pts) return;
    const attr = pts.geometry.attributes.position as THREE.BufferAttribute, p = attr.array as Float32Array;
    for (let i = 0; i < count; i++) {
      if (mode === "fall") { p[i * 3 + 1] -= dt * (0.5 + (i % 5) * 0.12); if (p[i * 3 + 1] < -2.3) p[i * 3 + 1] = 2.3; }
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
function Swirl({ hot }: { hot: boolean }) {
  const g = useRef<THREE.Group>(null);
  useFrame((_, dt) => { if (g.current) g.current.rotation.z += dt * (hot ? 0.5 : 0.18); });
  return <group ref={g}><Sparkles count={55} scale={[5, 4, 2]} size={9} speed={0.35} opacity={0.35} color="#a855f7" /></group>;
}
export default function BadgeParticles({ level, hot }: { level: AnyLevel; hot: boolean }) {
  // God Mode meminjam pola partikel yang sama, warnanya dari tema masing-masing tingkat (emas/platina/ungu kosmik).
  if (isGodLevel(level)) {
    const c = GOD_THEMES[level].main;
    return (
      <Canvas camera={{ position: [0, 0, 5], fov: 50 }} gl={{ alpha: true }} dpr={[1, 1.5]} style={{ pointerEvents: "none" }}>
        {level === "demi_god" && <Field mode="fall" color={c} count={70} hot={hot} />}
        {level === "god" && <Field mode="orbit" color={c} count={70} hot={hot} />}
        {level === "true_god" && <Swirl hot={hot} />}
        {level === "primordial_god" && <Field mode="burst" color={c} count={130} hot={hot} />}
      </Canvas>
    );
  }
  return (
    <Canvas camera={{ position: [0, 0, 5], fov: 50 }} gl={{ alpha: true }} dpr={[1, 1.5]} style={{ pointerEvents: "none" }}>
      {level === "easy" && <Sparkles count={36} scale={[5, 4, 1]} size={2} speed={0} opacity={0.6} color="#9aa0aa" />}
      {level === "normal" && <Field mode="fall" color="#22e58a" count={70} hot={hot} />}
      {level === "hard" && <Field mode="orbit" color="#3da5ff" count={60} hot={hot} />}
      {level === "extreme" && <Swirl hot={hot} />}
      {level === "hell" && <Field mode="burst" color="#ff6a3d" count={110} hot={hot} />}
    </Canvas>
  );
}
