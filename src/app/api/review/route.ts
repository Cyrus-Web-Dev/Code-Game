import { NextRequest, NextResponse } from "next/server";
import { admin, userId, fail, getLang } from "@/lib/server";
export async function GET(req: NextRequest) {
  const uid = await userId(req); if (!uid) return fail("UNAUTHORIZED", 401);
  const { data: rows } = await admin.from("wrong_answers")
    .select("question_id,difficulty,chosen_index,created_at")
    .eq("user_id", uid).order("created_at", { ascending: false }).limit(50);
  if (!rows?.length) return NextResponse.json({ items: [] });
  const ids = rows.map((r) => r.question_id);
  const { data: qs } = await admin.from("questions")
    .select("id,prompt,prompt_en,code,language,options,options_en,correct_index,explanation,explanation_en,difficulty")
    .in("id", ids);
  const en = getLang(req) === "en";
  const items = rows.map((r) => {
    const q = qs?.find((x) => x.id === r.question_id);
    if (!q) return null;
    return {
      id: q.id,
      difficulty: r.difficulty,
      prompt: en ? q.prompt_en ?? q.prompt : q.prompt,
      code: q.code,
      language: q.language,
      options: en ? q.options_en ?? q.options : q.options,
      correctIndex: q.correct_index,
      chosenIndex: r.chosen_index,
      explanation: en ? q.explanation_en ?? q.explanation : q.explanation,
      at: r.created_at,
    };
  }).filter(Boolean);
  return NextResponse.json({ items });
}
