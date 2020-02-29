Shader "Activity/Alpha"
{
    Properties
    {
        _MainTexture ("MainTexture", 2D) = "white" {}
    }
        SubShader
    {
        Tags { "Queue" = "Transparent" }

        CGPROGRAM
        #pragma surface surf Lambert alpha:fade

        sampler2D _MainTexture;
        
        struct Input {
            float2 uv_MainTexture;
        };

        void surf(Input IN, inout SurfaceOutput o){

            fixed4 c = tex2D(_MainTexture, IN.uv_MainTexture);
            o.Albedo = c.rgb;
            o.Alpha = c.a;

        }
        ENDCG
    }
    FallBack "Diffuse"
}
