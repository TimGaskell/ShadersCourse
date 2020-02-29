Shader "Acitvity/Challenge 1"
{
    Properties
    {
        _DiffTexture("Diffuse Texture", 2D) = "White"{}
        _RimColor("Rim Color", Color) = (0,0.5,0.5,0)
        _StripeSize("StripeSize", Range(0,20)) = 10
    }

        SubShader{

            CGPROGRAM
            #pragma surface surf Lambert

            float4 _RimColor;
            float _StripeSize;
            sampler2D _DiffTexture;

            struct Input
            {
               float3 viewDir;
               float3 worldPos;
               float2 uv_DiffTexture;
            };


            void surf(Input IN, inout SurfaceOutput  o)
            {
                o.Albedo = tex2D(_DiffTexture, IN.uv_DiffTexture).rgb;

                half rim = 1 - saturate(dot(normalize(IN.viewDir), normalize(o.Normal)));
                o.Emission = frac(IN.worldPos.y * _StripeSize * 0.5) > 0.4 ? float3(0, 1, 0) * rim : float3(1, 0, 0) * rim;
            }
            ENDCG
    }
        FallBack "Diffuse"
}
