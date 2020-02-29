Shader "Activity/BumpedEnvironment2"
{
    Properties{
        _myBump("Normal Texture", 2D) = "bump" {}
        _myCube("Cube Map", CUBE) = "White" {}
    }

    SubShader{

         CGPROGRAM
             #pragma surface surf Lambert

             sampler2D _myBump;
             samplerCUBE _myCube;


             struct Input {
                 float2 uv_myBump;
                 float3 worldRefl; INTERNAL_DATA
             };

             void surf(Input IN, inout SurfaceOutput o) {
               
                 o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump)) * 0.3;
                 o.Albedo = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal)).rgb;
             }

        ENDCG
    }
    FallBack "Diffuse"
}
