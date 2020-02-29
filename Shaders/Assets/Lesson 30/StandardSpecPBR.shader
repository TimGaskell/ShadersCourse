Shader "Acitvity/StandardSpecPBR"
{
    Properties
    {
        _Colour("Colour", Color) = (1,1,1,1)
        _MetallicTex("Metallic (R)", 2D) = "White"{}
        _SpecColor("Specular", Color) = (1,1,1,1)
    }

        SubShader{
              Tags{
                "Queue" = "Geometry" 
              }

            CGPROGRAM
            #pragma surface surf StandardSpecular

            float4 _Colour;
            sampler2D _MetallicTex;           

            struct Input
            {
               float2 uv_MetallicTex;
            };


            void surf(Input IN, inout SurfaceOutputStandardSpecular  o)
            {
                o.Albedo = _Colour.rgb;
                o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
                o.Specular = _SpecColor.rgb;
            }
            ENDCG
    }
        FallBack "Diffuse"
}
