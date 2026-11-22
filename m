Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A14606A331
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cilbxww5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=FeIgFi1e;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gfTp7E31
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=; b=Cilbxww5xQ/0Bi
	OBqU/wybz9F39QSu0a8o1ZWEtK8C2hiYMsAqmOosLbtI0fQgfFB5Wrw1Eb6qeUuTYedQBBawaLLn1
	HjTphXweXec2JXXdSD/ruNwMJnOGv+BlwNWqRMiEUwODlaGdZ9rLaRS1Ga4ADdR58gKxJV4UGdKhi
	HYXEEmahPymAa0IJN00oKXnGCxghK4N4RjUNKNjjUf1X0Iu8N6wVcXRVsdGNFEUgUoj0IlMND4wbO
	ZVFKPJBw9J8yhTo9Kf+TUTVude3cplrmrvg1GVchbpDFbsEkDw9wG8jvJZzGeoSYznZQVf7AcF2G0
	C/itYEJ4DyNxGOpzxObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3N-00000001VBI-2YV7;
	Sun, 22 Nov 2026 18:12:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3J-00000001V2T-2Pr2
	for ath11k@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=; b=FeIgFi1e5DlpUxaRKZCVEaLkJy
	deDfR2BXbALZuC9WuwP4YQM53F+U4AvNKxGlHW/8nlJevsT3IhFlQw4MYt7qpxjjTzjPlGhV9uJQa
	ieLtU0N0fVky/LPAEigIbrjNAHQZar40nEh9WeJLSp6JCaaTjLuY6jz4sLscryJzs3EWykgjRDpzO
	F0y/CyJhzraOTvTp7pHSJ/w5EuGST4go5EaW3u1ja6XFiGRk3iSSBil8TJU5YlNDvFjj+DaSIRuhp
	mreL+lpLjnS6itcWiSM9btrqIR+xIJzeZwj8sKvhEXF2pd/Pm3K28Rf318KeXhe5hHt/evMH/iPXV
	3wc/KoyQ==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3B-000000007jN-0dFV
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:12:36 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so3395300a12.3
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371145; x=1795975945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=;
        b=gfTp7E31/FdRN9LaMBZw4FC8Hw6kqY5PF5+wNXsT59jl61opMR/9z7SiyJewm5HCGM
         Lpp7cmYmtlgeyt84ncGLi5tRFjnxZtiizbEI/ybC8EyJqPlovez47Px5ltKu056MG8IR
         mbEhdg0J8JTmUcRY6cDkd5CVCimslBfLPoKmstTK560dm6If0yJUXzeur8qUxA5wmVxp
         QXEXYXwifHxuMfGNbeb6Uryg5vjaghMMqzO5lJr+SHs9VQn1NV6bgzFADHknVVAJrGYS
         UCKITtjVuEA+Li5BWyZLbdpi8rhSzmQrAC8GjELd2cWTfvFB8OSJNhIDFrOflhkct82W
         cgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371145; x=1795975945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v95im3Rj7N/9zvLa+rvIlqTu9zDfSCo/goL8nxf3T7A=;
        b=OPDQKq5ISv7hY2lK2BGPfNgRBs0airw+bE3VqzOTUQ40IROOp92BJn8nedtz6ZnrIc
         /P5ggPVWxh7qa8+DWwDh8X/P0DguAweDvKA4mB+bS5vJ27k0h8ZjLivtdf+G/dcqjX9s
         +bvGlDHl9XcrjnRMoe5Ejt226Dv9zxdLjQml8ov6S7wD5to8X6jHO2Se3oK7qY2aDdKt
         AU7mzXDmEMrHhNZ9fiZOCq+VW/8M0vBgoA+SSPLXRGykqwYgAOSyfYLl1rfOgXWUJ2Gs
         eqsaJvASnhNo42x+6t93PO4W0CQ/BEcWLo3ZIxhAP9RLswRtXmMrlkESI3ZqrO9CaAnk
         nL6Q==
X-Gm-Message-State: APuU4Z+yESS73Ak836VSGt7crp0z0Cm0GfxmKPGSOw+P1MkK6sMzcsR4
	V6Kiq2JwlnLPdWYNF+oDcoXmng9IlmrHyeT13tjyPZL09DRu+5wjokIKA47JqpSDlA==
X-Gm-Gg: AZFdTZepMMQtx+FopyK7ZWG1tG7oQH6iq5SzBxxZQeGyciFqLtpcSN2CldIWkj1BqYT
	EgQEzVuNRFWTMKmk10WkXguMjAj/auvYyhQ7oRhd4uTLUNkKesNaKGCM6B68LFcwL3vSHI+AwHY
	AevpFPlrtXkV5yCm274SOrgPbnM5toZZDDPQ6yLvbGA/4cCN8PYw0aVVbRdNaQBJtyVbtWNvNV+
	RDl6ATAE7NiFyzexJFUL/PSzKeljQdY0nYfVjBlRE9l+sE1w2BHBpSG+Pl0TjBB+liqL+fa1NBK
	+aMTlifwwSEHwRgKJ9vY7wiaYYCQ9wEi5t8Of7Tf7hy90m1Puf9nkL5j50kj5Nf5Ya7edAhYk8i
	FFO8hpDfeFYbJqCb/+XyZFsL+a7FdIytF293K7VCzmGnL8li1z042QER1uCHbk6kqtjtEX6h2Fm
	jwlxmtN6apAUmlYSHIzkTlVV1iqceDPVSO67Qf6yyBk2uKzzMyAiiDjOXby6twIQuLzehUP5POK
	uveOkVV15tg+LOavc2lNNNnu64Owbgmb/hAG0IePehwmDTh8gYG32Ls2xWVfVJJfS7Hss0Sc6Zh
	7cKZN67R8kaNjnTILk0LJlur7Pqma5/af4h7uXEC2XWdsvQfsnMNzP4lldTHU7aeVmZ09I9Xujo
	OsxPT3iWKJxfoz9ruvVpyibQ8vSqODXzGUAO5urKI2c7LGNhXuAQbcDQPdMxuTa/EiQNBVg0Qa7
	+TYZhf19kslDBELZaGwFz9EWMvN+M2j056g9pJjWkBCkyPxKLEskx4Seekv9v1ubtzEb3hl1k+/
	Ic3Hyh+kadatNydz32/mzp4DtoZhWSy/QOx3JeHl0NTpiptwDF+OiCyKSQ9CbZWx/VBWqeC2iGa
	xoUOMSKj3I9ZzfF41h8SdBhCPb8kgzgUbpnXWZvXKU8dFnLIWPCTxrNpCZRNblSikUuIJy9w
X-Received: by 2002:a05:6402:51d4:b0:6b5:8cb3:5e19 with SMTP id 4fb4d7f45d1cf-6ba37e8826emr7380558a12.38.1795371145587;
        Sun, 22 Nov 2026 10:12:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 6/9] wifi: ath11k: offer scatter-gather and TSO with Ethernet encap
Date: Sun, 22 Nov 2026 19:12:10 +0100
Message-ID: <20261122181213.1016590-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_181229_290631_D2E315B7 
X-CRM114-Status: UNSURE (   9.29  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tell mac80211 that the AP, AP VLAN and station netdevs may pass TCP
batches with fragments (NETIF_F_SG, TSO and TSO6, up to 16 segments)
when frames go out with Ethernet encap on a device whose TCL takes them
(IPQ8074). mac80211 segments them in software on every other path, and
when the airtime of the whole batch would not fit AQL's estimate.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c |  6 ++++++
 drivers/net/wireless/ath/ath11k/dp_tx.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 12 ++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 4fbdd15d1ce0..6d950afb90f1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -15,6 +15,12 @@
 #include "peer.h"
 #include "mac.h"
 
+/* Whether the netdevs of this device offer TSO and scatter-gather */
+bool ath11k_dp_tx_tso_wanted(struct ath11k_base *ab)
+{
+	return ab->hw_params.tx_tso;
+}
+
 static enum hal_tcl_encap_type
 ath11k_dp_tx_get_encap_type(struct ath11k_vif *arvif, struct sk_buff *skb)
 {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 967f212d33db..a73b5197fac2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -22,6 +22,7 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb, int held_ring);
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring, int n);
+bool ath11k_dp_tx_tso_wanted(struct ath11k_base *ab);
 int ath11k_dp_tx_gso(struct ath11k *ar, struct ath11k_vif *arvif,
 		     struct ath11k_sta *arsta, struct sk_buff *skb,
 		     int held_ring);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 5f2086bf6c5d..1076e3b09cd3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10727,6 +10727,18 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_ETHERNET) {
 		ieee80211_hw_set(ar->hw, SUPPORTS_TX_ENCAP_OFFLOAD);
 		ieee80211_hw_set(ar->hw, SUPPORTS_RX_DECAP_OFFLOAD);
+
+		/*
+		 * The TCL takes a TCP batch whole, with its payload in
+		 * fragments, when the frame goes out with Ethernet encap.
+		 */
+		if (ath11k_dp_tx_tso_wanted(ab)) {
+			ar->hw->encap_netdev_features = NETIF_F_SG |
+							NETIF_F_TSO |
+							NETIF_F_TSO6;
+			ar->hw->encap_gso_max_segs =
+				ATH11K_DP_TX_TSO_MAX_SEGS;
+		}
 	}
 
 	if (cap->nss_ratio_enabled)
-- 
2.53.0


