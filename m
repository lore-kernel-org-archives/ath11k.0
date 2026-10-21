Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E4C606A31B
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 16:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f6+BlGF7;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=CoVwSnVu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGiZR7+p414GrEXSM/2Y69GcPywVjK77Fx5SS5X50mI=; b=f6+BlGF7WV5DTnYplqBqmt+ULg
	9ovY/m+LpTfucEP55weLISGMWyNRSLEIvFlptTuAmhEEFSbLT5mVvN/XphO1UTUhdpwAh537hW3yT
	hoecY/Xp6Ym97seOdV3+mKWF/qClu6BQakW2uJ0HPDzcBT1Kr/+TFMqQlREDaadBqluwlkNFMeh5X
	j62OfiLyBJjWGze1wQ57R/mjiWvyIf/WAXff6LcE9omAZhm7jR+awEX2ETzp9Zhi1jjQvaQNrAZ9H
	tmmEwGZv08rEEtUkrCt6383PY/7BEbR+zSRYKu9h8rL7Af4l4UeKrHkWs/ncys3V5jB/3yDvpkbi3
	X6i6ISHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXU-0000000CTI2-46d2;
	Wed, 21 Oct 2026 16:51:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXS-0000000CTFj-1Zt3
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 16:51:43 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c468bd799ecso10684566b.1
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792601500; x=1793206300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGiZR7+p414GrEXSM/2Y69GcPywVjK77Fx5SS5X50mI=;
        b=CoVwSnVuaAtGwvYE1AFPXtShzCFHngi9SrvTfGeNtFGEK5mE5BK0mtHj6U9vTtBag6
         QOMNFpVo89BPGlWQMCSERkE875DPvsW8peadHQKId7Zz6agB8BkcubTQMTxC+cbqm7fL
         d8Dnnkl8IoyuU+LOPgPRmXdPiALwOwZQmN9fAdFGP2IgIXDnUqhIRgYE6EoWqwHUEnLt
         uNPpxNMQf9I9jsR62bHoUFw9i7rTnFt+Nnq1Wc1YQ2EoFjuveCdwHTaocbz+5XNcedCm
         xTN0gAtDKQCMhBVPQfapNjFkf3RlzKUl9bWkL4Y1gRG4N+6TqeG+4FjkmrY6shMqEOXA
         8BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601500; x=1793206300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGiZR7+p414GrEXSM/2Y69GcPywVjK77Fx5SS5X50mI=;
        b=H+HqHH/4rCGg9B0lHHsHeEi6dIOCQTpQy85DTjdfH/9I78WnJwYCh4lo4JH64/TZo/
         OOSS3TGyDiyE2LEnEX7oz9IsKT2GW9OVMNduACphzmMrrfXisGceXbKblD6f917zqNxZ
         9ABKPBqexdcoyzKFj09E40uYXKxkNaUGfnaAfMt/kDzA8V9vTmmXmHYHLpL+KZxlFA7u
         fCZWFwilYv/gxdmDkDhmXk4HGO+f59+CSILvwUv4GWpHEC3UfWOQvQ8iBxEcqqQw7+x8
         L37CvJDE9Ev1/UMJIVxDwn3P6aeJSgI0lD1pss1PY29DSqmCyA2vz1nhHdjTla8x50Du
         7wCg==
X-Forwarded-Encrypted: i=1; AKwUvBwjh/Mh89IhDPalqNWTechYWsi6KSLEYKybEk92rQn75fbnTEIjq6uohKEaPyNtxbe0COubfvk=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ74lxyLmkhxHbWRsRs1L7MYzmGvVxP7tXevVeVnQdmduS4xC1f
	5IL8bW9jGWTpPl+KGoPgVqle+AyjtOu+bivwu0pC1zHwXzrOor83myT3IqG3SoLuTA==
X-Gm-Gg: AYBFou0ECCP2kWzlhTjc1sG/92NMNYSB7qPE5pu/PzzwCbK/Op+DLoU6MTl1UnOqj5k
	To8c0mMy92V6KI3ecLo41Q1FQwXLKWcoIucYK/pUks+TvjI4v4LQeD8Id6iBW1Y1aJngi+v+M9b
	HwBTLcUX9cPA7F/PT3z8zNKeuO3P1wBpFwG6prlxYzvD0Vq48QO4i5C7jHXLc5ZEkrGkRDP/TKx
	GRxkTyfsnHiTcEHTGzabZyWuzL2JRgxaakgj4vJaEiYsfuQNlp1btpHPhpvXu+4a5GvCcLbAvBC
	LxloFVH/guN/n+MeAwibhd5/FADky7cgAlfE+PYoQBUqL0bte5rKEe09sRnHf6sqzC+cQDnzkEd
	uuj2JM+LwbhZJrQjqYgzFQeWpfW48eY4EhGOZTolGjzIOPi7CfqujOe8K2gz9m9nI+o2+7a/ctd
	MfdaQEYBZ344CyzqYLtr+UAuoVV+Q58+yGjYq2mqTBt/YUA0m3N0jEUqB9pGZwTIzyofV5SxSnt
	/UUqu8X/NRFXxUjuKqPNlt7Z2mA9DW+uMKDxeMVc6Pll8ueS34avYSTvzqfiKkD8vfybTU8Kk6K
	Wn99MWSWTarqQV6HdchT9f1XmO9VJmsBGdNydJRbMBsvcS5yJKIoRZCGfKrJ8pMM7XljN3GwZMW
	UndXmNxOT8mkeHFfFUVVpp7U99W9P/GscGiAr4O7ER+P7SivRSR7S2caFT1659lxrGlwju9bHbx
	+WcSjkRw+YzrFCzNB1BpROeXHo9OmdALFgxOYqz2+rP30OuYP4+r3XtJeI0ju5rb4W
X-Received: by 2002:a17:907:3e89:b0:c31:8c48:e18b with SMTP id a640c23a62f3a-c46795e8833mr224387366b.14.1792601500405;
        Wed, 21 Oct 2026 09:51:40 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.223.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5de48esm20782466b.66.2026.10.21.09.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:51:39 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 2/2] wifi: ath12k: apply the 160 MHz NSS ratio to the radio for VHT
Date: Wed, 21 Oct 2026 18:51:38 +0200
Message-ID: <20261021165138.388593-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021165138.388593-1-julius@bairaktaris.de>
References: <20261021165138.388593-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_095142_427383_DF695EAC 
X-CRM114-Status: GOOD (  10.75  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The firmware reports the NSS a radio supports at 160 MHz as a ratio of
its 80 MHz NSS. VHT peer assoc applies that ratio to the peer's NSS, so
on a radio with a 1:2 ratio a two-stream VHT peer is sent one stream at
160 MHz. Commit a82ce08775bc ("wifi: ath12k: add extended NSS bandwidth
support for 160 MHz") fixed the HE path; take the VHT 160 MHz NSS from
the radio's TX chains the same way.

Compile tested only.

Fixes: 18ab9d038fad ("wifi: ath12k: add support for 160 MHz bandwidth")
Assisted-by: LLM
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01f8c6572f657..2c2753ce5df0c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2510,7 +2510,7 @@ static void ath12k_peer_assoc_h_vht(struct ath12k *ar,
 	arg->tx_max_mcs_nss = 0xFF;
 
 	if (arg->peer_phymode == MODE_11AC_VHT160) {
-		tx_nss = ath12k_get_nss_160mhz(ar, max_nss);
+		tx_nss = ath12k_get_nss_160mhz(ar, ar->num_tx_chains);
 		rx_nss = min(arg->peer_nss, tx_nss);
 		arg->peer_bw_rxnss_override = ATH12K_BW_NSS_MAP_ENABLE;
 
-- 
2.53.0


