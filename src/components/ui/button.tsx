import * as React from "react";
import { cva, type VariantProps } from "class-variance-authority";
import { cn } from "@/lib/utils";
const variants = cva("inline-flex items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition focus-visible:outline focus-visible:outline-2 focus-visible:outline-mint disabled:opacity-40", {
  variants: { variant: { default: "bg-mint text-ink hover:bg-paper", outline: "border border-line hover:border-mint", ghost: "hover:bg-panel" } },
  defaultVariants: { variant: "default" },
});
export interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement>, VariantProps<typeof variants> {}
export const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(({ className, variant, ...p }, ref) => <button ref={ref} className={cn(variants({ variant }), className)} {...p} />);
Button.displayName = "Button";
