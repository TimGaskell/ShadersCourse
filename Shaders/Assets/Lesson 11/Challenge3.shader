Shader "Activity/Challenge3"{

	Properties{
		_myTex("Example Texture", 2D) = "white" {}
	}
		SubShader{

			CGPROGRAM
				#pragma surface surf Lambert

				sampler2D _myTex;

				struct Input {
					float2 uv_myTex;

				};

				void surf(Input IN, inout SurfaceOutput o) {
					
					float4 Green = float4(0, 1, 0, 1);
					o.Albedo = (tex2D(_myTex, IN.uv_myTex) * Green).rgb;
					
				}

			ENDCG
	}
		FallBack "Diffuse"
}

