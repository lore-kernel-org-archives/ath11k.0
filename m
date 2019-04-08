Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([63.128.21.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDYI2-0007Dj-Cm
 for ath11k@lists.infradead.org; Mon, 08 Apr 2019 17:42:40 +0000
Received: by mail-pg1-f198.google.com with SMTP id 14so10628412pgf.22
 for <ath11k@lists.infradead.org>; Mon, 08 Apr 2019 10:42:34 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: [PATCH] ath11k: add driver [q6_rproc DTS property)
Date: Mon, 08 Apr 2019 19:42:24 +0200
Message-ID: <1698032.ruk2XY5Ikj@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8500322058526131339=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Sricharan R <sricharan@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>

--===============8500322058526131339==
Content-Type: multipart/signed; boundary="nextPart5120546.HOvzEaAEQo"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5120546.HOvzEaAEQo
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 5 February 2019 17:22:34 CEST Kalle Valo wrote:
> Initial commit for ath11k, Qualcomm 802.11ax driver.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> ---
[...]
> +int ath11k_core_init(struct ath11k_base *sc)
> +{
> +	struct device *dev = sc->dev;
> +	struct rproc *prproc;
> +	phandle rproc_phandle;
> +	int ret;
> +
> +#ifndef CONFIG_IPQ_SUBSYSTEM_RESTART
> +	if (of_property_read_u32(dev->of_node, "q6_rproc", &rproc_phandle)) {
> +		ath11k_err(sc, "failed to get q6_rproc handle\n");
> +		return -ENOENT;
> +	}
> +
> +	prproc = rproc_get_by_phandle(rproc_phandle);
> +	if (!prproc) {
> +		ath11k_err(sc, "failed to get rproc\n");
> +		return -EINVAL;
> +	}
> +	sc->tgt_rproc = prproc;
> +#endif
> +

What is this q6_rproc DTS property (and why doesn't have it a qcom, prefix and 
not just called qcom,rproc)? I cannot find a public use of this and there also 
doesn't seem to be documentation for it. Still it is required to bring up the 
device without IPQ_SUBSYSTEM_RESTART (which is not available in the upstream 
kernel) but with remoteproc.

The first reference I could find this in your internal linux-msm [1] was also 
in this driver. There were also some function named similar in the q6v6 adsp/
q6v5 wcss driver [2] but no actual use in a dts or documentation. A wcss pil 
driver for remoteproc seems to be upstream now [3] but it isn't used 
anywhere.



Back to your QCA kernel to try out the remoteproc based image loading code
(which I wanted to use to check if there is a difference regarding the BDF 
loading problem mentioned in the other mail):

I have now tried to set it to q6v5_wcss (compatible qca,q6v5-wcss-rproc)
for your internal 4.4 tree

    --- linux-4.4.60.orig/arch/arm64/boot/dts/qcom/qcom-ipq807x-soc.dtsi
    +++ linux-4.4.60/arch/arm64/boot/dts/qcom/qcom-ipq807x-soc.dtsi
    @@ -1741,7 +1741,8 @@
     		};
     
     		wifi0: wifi@c0000000 {
    -			compatible = "qcom,cnss-qca8074";
    +			compatible = "qcom,ipq8074-wifi";
    +			q6_rproc = <&q6v5_wcss>;
     			reg = <0xc000000 0x2000000>;
     			qcom,hw-mode-id = <1>;
     			qcom,tgt-mem-mode = <0>;

But this one is not accepted as rproc. Problem is that start_q6 isn't 
called (which would register it as rproc). Without this, it will not come 
find the rproc and thus stop the startup of the ath11k driver. Unsure who is
responsible here to call the subsys_desc.powerup because subsystem_restart.c 
is the only thing implementing this code (but it is depending on 
CONFIG_IPQ_SUBSYSTEM_RESTART - the thing which was disabled here to have the 
rproc code path for image loading).

Btw. there is also q6v5_m3 - unsure whether this is also related. But its 
start_m3 is also not called.

As as start, it would be good to know first what q6_rproc should refer to.

Kind regards,
	Sven

[1] https://source.codeaurora.org/quic/cc-qrdk/oss/kernel/linux-msm/
[2] https://source.codeaurora.org/quic/cc-qrdk/oss/kernel/linux-msm/commit/?id=e421b7cd70b302e1f19cba6c9f2b88a38e20e9a0
    https://source.codeaurora.org/quic/cc-qrdk/oss/kernel/linux-msm/commit/?id=184547bc8366dcf30e4b162d7f54d709e827331a
    https://source.codeaurora.org/quic/cc-qrdk/oss/kernel/linux-msm/commit/?id=251c755e69dfebd6144ab25965c8f869d6f2472f
    https://source.codeaurora.org/quic/cc-qrdk/oss/kernel/linux-msm/commit/?id=ae52a5c5c01c687370cabc2e462dd86d243619cb
    https://source.codeaurora.org/quic/cc-qrdk/oss/kernel/linux-msm/commit/?id=d7dce7a374bad6dd5c7db5bc772b14745f8aaf53
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3a3d4163e0bfde184ffbc54c887f5b1ec9969c90
--nextPart5120546.HOvzEaAEQo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlyriAAACgkQXYcKB8Em
e0b0OA/8C9TKvFi8Tvsoj0BEhnOgLCYSMc4+Mi/Te3favHtnPc7tsa75K0qqfxtC
slxTiZPdYg47WxjTyU9WWRgq3bu2G0ZEsJYdr4iD+fDwGcJFBOJ5JmCgoNbWfhZS
Ekp4R97gIAcjtQDPFFQNe/vwMdgYAie/VuXysjjCp2mTnPHk/RUhDheew/ihEPy6
siw5nAA8wewcZ80ncLIi1hkwg0y4nVz3BsgyoQCXgtSAa/g4TR9F5lrWIWM3xP9y
WgQnwpsz7E1GxGt0UCbc6FZ9wxD2Lum/7aYkoC5S7P5dX0qdX8WIm0Y33GpCrq57
Mn7lTMG7GS1VLHQ/v8yVqrsdmZwfC8C46ZOOnx2LKy1al6aTMaTQ53wOKHNNPT5V
PFzxF3gzcoRmFAyPe+KGlKxyT0N+7lMXDG6nEBueA47wtBnoojs6iAmd1yiyySZ/
RXWpXjdHuqHxtT1ABCPHnzbPrYgIqO5K0N+63BG4HfVONpRBMkngP2fx427sCgob
T7FIv/iJ9WmV83eboz4D/bGsmXh357FZ0OggODBoLtlES4LWK/3JvCX2Qzm382Im
yxP7GLcZp7nLrILi/yo25tvXVNjCpOd43+x35/jTvW8rYD8pfI6r0CxPyd7+Dlth
PWlOFucp4aNZ+x0u9vxaN+opsg7KnzvZjLT7MeIf3Wmg7Xdgjh0=
=PPeh
-----END PGP SIGNATURE-----

--nextPart5120546.HOvzEaAEQo--





--===============8500322058526131339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============8500322058526131339==--
