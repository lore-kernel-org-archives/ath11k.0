Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BBCCEACF8
	for <ath11k@archiver.kernel.org>; Tue,  1 Oct 2024 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qywIPYHuVPGlOQUUJe1oYrly+X7OJ96HoqCYKutu3Pk=; b=c+6SwcpChFto9Lv9LsshJybQk4
	fSr1pr/HnlpCL4rHcFSqWZE5BfGjKmn5krDrBeKOZEJ4F8/hAuRLqa1JJV5YTYCJ9C2LImXJqESdo
	oDaZZljnji54urncDhrejXrq7xytogLo9jr+UVHHkW9nK7iidD6rebnVoWfNGVYuzwFj8dn0fxn+5
	f7qainNcIkXRuwQA4IhlhF8kDD/k/W/jkmhGPBDHeY37+TS8V2byeU5f1CawLN97Mkh5g3neu9Yrb
	5lcJq56MILmRa7uoFkA7RZmnrepgiLeMb4GsN+YS0UhYFQs+uviwSuKYw2O4PjX/hnld4/MfZCUPm
	nlaFc80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svhtO-00000003o8H-3cRZ;
	Tue, 01 Oct 2024 18:46:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svflc-00000003YoU-3M1p
	for ath11k@bombadil.infradead.org;
	Tue, 01 Oct 2024 16:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qywIPYHuVPGlOQUUJe1oYrly+X7OJ96HoqCYKutu3Pk=; b=EgPDKxp9xV5vxtGwvhvQR6GFA0
	vlaKJBIY+DnQwkhe9V6jMlab9sEd65fQDncy2mNwBsk3lq3BVL9cUkw7WxImsT5YERdh0WUC4+5a+
	qZ3vIaLrWYNVdq1pyEKsAC2+anhPrFC8fsWQV19lH5vM1wPe/HMk3e/YJZNmih4hAN5GC/lora1Xv
	NxvtI3HnIqwYEI915J3+/C9+ew8k+zZKmgaJqQeyA8SIcMU7FXN6Q7+Qzg6Odv/Y05540+PRt6RxJ
	7Dbrf9UH5/ljRBeQpKWamGXIwm/oUJkShKrWg8M3xbMVlAYkJjWGCj+u3Eg58XVtNLQRN9oisY0in
	vzXig69g==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svflZ-00000003DQo-2BBV
	for ath11k@lists.infradead.org;
	Tue, 01 Oct 2024 16:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8696A5C0FD6;
	Tue,  1 Oct 2024 16:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE946C4CEC6;
	Tue,  1 Oct 2024 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727800223;
	bh=qywIPYHuVPGlOQUUJe1oYrly+X7OJ96HoqCYKutu3Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzHpNUTcOCjxUgmmwdf0fAX9FusKgOjcml52YETXn2k/+at7tKtbM7h9dxYUxKdGA
	 WLepTw9R7IHWMiZw7JGLHRLqRTeA3+aseqjtzYgyc7K6N4IzHgUhG+T8bEhNqu+XEy
	 EbeNz3aoNU9I4bsEzjwqdhrVbT8Odh32U8Sd3EWQPH2xLcXqU4v8wCtSfwMmfezxPY
	 nbHYJd0fgVpg5QoQ9mufTLgR/1e/CMsY096oB2ZvaQDLiq2IIRXJlJiKrLNFttYnQ4
	 9Xi+oSS3CDj24RiygnASEqV2p3UkcINU8ozB1+GoJs0KQI37ywG/YTaOCtRsr9l3vV
	 yLe12E96+0mNQ==
Date: Tue, 1 Oct 2024 17:30:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add
 firmware-name property
Message-ID: <20241001-stratus-aerospace-93a8fcc20daf@spud>
References: <20241001033053.2084360-1-quic_miaoqing@quicinc.com>
 <20241001033053.2084360-2-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tf8btgzQbpXwk8UC"
Content-Disposition: inline
In-Reply-To: <20241001033053.2084360-2-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_173025_929208_C36C8B26 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--Tf8btgzQbpXwk8UC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 11:30:51AM +0800, Miaoqing Pan wrote:
> This is the same optional property that defined in qcom,ath10k.yaml. It's
> useful for the platform / board to specify firmware through device-tree.
>=20
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Tf8btgzQbpXwk8UC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvwjmwAKCRB4tDGHoIJi
0o52AQCaUZULOWA6elXQcLGkgs4ST3BsPJraPCN54wNg+3YamwEAsMgfVrAw86v/
fi6B55JrfAIf+klnNqxLloy/QQQxYwg=
=EUhw
-----END PGP SIGNATURE-----

--Tf8btgzQbpXwk8UC--

