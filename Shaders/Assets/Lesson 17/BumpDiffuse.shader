Shader "Activity/BumpDiffuse"
{

    Properties{
        _myDiffuse("Diffuse Texture", 2D) = "white" {}
        _myBump("Normal Texture", 2D) = "bump" {}
        _mySlider ("Normal Amount", Range(0,10)) = 1
        _myTextureSlider("Texture Normal Scale ", Range(0,10)) = 1
    }

    SubShader{

        CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _myDiffuse;
            sampler2D _myBump;
            half _mySlider;
            half _myTextureSlider;
                
            struct Input {
                float2 uv_myDiffuse;
                float2 uv_myBump;
            };

            void surf(Input IN, inout SurfaceOutput o) {
                o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse * _myTextureSlider).rgb;
                o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump * _myTextureSlider));
                o.Normal *= float3(_mySlider, _mySlider, 1);
            }
   
        ENDCG
    }
    FallBack "Diffuse"
}
