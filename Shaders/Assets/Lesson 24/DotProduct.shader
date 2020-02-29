Shader "Activity/DotProduct"
{

    SubShader
    {
        CGPROGRAM

        #pragma surface surf Lambert

        struct Input {
            float3 viewDir;
        };
        
        void surf(Input IN, inout SurfaceOutput o) {

            half dotp = dot(IN.viewDir, o.Normal);
            o.Albedo.r =  dot(IN.viewDir, o.Normal);
        }

        ENDCG
    }
    FallBack "Diffuse"
}
