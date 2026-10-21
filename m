Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F69F606A31B
	for <ath11k@archiver.kernel.org>; Wed, 21 Oct 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0f8wfxSh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eCLwWbS2;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=MjwD6rc5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXmyT257j9HWX6yMLjeKjbshvliT1svS1XMIFan8Qm4=; b=0f8wfxShkynt9SF/C0YT7iwOKW
	zG5o9jJ4vBQ1bFmyThK74Gs4MM+w+OILSQHQj0ureT5eMnniJj1FTeqfH0xgVRTDGlwYSZUzMYw2i
	JlG6Za673+VGGei1Xa1AiviRhTH9ANLzX9kdcumGD0CM5t+gCluKN2ucaA/gYx61VXxZSI4kQjTCZ
	n//YDUzjAo85s6No0bq8uetFGETVXoVPRHXp3WC3OHP57w4s/wFk5EZ2pwYQgJzGDbv0MuggJXa8D
	sJOX8qjqfg0qIqz6og/9oUHR4GRRt1fxn0Nw9GaVoGSh/9aJGIw4/Y3YJ7V5+bztu11QK7QynAzvN
	uiWR5dqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXW-0000000CTIz-0VTW;
	Wed, 21 Oct 2026 16:51:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZXU-0000000CTHN-3B1U
	for ath11k@bombadil.infradead.org;
	Wed, 21 Oct 2026 16:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JXmyT257j9HWX6yMLjeKjbshvliT1svS1XMIFan8Qm4=; b=eCLwWbS2c6ut7xOpPDjpJ7YT1/
	U7O+nf9PIbigMlg5aPBDUZ4SLMawv793jy+GMrLnlfkSjeV9ikmRkic52n1KjIlL6mfrAKYp/+HRL
	M5JDe1BYDkdafL7PI2ght25zi5foiFLWzBje82/3UNcigPUh0o/WwF8eZoKtRlWEV8FJ61p3ZHidI
	5wqSEqNnt4gTvZSbAZWqzrhMtGh7x1ygds8nq/WFA3lldKh+DEARqVyFswjwM7GZjQilmED4h2u76
	4cUWn8e9i8iwFuiP6LZOBqhoudMeWcVxAIwZ8GgJdWBKtaG6yOHSbGc2ggUGoDhQ8ozRtpYNv3tDm
	DlvPgH2w==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJZXR-000000062SF-3PGO
	for ath11k@lists.infradead.org;
	Wed, 21 Oct 2026 16:51:43 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c2055573c8cso120911966b.3
        for <ath11k@lists.infradead.org>; Wed, 21 Oct 2026 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792601499; x=1793206299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXmyT257j9HWX6yMLjeKjbshvliT1svS1XMIFan8Qm4=;
        b=MjwD6rc576RWWQn+qU/etbZqaTpYE7fDnxP+hhEg5ubqBpdDOAvi4a3NB7y57vY9Pu
         Z8FRaUJoibhoWybucjG7GlLcPor7xtHDTpABZLbs9eUMj+rUHw1ddzz6jNDWqvae4VxW
         aX6Q7jiin/PvtZHuZDsNi5bo+x7Yl+JcfsTuVryjc1JXIFJtlYUZ3dFBYLUjq9Y3ieaT
         3E48RcHxkzoVDX/aV+C9SngMyDn9ujrR7bLNKSMszuGixFrIAqzjNIqg4HDpNxK8Z0+H
         BMVkPkgbj1QAy44DFZYGBE733cbzSdFI7ow1DYTrENRIh6EL1spze+pCqRjA6NZDODrt
         MlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601499; x=1793206299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXmyT257j9HWX6yMLjeKjbshvliT1svS1XMIFan8Qm4=;
        b=t/twVHmKiuHATGEwFjOATBw080djVrjIEecHC1fcIk7HcHgM67IP7EXPTentggHzM8
         awNfsy3ZTycWN8gf1VYJBsaiJcC70F1t9WLKdhw/6WKUEOLtlL9YBq3uqWEXH3Orfqrb
         plP7KssOw91czuQeeaNZI0LeVwdRMKjUYar2WOCkKXupW34Yie2vhaOeG1nOajdP+49I
         3W9dEU+ppYSnKeBh45CQfGHudi94SQ2sFA176vrkRYpYeBBp4WxRRJdcQ6FthSrFNkIN
         PKle7fRLSmAQfh9g5b0m/5dzg+wwW0u02O0OkzXm2NcQpgLeYE+ScJ95StzTjTx8mdkL
         xHxg==
X-Forwarded-Encrypted: i=1; AKwUvBwNyH40cpvbaPLlLiV4KzMjc9TaRhap9vl7cgHb/qD2MS41KW7kwZIP4X5Qm+pvYT9uuGrZGRU=@lists.infradead.org
X-Gm-Message-State: AFq9FYKrBPt9DdkNjLGRvHzJKzBWhsq5OvwFuyIgvHUXZVEz0clnBNv2
	dRmo9dD4pZsk3WYYcZJ4dbjgZHd4HY4tLksDdwOfW1thf4a9gQSTaUchtqAC7wwCnA==
X-Gm-Gg: AYBFou0bSw43jxDqX402SgUtecMJtH+2ZjeTac2lb8UOrY8iE12F1qgDFwNiKBGXIqb
	QWyTMCJ+Xyh4BtUgJHlEOlvxMhAtXkm8hibzjkAwYVQvbHPGxFOHLKKvBbl3ry2u062oyrb8aKp
	bZBdb+Kh6dpf1f5keyiLbJ+FKnlbL33atxp9dZfVnLBvf05FCK2y0Ywnji7B+S1bdMY9xhG4esa
	DZQgQI9kEulKiGr8aRqxNsCuT4Qhl7GOWLgZ3/mV56UYewG3MjwjNWZYko39VBCBM2fX8ofC5uo
	fE6RS9TnOKM1yZIUGMrjIT1oiMlovkAvcd3u+idec4XmtMJnbEbBBkHK3lMRyCHYQeSMcKYdMh5
	voLP1HsD/Q2/Tfg0BA4UYoIycGJXjDga3zv8pccVAUWUH8l4FOtmsKIB8mPiR4Xy8iwTBWIzu7B
	y3Ytk8T6ZYA+9uZ2NeA2rQtgJEpGBnqJ/PnDzdGn4alqHJJPi3O0ewbOUsaIzpnibHPZBFARE+f
	9LTJN0hk6WlJoHBhfY8NJoRnY89itdRXvUMbX+TYIPzqGfnQLiPm2QVpDoVi86leKvXvse0xF1F
	XKz7PzRD5fpB20D2g3vOBj8e5JYuhOzUsBM0rP7afLtyLfylVceRWP8RCZCPS10ys+fm57JIay+
	S2HTs7YoEOWmB7WEr87yQJyBS93jYEL2GdFyLTvDKa6ASHLRogFPrXgdREs+dOIEGp4hq00BU3z
	gyk/F6A9HOdH83VQZ6bx749Rdvg8lNZyx71mIBmeV22x6QSwggWLsHPjtXgRrJ0s20
X-Received: by 2002:a17:907:9604:b0:c29:555e:bf2 with SMTP id a640c23a62f3a-c46799c8dc9mr242364766b.41.1792601499598;
        Wed, 21 Oct 2026 09:51:39 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.223.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5de48esm20782466b.66.2026.10.21.09.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:51:39 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: rameshkumar.sundaram@oss.qualcomm.com,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: ath11k: apply the 160 MHz NSS ratio to the radio
Date: Wed, 21 Oct 2026 18:51:37 +0200
Message-ID: <20261021165138.388593-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021165138.388593-1-julius@bairaktaris.de>
References: <20261021165138.388593-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_175141_969458_568E6D38 
X-CRM114-Status: GOOD (  12.63  )
X-Spam-Score: -0.2 (/)
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
its 80 MHz NSS. Peer assoc applies that ratio to the peer's NSS instead,
so on a radio with a 1:2 ratio a two-stream peer is sent one stream at
160 MHz. The HE 160 and 80+80 MCS maps copy the 80 MHz map, so a
4-chain radio with that ratio offers 4 streams at 160 MHz where it
supports 2.

Take the 160 MHz NSS from the radio's TX chains, as ath12k does since
commit a82ce08775bc ("wifi: ath12k: add extended NSS bandwidth support
for 160 MHz"), and limit the 160 and 80+80 MCS maps to the ratio when
the firmware reports one.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: f552d6fd2f27 ("ath11k: add support for 80P80 and 160 MHz bandwidth")
Assisted-by: LLM
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..a842306d65d9c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2278,7 +2278,7 @@ static void ath11k_peer_assoc_h_vht(struct ath11k *ar,
 
 	if (arg->peer_phymode == MODE_11AC_VHT160 ||
 	    arg->peer_phymode == MODE_11AC_VHT80_80) {
-		tx_nss = ath11k_get_nss_160mhz(ar, max_nss);
+		tx_nss = ath11k_get_nss_160mhz(ar, ar->num_tx_chains);
 		rx_nss = min(arg->peer_nss, tx_nss);
 		arg->peer_bw_rxnss_override = ATH11K_BW_NSS_MAP_ENABLE;
 
@@ -2588,7 +2588,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 
 	if (arg->peer_phymode == MODE_11AX_HE160 ||
 	    arg->peer_phymode == MODE_11AX_HE80_80) {
-		tx_nss = ath11k_get_nss_160mhz(ar, max_nss);
+		tx_nss = ath11k_get_nss_160mhz(ar, ar->num_tx_chains);
 		rx_nss = min(arg->peer_nss, tx_nss);
 		arg->peer_bw_rxnss_override = ATH11K_BW_NSS_MAP_ENABLE;
 
@@ -5940,7 +5940,7 @@ static void ath11k_mac_set_hemcsmap(struct ath11k *ar,
 				    struct ieee80211_sta_he_cap *he_cap,
 				    int band)
 {
-	u16 txmcs_map, rxmcs_map;
+	u16 txmcs_map, rxmcs_map, txmcs_map_160, rxmcs_map_160;
 	u32 i;
 
 	rxmcs_map = 0;
@@ -5958,18 +5958,28 @@ static void ath11k_mac_set_hemcsmap(struct ath11k *ar,
 		else
 			rxmcs_map |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
 	}
+
+	txmcs_map_160 = txmcs_map;
+	rxmcs_map_160 = rxmcs_map;
+	if (cap->nss_ratio_enabled) {
+		for (i = ath11k_get_nss_160mhz(ar, ar->num_tx_chains); i < 8; i++)
+			txmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+		for (i = ath11k_get_nss_160mhz(ar, ar->num_rx_chains); i < 8; i++)
+			rxmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+	}
+
 	he_cap->he_mcs_nss_supp.rx_mcs_80 =
 		cpu_to_le16(rxmcs_map & 0xffff);
 	he_cap->he_mcs_nss_supp.tx_mcs_80 =
 		cpu_to_le16(txmcs_map & 0xffff);
 	he_cap->he_mcs_nss_supp.rx_mcs_160 =
-		cpu_to_le16(rxmcs_map & 0xffff);
+		cpu_to_le16(rxmcs_map_160);
 	he_cap->he_mcs_nss_supp.tx_mcs_160 =
-		cpu_to_le16(txmcs_map & 0xffff);
+		cpu_to_le16(txmcs_map_160);
 	he_cap->he_mcs_nss_supp.rx_mcs_80p80 =
-		cpu_to_le16(rxmcs_map & 0xffff);
+		cpu_to_le16(rxmcs_map_160);
 	he_cap->he_mcs_nss_supp.tx_mcs_80p80 =
-		cpu_to_le16(txmcs_map & 0xffff);
+		cpu_to_le16(txmcs_map_160);
 }
 
 static int ath11k_mac_copy_he_cap(struct ath11k *ar,
-- 
2.53.0


