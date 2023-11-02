import type {
	BufferAttribute, Color, CubeTexture, FrontSide, Layers, Matrix3, Matrix4, NoBlending, Sphere, Texture, Vector3,
	Quaternion, WebGLRenderer,
	ClampToEdgeWrapping,
	DoubleSide,
	InterpolateDiscrete,
	InterpolateLinear,
	NoColorSpace,
	LinearFilter,
	LinearMipmapLinearFilter,
	LinearMipmapNearestFilter,
	MathUtils,
	MirroredRepeatWrapping,
	NearestFilter,
	NearestMipmapLinearFilter,
	NearestMipmapNearestFilter,
	PropertyBinding,
	RGBAFormat,
	RepeatWrapping,
	Scene,
	Source,
	SRGBColorSpace,
	CompressedTexture,
	DepthTexture,


	PlaneGeometry,
	ShaderMaterial,
	Uniform,
	Mesh,
	PerspectiveCamera,

	AnimationClip,
	Bone,
	Box3,
	BufferGeometry,
	DirectionalLight,
	FileLoader,
	Group,
	ImageBitmapLoader,
	InstancedMesh,
	InterleavedBuffer,
	InterleavedBufferAttribute,
	Interpolant,
	Line,
	LineBasicMaterial,
	LineLoop,
	LineSegments,
	Loader,
	LoaderUtils,
	Material,
	MeshBasicMaterial,
	MeshPhysicalMaterial,
	MeshStandardMaterial,
	NumberKeyframeTrack,
	Object3D,
	OrthographicCamera,
	PointLight,
	Points,
	PointsMaterial,
	QuaternionKeyframeTrack,
	Skeleton,
	SkinnedMesh,
	SpotLight,
	TextureLoader,
	Vector2,
	VectorKeyframeTrack,


	TriangleFanDrawMode,
	TriangleStripDrawMode,
	TrianglesDrawMode,

	UVMapping,
	CubeReflectionMapping,
	CubeRefractionMapping,
	EquirectangularReflectionMapping,
	EquirectangularRefractionMapping,
	CubeUVReflectionMapping,

	TangentSpaceNormalMap,
	ObjectSpaceNormalMap,
	WebGLRenderTarget,

	HalfFloatType,
	Float32BufferAttribute,
	UniformsUtils,
	Clock
} from "three";

export type service = {
	BufferAttribute: typeof BufferAttribute,
	Color: typeof Color, CubeTexture: typeof CubeTexture, FrontSide: typeof FrontSide, Layers: typeof Layers, Matrix3: typeof Matrix3, Matrix4: typeof Matrix4, NoBlending: typeof NoBlending, Sphere: typeof Sphere, Texture: typeof Texture, Vector3: typeof Vector3,
	Quaternion: typeof Quaternion,
	WebGLRenderer: typeof WebGLRenderer,
	WebGLRenderTarget: typeof WebGLRenderTarget,
	ClampToEdgeWrapping: typeof ClampToEdgeWrapping,
	DoubleSide: typeof DoubleSide,
	InterpolateDiscrete: typeof InterpolateDiscrete,
	InterpolateLinear: typeof InterpolateLinear,
	NoColorSpace: typeof NoColorSpace,
	LinearFilter: typeof LinearFilter,
	LinearMipmapLinearFilter: typeof LinearMipmapLinearFilter,
	LinearMipmapNearestFilter: typeof LinearMipmapNearestFilter,
	MathUtils: typeof MathUtils,
	MirroredRepeatWrapping: typeof MirroredRepeatWrapping,
	NearestFilter: typeof NearestFilter,
	NearestMipmapLinearFilter: typeof NearestMipmapLinearFilter,
	NearestMipmapNearestFilter: typeof NearestMipmapNearestFilter,
	PropertyBinding: typeof PropertyBinding,
	RGBAFormat: typeof RGBAFormat,
	RepeatWrapping: typeof RepeatWrapping,
	Scene: typeof Scene,
	Source: typeof Source,
	SRGBColorSpace: typeof SRGBColorSpace,
	CompressedTexture: typeof CompressedTexture,
	DepthTexture: typeof DepthTexture,

	PlaneGeometry: typeof PlaneGeometry,
	ShaderMaterial: typeof ShaderMaterial,
	Uniform: typeof Uniform,
	Mesh: typeof Mesh,
	PerspectiveCamera: typeof PerspectiveCamera,

	AnimationClip: typeof AnimationClip,
	Bone: typeof Bone,
	Box3: typeof Box3,
	BufferGeometry: typeof BufferGeometry,
	DirectionalLight: typeof DirectionalLight,
	FileLoader: typeof FileLoader,
	Group: typeof Group,
	ImageBitmapLoader: typeof ImageBitmapLoader,
	InstancedMesh: typeof InstancedMesh,
	InterleavedBuffer: typeof InterleavedBuffer,
	InterleavedBufferAttribute: typeof InterleavedBufferAttribute,
	Interpolant: typeof Interpolant,
	Line: typeof Line,
	LineBasicMaterial: typeof LineBasicMaterial,
	LineLoop: typeof LineLoop,
	LineSegments: typeof LineSegments,
	Loader: typeof Loader,
	LoaderUtils: typeof LoaderUtils,
	Material: typeof Material,
	MeshBasicMaterial: typeof MeshBasicMaterial,
	MeshPhysicalMaterial: typeof MeshPhysicalMaterial,
	MeshStandardMaterial: typeof MeshStandardMaterial,
	NumberKeyframeTrack: typeof NumberKeyframeTrack,
	Object3D: typeof Object3D,
	OrthographicCamera: typeof OrthographicCamera,
	PointLight: typeof PointLight,
	Points: typeof Points,
	PointsMaterial: typeof PointsMaterial,
	QuaternionKeyframeTrack: typeof QuaternionKeyframeTrack,
	Skeleton: typeof Skeleton,
	SkinnedMesh: typeof SkinnedMesh,
	SpotLight: typeof SpotLight,
	TextureLoader: typeof TextureLoader,
	Vector2: typeof Vector2,
	VectorKeyframeTrack: typeof VectorKeyframeTrack,

	TriangleFanDrawMode: typeof TriangleFanDrawMode,
	TriangleStripDrawMode: typeof TriangleStripDrawMode,
	TrianglesDrawMode: typeof TrianglesDrawMode

	UVMapping: typeof UVMapping,
	CubeReflectionMapping: typeof CubeReflectionMapping,
	CubeRefractionMapping: typeof CubeRefractionMapping,
	EquirectangularReflectionMapping: typeof EquirectangularReflectionMapping,
	EquirectangularRefractionMapping: typeof EquirectangularRefractionMapping,
	CubeUVReflectionMapping: typeof CubeUVReflectionMapping,

	TangentSpaceNormalMap: typeof TangentSpaceNormalMap,
	ObjectSpaceNormalMap: typeof ObjectSpaceNormalMap,

	HalfFloatType: typeof HalfFloatType
	Float32BufferAttribute: typeof Float32BufferAttribute,
	UniformsUtils: typeof UniformsUtils,
	Clock:typeof Clock,
}
