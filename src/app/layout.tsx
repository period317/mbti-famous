import type { Metadata } from "next";
import "./globals.css";
import Header from "@/components/Header";

export const metadata: Metadata = {
  title: "MBTI 인물사전 — 유명인 MBTI 모음",
  description: "유명인들의 MBTI를 모아두는 인물사전. 공식 확인 정보와 커뮤니티 투표 추정을 구분해서 제공합니다.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="ko" className="h-full">
      <body className="min-h-full flex flex-col bg-[#F7F7F5]">
        <Header />
        <main className="flex-1">{children}</main>
        <footer className="border-t border-[#E5E5E3] bg-white mt-16">
          <div className="max-w-5xl mx-auto px-5 py-8 flex items-center justify-between flex-wrap gap-4">
            <div>
              <p className="text-[13px] font-bold text-[#111111]">MBTI 인물사전</p>
              <p className="text-[11px] text-[#ABABAB] mt-0.5">유명인 MBTI 데이터베이스</p>
            </div>
            <p className="text-[11px] text-[#ABABAB]">
              모든 MBTI 정보는 출처 기반 또는 커뮤니티 추정입니다
            </p>
          </div>
        </footer>
      </body>
    </html>
  );
}
