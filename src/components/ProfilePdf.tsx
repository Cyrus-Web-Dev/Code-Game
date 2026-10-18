"use client";
import { Document, Page, Text, View, Image, StyleSheet } from "@react-pdf/renderer";
import { LEVEL_IDS, LEVELS, TITLE_DEFS, THEMES, anyTheme, type Lang } from "@/lib/config";
import { dict } from "@/lib/i18n";
const st = StyleSheet.create({
  page: { padding: 36, fontSize: 11, fontFamily: "Helvetica" },
  head: { flexDirection: "row", marginBottom: 16, paddingBottom: 14, borderBottom: "2 solid #15131f" },
  av: { width: 84, height: 84, borderRadius: 42, marginRight: 16 }, ph: { width: 84, height: 84, borderRadius: 42, marginRight: 16, backgroundColor: "#ccc" },
  name: { fontSize: 24, fontWeight: 700 }, gold: { color: "#9a6b00", marginTop: 4 }, title: { fontSize: 15, marginTop: 6, fontWeight: 700 }, small: { color: "#555", marginTop: 2 },
  row: { marginBottom: 8, padding: 8, border: "1 solid #999" }, b: { fontWeight: 700 },
});
export default function ProfilePdf({ d, lang }: { d: any; lang: Lang }) {
  const T = dict[lang], p = d.profile, ti = d.title, col = anyTheme(ti.level).glow;
  return (
    <Document title={`${T.p_title} ${p.username}`}>
      <Page size="A4" style={st.page}>
        <View style={st.head}>
          {p.avatar_url && /^data:image\/(png|jpe?g)/.test(p.avatar_url) ? <Image style={st.av} src={p.avatar_url} /> : <View style={st.ph} />}
          <View style={{ flex: 1 }}>
            <Text style={st.name}>{p.username}</Text>
            <Text style={st.gold}>{p.total_points} {T.points} | {T.rank} #{d.rank}</Text>
            <Text style={[st.title, { color: col }]}>{ti.name}</Text>
            <Text style={st.small}>{ti.desc[lang]}</Text>
            <Text style={st.small}>{T.p_role}: {(T as any)["role_" + p.role]} | {T.p_fav_lang}: {p.favorite_language || "-"} | {T.p_fav_fw}: {p.favorite_framework || "-"} | {T.p_skill}: {(T as any)["skill_" + p.skill_level]}</Text>
          </View>
        </View>
        {LEVEL_IDS.map((l) => {
          const s = d.stats.find((x: any) => x.difficulty === l), n = s?.questions_answered ?? 0, acc = n ? Math.round((s.correct_answers / n) * 100) : 0;
          const got = d.titles.find((x: any) => x.level === l);
          return (
            <View key={l} style={st.row} wrap={false}>
              <Text style={st.b}>{LEVELS[l].label}: {s?.games_played ?? 0} {T.p_games}, {n} {T.p_questions}, {T.p_accuracy} {acc}%, {s?.points ?? 0} {T.points}</Text>
              <Text style={st.small}>{got ? `${got.name} - ${TITLE_DEFS[l].desc[lang]}` : (T as any).p_locked.replace("{n}", String(Math.min(n, 50)))}</Text>
            </View>
          );
        })}
      </Page>
    </Document>
  );
}
