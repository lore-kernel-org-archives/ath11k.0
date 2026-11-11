Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81C60A3806
	for <ath11k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J9XWU47x;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=rfFisFfM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=; b=J9XWU47x6lp5+MdiEFZOA+oq7l
	0Y1bgaWWkHVg4bhjTaVWUdWQvDouLmXSvysOTA+zil1a+8c21FbTI4KESGp1kfUfjGqi1dnwmt56+
	DdS8Z0Ehv6J92M7EJa/C5FbrDJd4F9U2OdDN6NVvu/tbMY+3gMNG6RiLwnOSWIDcr5e8vtkzXrF5X
	xfzvugvX15AEbiZux5xyWy9+yDlQghvulejlqdo5aUW8tKHv4j3aR249riRk20CUEobj0bUl46Ugt
	YWFAG7L+ue+Ta6GN02SVZmOzxs2bNKBihrlMckpvAZHYIQbiaIzg5F4HzgVrPU0nqdoTgF8dqVsg3
	0IIUANsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lh-00000005zFT-0r1L;
	Wed, 11 Nov 2026 08:06:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Le-00000005zDN-1d7m
	for ath11k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:27 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3364867a12.1
        for <ath11k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384384; x=1794989184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
        b=rfFisFfMS/iPssiVjfqRScGsSH1Ti2fqilfQrBXkc3sShlgV9p6txoP5B0eLpiiZhQ
         gXARqIrOBLaB5h46RTVplI8r1/IT1zNFunPuZRtVcm800Q0fyMvg/u7Axk8xMB6AgtVN
         novDN+X8aFsNTDBQSsc2P+81tSXRIkMJWwxUNRcg9FywKwnAhoW0JaIkhTfwiBMwIxNk
         Yk6aUz1CRdAgrFWBfq4c5BcG80sQdo4qU6H0GedAhFnea+WOWDpGmM/wmvcmbhOOxZA0
         /CJujDwIMYg3E7MArWLEHEPqEItIVg3CgKn1x2r5G9UVPN2a7cMMQG2Qgi7vPeW/BKqg
         7F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384384; x=1794989184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0J7KIqgzdPEu6O5tkL865eN0Yv3sUF85fJ84jwqAG4=;
        b=G/gICqrjmPLysgnVXF5oEfPtwX9cgh7KpbJoBnboOrwm4uPF+QbZNrLenJ+yRV8dS2
         WxBLoN3ZuZg/zzoIB8D0v89IkNSne6oqsSgODxa1oVfDDb+v+ww+dG21QpI5yDYeBKtN
         izg17SS+rFFJd0bnMJ4HdgpYNb6J2NhalbGWE0RT986S0VqO6m69Ebix7G7uiNMD+gKj
         ttC182FSU7vhZoWcWID9MHLVfy6oDQEv/m0obK3XmejHwp//NLtMAI0PuytVScJJja1s
         6CETJ3cONob7CmSt0mVdKqpfYSPt677mCWVIsgR3e9j9KpfahRsTt3pnVkEKlo9QiWPd
         0Buw==
X-Forwarded-Encrypted: i=1; AL+hErFVQ/0L8O26hDCdkk0OpbUEzSZWboq6BwmYYAWiBGLRUjXOUOCoWMV1Pdo1WseHMI6V74wuLPo=@lists.infradead.org
X-Gm-Message-State: APuU4Z+0L5aQ/Y2os4r4LiA1jhyv5qFRkhct6hdSWdDXmrvWSjymgHRn
	0uizaCAAmCDywNFwNc8CwWANWiecRmHXEwhVDP0pLTQwo4zLORxCuYX5tSsa57/s7w==
X-Gm-Gg: AYBFou3UuIV8oaIytsjNxsaYOmLdY1G8bTXBf75JjeRCrx8RhlEWIsPV3LLYl+UE+1E
	VRHzsJMWbriKMJU+vpxBmIIXpN0ILSdYdSlG6o+mS77LNkdfvWuSov2CH8R84Ag7BQ/4yNR+5pM
	M4Kn2y/8y8PVy41SkQeJmEMmTcqHWrOPtS5eZz6INghofb30TTPAmhRqwakRkqz4vxwlJNITF07
	32z2qfxuZek3diHa0l3s1q7eTRgX2Y6xAg6A8EtqWQSfiZ40htp9CnoYnfjMzlyvYXT5Fdgwk/e
	00Wi/explbGPigSh7had24z9C0id9EIUNGrBwJN1nDpqNMrtPtICSZNTL599O+7HYYnpdv3+/O3
	hsBh5Y2405NFS6IkhTVCimWkUyInKmWMK9fouDX5+DXwnldqTlFG3HPzgt3PM+boVcf7fjCAvxK
	ZdJVMo+hpJhENYu6UXMxgLAUZq7XvrS8RtKzzhN4HyWAabJ1RORBjvSrCn7OuflwsN5yJe4mR24
	H7JZuGZ/HUM+V3ibGbuzjoaQRQRjekspdNOpVej6RzatP+GcWFkhliNMyRlPRgpxuk7Bk7XH5Dn
	2gV79WOyB+zQ7k8w86g4oWGtRlg8H597463pLf65icUQoDVabveGgZ7cBrhMKtmwszTct9TeRL/
	TZ4ysBVSC3Y2rsnlylBfH+UWIYKVeBckLwcGAmFpgtWMYmlkoVrP+UHukCz+MClx0hYAjeWiAkh
	PGENfUmz1YtnAzuEOmTRL+SgwZjZG2alT31EshZ+KXMUTXWhMAnFVFT7uSFW4HA59W3h9NOCCHU
	a0eMfpgNewo89VyLK1X01U1HO6vz31Md9qPmSD4gho3EaBtOdZcONGpLDIJme/P0+U9V4iaHwCq
	CuS0Tpfax+sQRCkld9k=
X-Received: by 2002:a05:6402:2346:b0:6b7:8b36:93f3 with SMTP id 4fb4d7f45d1cf-6b78b3697e0mr354778a12.23.1794384384000;
        Wed, 11 Nov 2026 00:06:24 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:22 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:18 +0100
Message-ID: <20261111080620.244164-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000626_440368_FA8094D5 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k and ath12k check the Michael MIC of a reassembled TKIP frame in
the driver. Both compute the length of the MIC-protected data in a
size_t without checking that the frame is long enough, so a peer that
holds the TKIP key and sends two fragments with fewer than 16 payload
bytes between them wraps the length, and michael_mic() reads on from the
skb data until it faults. Each patch drops such a frame before the
subtraction, as mac80211 does in its own MIC check.

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  wifi: ath12k: drop TKIP frames too short for the Michael MIC
  wifi: ath11k: drop TKIP frames too short for the Michael MIC

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 5 +++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
 2 files changed, 10 insertions(+)


base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.53.0


