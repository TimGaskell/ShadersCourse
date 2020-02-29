Shader "Activity/Extrude"{
	Properties{
		_MainTex("Texture", 2D) = "White"{}
		_OutlineColor ("Outline Color", Color) = (0,0,0,1)
		_Outline("Outline Width", Range(0.002,0.1)) = 0.005
	}

		SubShader{

			ZWrite off
			CGPROGRAM
			#pragma surface surf Lambert vertex:vert

			float _Outline;
			float4 _OutlineColor;
			sampler2D _MainTex;

			struct Input {
				float2 uv_MainTex;
			};
			
			void vert(inout appdata_full v) {

				v.vertex.xyz += v.normal * _Outline;
			}

			void surf(Input IN, inout SurfaceOutput o) {
				o.Emission = _OutlineColor.rgb;
			}

			ENDCG
		
			ZWrite on
			CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float2 uv_MainTex;
			};

			sampler2D _MainTex;

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
			}

			ENDCG
		}
	Fallback "Diffuse"
}