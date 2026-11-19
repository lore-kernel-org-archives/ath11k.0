Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD0606A324
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4LK01dgX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEjgIL5n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zD4vWVrzj0m5l3wwaVzmZX6fctqf45aDG3D9ksl4C6c=; b=4LK01dgXzR0Qsw/w7txWuqKcEC
	FAXN2kZX8TMI+TU2Kt8mqMlTRcD2lhqfU3WMuAPXhOIHMjIeRx2LLtsMoJtPY6B8IA5k6oQVIJyn/
	OHqZCRjWjNr6KOhZOE7TUJvH5k+CHhp+rk7a64239W1DNVmfNmDQD9DgyzyHgKaHhbGLrhiA3dsNv
	wE25Zqt1yQQ8Ioub2dIjtZQBjnJk3SHds5Wvd5LhT8u1FgNKcdYEMubKGxyygbs5jYnmw8naEtHEV
	dQgcREFyYTxJtoZzp/26CLPUllJ6VvxK6641PbFHWh+kHABh8sBbpjEswXl2NHNjOQagegnk+8p+i
	7laXW1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx0S-0000000B7J1-17Ya;
	Thu, 19 Nov 2026 07:56:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx0O-0000000B7IF-2Czg
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 07:56:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e9d7791b00so20331265ad.0
        for <ath11k@lists.infradead.org>; Wed, 18 Nov 2026 23:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795074987; x=1795679787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zD4vWVrzj0m5l3wwaVzmZX6fctqf45aDG3D9ksl4C6c=;
        b=dEjgIL5n7/PXsyNA3XvZclqpcmmHf3IkqmXgn2s6W3Ba/Kj1QpyNVgkK/TGbwQbG6V
         GlhwVtamZUrht1+pO5xKOM6TB1V2taHHtJ/MP/sJw8J/hBIOyiZx4ZdTfh1dUqNuLO3n
         Lw+NpYcwoffD9X2Q3nndVS6a9dDeDcJwM2gj/TeJaQyepyM3knNSpeXJlN96lCfo77HR
         QUpXFJZmps/7SyczXH+FKxAAkGcpqOrWftrg6AzZGf3Rh/rOm/HwuAsYEQpWrssLryBe
         /bVD/I5fnyVBb+jWGh3Lhd3KXCu+EnuRdRIWad+B4OUntmKOMVhqwNyGGCygrxJHTEFi
         7y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074987; x=1795679787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zD4vWVrzj0m5l3wwaVzmZX6fctqf45aDG3D9ksl4C6c=;
        b=pwe5NZZYqovqf4+I/u4yXeiypYfpCBFUG+rjQ1NOQwatrFonCN74L6xlatzSs7B3sa
         dx73vphIa8FtC9qi7nAigWw9M2XF7g1sFVg4SZZzxaZmHUmjPTQUunT84yepJt2a8FSw
         eAYI0ocQD10JaNidkTv1JPxhgBcVdqZqi4r7sm2Y5gDNRyTPRrJ9/Vta8HeyJvd4Pb4M
         RQxmla3bMvhdjNxmrdsXIFK5uCPXAJ0vU7+h+m7NqgqN6SmRskmnNobR45QobOXjiZSl
         N3nMqZ1OToyeC2phI2keafVnfVBZ+e03pmQnOj34vr7wMqVWHLo0vrLyAl0SDbegH1UQ
         GHAA==
X-Forwarded-Encrypted: i=1; AL+hErHcjRDY2mk/MHn9jPJ+8JEHfB3bs4DVeJ5fnHPY/eSSO4oZ0YCiubDN+Jz+nGXW9MoEMkXoQ9Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z8u2qZ5yCDhebA5ohDW28/7ZYQX9GeGiBMmgAugQZZQWiMYVTgT
	J9NvHKDVFGZFk507fKTcSXstxtXjMXxTNCWKnLPuPWmGc95idqalgSWbS0C3RgYqHZs=
X-Gm-Gg: AZFdTZeFxMSzfnKRRmFT0Bl10nJAlfipQIOZKMrvdPYnTxEguAmT9l3OcfvdbKstGmW
	eC02xFBkUpk6m4cLA5DtwxYU66SjAyhuHapKIvHADn8FgNIM1t2/TmATG6Zgp/KLAxUXfcFONeM
	HBOAbdV3Fk+uTnZ5EXFkwuuMtT4wUotO9GAbVBWzWCC7nYK3s4B72Ql/tYylNAqViNW6BLeinFn
	hLAm9XXrl8L6gHVtQVpJy03s64Jm+AUnNm+jj0lN1LudgLZ1vG3Y/Vvqcqon+4TApg9BiQM8aF0
	rbcXI3mq0oRqNcPdKSwYHkTqIQB/tahDwXelQTZ8UOKB6NAdyP4Kg406umD9n/SlzTMzApn7Wc+
	YfzeQMS0Gc0SzvtvHBOXut6t6Sz4p5q5TmRQDWiMDgJwM2H3vc0bWqk97BwD5LnL2dc6mPzbQGN
	1dKpLtEc7lq5JNJcMiLklXB6zK9vi2jFArjKxMco1l2mFVFUYp8r7QAkzmZshLk2krCrb4ZAmhn
	96U2vAcGF8FVp1TjfI7mCwEPgj8UCgFyTD/ORH3c965yn6M/WK62M8ieXhHM5ePPgVHY6oGps2k
	+hu9s8h53Jzp+kyPd/ItDx0XFXLOYZCFF+clbApZ2shiqK97wD04ezPkThmu
X-Received: by 2002:a17:902:ea03:b0:2df:90d4:7758 with SMTP id d9443c01a7336-2eff72f4385mr44649885ad.23.1795074987036;
        Wed, 18 Nov 2026 23:56:27 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:84c0:a687:3d35:47b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6183f8csm25817825ad.31.2026.11.18.23.56.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:56:26 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current] wifi: ath11k: fail the start when a service ready event fails
Date: Thu, 19 Nov 2026 15:55:59 +0800
Message-ID: <20261119075559.10177-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235628_579455_60CE7617 
X-CRM114-Status: GOOD (  15.37  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_core_start() waits for the service ready handshake, in which the
firmware sends SERVICE_READY, SERVICE_READY_EXT and, if it supports it,
SERVICE_READY_EXT2. Only the last of these events completes the wait,
whenever its own TLVs parse, so the start goes on after an earlier event
failed (for example, on -ENOMEM or a malformed TLV), with capabilities
that were only partly extracted. An event that arrives again, even after
the start, is handled again and rewrites the capabilities under a
running driver.

Track the next service ready event that this start accepts. Each handler
takes only its own event in turn, closes the handshake before parsing
and opens it for the next event only on success. A failed event then
makes ath11k_wmi_wait_for_service_ready() time out, and any event out of
turn, including one after the handshake completed, is ignored.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Fixes: bd6478559e27 ("ath11k: Add direct buffer ring support")
Cc: stable@vger.kernel.org # needs adjustments for <= 6.1
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in a QEMU guest with KASAN and a test hook
that feeds service ready events to a synthetic device: without this
change the start completed after a failed SERVICE_READY or
SERVICE_READY_EXT, and duplicate or out-of-turn events were parsed again
after the handshake; with it the failed start timed out and those events
were dropped before parsing.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/ath/ath11k/wmi.c | 22 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h |  9 +++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e..5f9b18338478 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -612,6 +612,11 @@ static int ath11k_service_ready_event(struct ath11k_base *ab, struct sk_buff *sk
 	struct wmi_tlv_svc_ready_parse svc_ready = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH11K_WMI_SVC_RDY)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_NONE;
+
 	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath11k_wmi_tlv_svc_rdy_parse,
 				  &svc_ready);
@@ -622,6 +627,8 @@ static int ath11k_service_ready_event(struct ath11k_base *ab, struct sk_buff *sk
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event service ready");
 
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_EXT;
+
 	return 0;
 }
 
@@ -5118,6 +5125,11 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 	struct wmi_tlv_svc_rdy_ext_parse svc_rdy_ext = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH11K_WMI_SVC_RDY_EXT)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_NONE;
+
 	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath11k_wmi_tlv_svc_rdy_ext_parse,
 				  &svc_rdy_ext);
@@ -5128,7 +5140,9 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event service ready ext");
 
-	if (!test_bit(WMI_TLV_SERVICE_EXT2_MSG, ab->wmi_ab.svc_map))
+	if (test_bit(WMI_TLV_SERVICE_EXT2_MSG, ab->wmi_ab.svc_map))
+		ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_EXT2;
+	else
 		complete(&ab->wmi_ab.service_ready);
 
 	kfree(svc_rdy_ext.mac_phy_caps);
@@ -5180,6 +5194,11 @@ static int ath11k_service_ready_ext2_event(struct ath11k_base *ab,
 	struct wmi_tlv_svc_rdy_ext2_parse svc_rdy_ext2 = { };
 	int ret;
 
+	if (ab->wmi_ab.svc_rdy_next != ATH11K_WMI_SVC_RDY_EXT2)
+		return -EPROTO;
+
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY_NONE;
+
 	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
 				  ath11k_wmi_tlv_svc_rdy_ext2_parse,
 				  &svc_rdy_ext2);
@@ -9315,6 +9334,7 @@ int ath11k_wmi_attach(struct ath11k_base *ab)
 	/* TODO: Init remaining wmi soc resources required */
 	init_completion(&ab->wmi_ab.service_ready);
 	init_completion(&ab->wmi_ab.unified_ready);
+	ab->wmi_ab.svc_rdy_next = ATH11K_WMI_SVC_RDY;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b2dade0516ac..c69037c8a114 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -5849,6 +5849,13 @@ struct wmi_peer_sta_ps_state_chg_event {
 	u32 peer_ps_timestamp;
 } __packed;
 
+enum ath11k_wmi_svc_rdy {
+	ATH11K_WMI_SVC_RDY_NONE,
+	ATH11K_WMI_SVC_RDY,
+	ATH11K_WMI_SVC_RDY_EXT,
+	ATH11K_WMI_SVC_RDY_EXT2,
+};
+
 struct ath11k_wmi_base {
 	struct ath11k_base *ab;
 	struct ath11k_pdev_wmi wmi[MAX_RADIOS];
@@ -5857,6 +5864,8 @@ struct ath11k_wmi_base {
 
 	struct completion service_ready;
 	struct completion unified_ready;
+	/* Next service ready event this start accepts */
+	enum ath11k_wmi_svc_rdy svc_rdy_next;
 	DECLARE_BITMAP(svc_map, WMI_MAX_EXT2_SERVICE);
 	wait_queue_head_t tx_credits_wq;
 	u32 num_mem_chunks;

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.1


