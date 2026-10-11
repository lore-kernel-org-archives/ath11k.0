Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70063CA9EC7
	for <ath11k@archiver.kernel.org>; Sun, 11 Oct 2026 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pzss4JcabUItox2qeyTRJ/af2NkdjCKndfZJuFTzwT4=; b=J2jBRik1hKCamgw3oN1q50KL+c
	H8TsrMkEc4xDz4uDAKw3Ol9OYh0Bne2VNLgL5tEw6bd8c0PJwCzHtor5P+3g+ZzsI8hb6IVgTqSSJ
	Je+4iS3vmxE05RhFGISBiFMCsYpjtXUOZbTLCGuETElfgd1M55T5qaNxn5cP+hI5f8wuwZVG0YzrF
	Zlqu/Up7CqZGuQH//WxjOFE0yA7syQOS46IpLcnOlDGYxLI8VA0tzxC59nfq0/ihjNOgGTikyY+zd
	H+CczyzcEZf+7q0v9TuzRyEQADPGayFl1EXfiD0fL0RHXKrk6t0JFnQ6VjQP2WvdKamKiLiHDhgV5
	960hqxKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsnE-000000090WY-1k7c;
	Sun, 11 Oct 2026 12:36:44 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsn8-000000090VL-41mI
	for ath11k@lists.infradead.org;
	Sun, 11 Oct 2026 12:36:42 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6af9cc73235so239913a12.0
        for <ath11k@lists.infradead.org>; Sun, 11 Oct 2026 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791722195; x=1792326995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzss4JcabUItox2qeyTRJ/af2NkdjCKndfZJuFTzwT4=;
        b=Y0D3fh1qtIiweOnHIJ/xgN5w3RzABwFKCA2Ozh8ETqhIsYWlY92Sh/NBFQhgFeNckj
         5cXDLe4kH2pQ1w+Jy73HaSeU/TpQntyJbMxhI2YvLJF43A1tWeKHtrVEnbVUeKbBqGEb
         tG/u4I1Iu+jLybCPFT5sGwvQPeKzl2rTMFIXA0ksJO65LtRxT2Ie7hGLg6gZXU5vGudG
         vNSpiwQQYDOCdGYONeO1WZe8Qnxj+ei5iTsuI/hga3ZftAXP13gn7VwkPfpaOOgL2gEl
         nfr0w66o88ejfHmcBKqYPQu4EGJrM2VJ0tzMk2CHMzQ2Zf9Xngnj6mkujPnBRpLWYzUz
         MwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791722195; x=1792326995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzss4JcabUItox2qeyTRJ/af2NkdjCKndfZJuFTzwT4=;
        b=Hg5Qlk6ujwXzSShXxK0W8d3kGyEBqqjKZ9eFoGNaV+Of7O5d6MNHhHezPu9aqlNNXV
         gikFwNUI+qe9Zv+EMh1yHyTIUWusex/pDlbiOTVyGFLZbsyn3kGw0CV8ASaNwcxUNbf0
         WW6RPMN/yCQUp1oylBj86ER/PeW8nEUIDDzkoO/toYmNUnCQ9oOZD+XthnVrhudeGJRz
         uNOBoNuRPw+PjfCtah3ihLe5vbAQ3uZm1UrHfKnaybKL4ImHt2L8LG8oXTETyqBfnZnj
         asM8lEIgWz7xkndQjc+KShnPY+YsaLoSr3nvbGdIaVvhvG1Kad1wpdLYPVVwbqAD+YWO
         nLZg==
X-Gm-Message-State: AFq9FYJKQr6/DPt5ubw1wy6CEE3pFJoIRQzV16bPeLIHURHLKNej05NR
	m4SsmtSwpr/vDg3D7vLUleKrdWvGRBTqRY+jtGGUzDKl/gnZttMnkytDlRuHz4qE/7E5FlTlAXp
	EOoQpeW6I
X-Gm-Gg: AYBFou2tD3WmZux57xZViyr8JqspDBNGBPnaBP7qs8/z0wWWU4xijWePP170YA87MPn
	5EehC4rESPxJWg/2dxc2/zTSWbkHyJz1ROhoJ9SLj/RJtv1tm0k0wfYjXtpZqEhiQl0Ojx8Fin2
	cZBBm7AjbDc8uMQFlxvLQAsdO0JA5crlnvkyU1i2/0Elcya2XCOLHe3UL8Y4X6ePdSgln+USBxJ
	vxb1OuaGGYiRERp8yIFuA65HzE1Mq2BE6f22p4RIJ2NytL3TqPU7XXvI+6qhYHNY2gmdTI49dl9
	FxVTGf6EOBL+0ELGsY+Hvpr50sl3D+3/HHeECZLE5Va7oTGvbBZP97mhNZ8twFi1+k5bURB+sp/
	2LTOSoZ1H2/gkpgseisY4w89V5mBcJw8UOMT+9xVHiBl+5lhGf6r1lcDJModwuf5EhDTDe+5ZT2
	I5NDx4/Q12zUK8aXjSjbgPS6idawRME7XpZ7kw6sIycTGXgiSIhohTkLWuedIF9NdtG6ADpnp2z
	VjLqM7060kDMzh5DmaGEonogZPxBBP6qxlfs0W/vv3SsSFY8Durmoqok7+UFDFUti3dR9KeyKFk
	6RiBauRcRs1j0k/ivYcJhIjYXKvus7Khhk0cmnLq5AICfJj0/AZJXIf7EUOjwSm99Q1CWwQiawt
	Lv4lHDUXX/hyWOw10E9uA8Sj/1rH9Uy5TjkznpRuBEXxk5e8WSUc/nD1I3N4NL7/Bpton/EzmFB
	3pCzOB/w==
X-Received: by 2002:a17:907:6d19:b0:c31:6a37:f281 with SMTP id a640c23a62f3a-c31a9a28baemr762386066b.2.1791722195363;
        Sun, 11 Oct 2026 05:36:35 -0700 (PDT)
Received: from Desktop.fritz.box ([217.26.236.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c344ab1453bsm59920966b.67.2026.10.11.05.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:36:34 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: apply the 160 MHz NSS ratio to the radio
Date: Sun, 11 Oct 2026 14:36:30 +0200
Message-ID: <20261011123631.1664734-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_053639_047708_95677805 
X-CRM114-Status: GOOD (  10.68  )
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

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
On a Xiaomi AX3600 (IPQ8071A, 4-chain 5 GHz radio, firmware reports
WMI_NSS_RATIO_1BY2_NSS), `iw phy` lists 4 streams in the HE 160 MHz
MCS sets without this patch and 2 with it.

 drivers/net/wireless/ath/ath11k/mac.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c1fa42edd3630..6cd163cab9bd7 100644
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


