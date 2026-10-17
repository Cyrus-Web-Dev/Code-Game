"use client";
import { useRef } from "react";
import { Canvas, useFrame } from "@react-three/fiber";
import { Stars } from "@react-three/drei";
import type { Group } from "three";
function Spin() {
  const g = useRef<Group>(null);
  useFrame((_, dt) => { if (g.current) g.current.rotation.y += dt * 0.015; });
  return <group ref={g}><Stars radius={60} depth={40} count={1600} factor={3} saturation={0} fade speed={0.5} /></group>;
}
export default function Backdrop() {
  return (
    <div aria-hidden className="pointer-events-none fixed inset-0 -z-10 bg-gradient-to-b from-[#120f20] via-[#1d1836] to-[#3d2348]">
      <Canvas camera={{ position: [0, 0, 1], fov: 60 }} dpr={[1, 1.5]}><Spin /></Canvas>
    </div>
  );
}
