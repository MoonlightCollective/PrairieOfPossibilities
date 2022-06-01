using System.Collections;
using System.Collections.Generic;
using Unity.Collections;
using UnityEngine;
using UnityEngine.Rendering;

public class RenderTexSamplePattern : PrairiePatternMonochromaticBase
{
	public RenderTexture RenderTex;
	public float FieldRadius = 50.0f;
	public float UpdateRate = 20.0f;

	NativeArray<byte> _buffer;
	byte[] _copyBuffer;

	float _timer = -1.0f;
	bool _reading = false;

	AsyncGPUReadbackRequest _request;

	void Start()
	{
		int bufferSize = RenderTex.width * RenderTex.height * 4;
		_buffer = new NativeArray<byte>(bufferSize, Allocator.Persistent, NativeArrayOptions.UninitializedMemory);
		_copyBuffer = new byte[bufferSize];
	}

	void OnDestroy()
	{
		Debug.Log("IsReading:" + _reading);
		_buffer.Dispose();
	}

	// Update is called once per frame
	void Update()
	{
		_timer -= Time.deltaTime;
		if (_timer < 0 && !_reading)
		{
			_reading = true;
			requestNewBuffer();
			_timer = 1.0f/UpdateRate;
		}
	}

	void requestNewBuffer()
	{
		_request = AsyncGPUReadback.RequestIntoNativeArray(ref _buffer,RenderTex,0,readbackCallback);
	}

	void readbackCallback(AsyncGPUReadbackRequest request)
	{
		_reading = false;
		if (request.hasError)
		{
			Debug.LogWarning("RenderTexSample read error. Skipping");
			return;
		}
		_buffer.CopyTo(_copyBuffer);
	}

	public override void Run(float deltaTime, PrairieLayerGroup group, List<StemColorManager> points)
	{
		foreach (var p in points)
		{
			float xN = Mathf.Clamp(p.XZVect.x/FieldRadius,-.5f,.5f);
			float zN = Mathf.Clamp(p.XZVect.y/FieldRadius,-.5f,.5f);

			xN = Mathf.Clamp01(xN + .5f);
			zN = Mathf.Clamp01(zN + .5f);

			int nearestX = Mathf.RoundToInt(xN * (float)(RenderTex.width-1));
			int nearestY = Mathf.RoundToInt(zN * (float)(RenderTex.height-1));

			int offset = (nearestY * RenderTex.width * 4) + nearestX * 4;

			try
			{
				Color32 colorBytes = new Color32(_copyBuffer[offset + 0],_copyBuffer[offset + 1],_copyBuffer[offset+2],255);
				Color c = colorBytes;
				c.a = c.a * BlendSettings.LayerAlpha;
				p.SetColor(ColorBlend.BlendColors(c,p.CurColor,BlendSettings.BlendMode));
			}
			catch
			{
				Debug.Log($"Bad offset: {offset}, nX:{nearestX}, nY:{nearestY}");
			}
		}
	}
}
