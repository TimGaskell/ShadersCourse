﻿Shader "Acitvity/Toon"
{
    Properties
    {
        _Colour("Colour", Color) = (1,1,1,1)
        _RampTex("Ramp Texture", 2D) = "white"{}

    }

        SubShader{
    
             CGPROGRAM
             #pragma surface surf ToonRamp

             float4 _Colour;
             sampler2D _RampTex;

             half4 LightingToonRamp(SurfaceOutput s, fixed3 lightDir, fixed3 atten) {

                 float diff = dot(s.Normal, lightDir);
                 float h = diff * 0.5 + 0.5;
                 float2 rh = h;
                 float3 ramp = tex2D(_RampTex, rh).rgb;

                 half4 c;
                 c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
                 c.a = s.Alpha;
                 return c;
             }

             

             struct Input
             {
                float2 uv_MainTex;
             };

             void surf(Input IN, inout SurfaceOutput  o)
             {
                 o.Albedo = _Colour.rgb;
             }
            ENDCG
    }
        FallBack "Diffuse"
}