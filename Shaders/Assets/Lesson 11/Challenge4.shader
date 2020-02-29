Shader "Activity/Challenge4"{

	Properties{
		_myDefTex("Diffuse Texture", 2D) = "white" {}
		_myEmTex("Emissive Texture", 2D) = "black" {}
	}
		SubShader{

			CGPROGRAM
				#pragma surface surf Lambert

				sampler2D _myDefTex;
				sampler2D _myEmTex;


				struct Input {
					float2 uv_myDefTex;
					float2 uv2_myEmTex;
					

				};

				void surf(Input IN, inout SurfaceOutput o) {
			
					o.Albedo = (tex2D(_myDefTex, IN.uv_myDefTex)).rgb;
					o.Emission = (tex2D(_myEmTex, IN.uv2_myEmTex)).rgb;

				}

			ENDCG
	}
		FallBack "Diffuse"
}

