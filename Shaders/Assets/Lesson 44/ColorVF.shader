Shader "Activity/ColorVF"
{ 
    SubShader
    {    
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color : COLOR;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
              /*o.color.r = v.vertex.x;
                o.color.g = v.vertex.y;*/
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 col;
                col.r = i.vertex.x/1000;
                col.g = i.vertex.y/1000;
                return col;
            }
            ENDCG
        }
    }
}
