Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F407CC38A02
	for <ath11k@archiver.kernel.org>; Mon, 31 Oct 2022 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7/KTcSJKdw7RAiqhLzLX4ouioxFCTLKlLPol/OOp/+M=; b=K+tABm6egO3/3U
	qZ9V9xuWeXr6Db/1ANOd7yM8T5VNO2T/wyQuRK5Czk/yEiZU2JdlR3KbVUPhDtGYA6Q0E/nxKVtu3
	gohWG4gbbywGimdz/VqqyA9tLVeUcboaBeZTZJ142AbrRSpUZjOHfbPuSZXUXWtIOLgvodIFBkVW4
	h8eG1Z/WDxQz5oCvveeJA65AREBbYsI8yDjboDZj5g7X1vZk2V3xH67t3GRhvlnPH5MUY8zE+08LQ
	7u8O+ktKb7hs/5FqufRZTWrvT+6gwBU8C1gMaV/mGso5cz5FWz30ZXvaX+1QkKLJCyZO6jbgC3F9c
	NU1rlk1LL4R6Q1BurMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTCp-00BL8Z-LI; Mon, 31 Oct 2022 11:43:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTCm-00BL5n-IF
	for ath11k@lists.infradead.org; Mon, 31 Oct 2022 11:43:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 96F32B815E8;
	Mon, 31 Oct 2022 11:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DD8C433C1;
	Mon, 31 Oct 2022 11:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667216625;
	bh=7CgMWQKsHtTPXkZqm7iC2oNhmPIigVqj/vJZBx2o4xg=;
	h=From:To:Cc:Subject:Date:From;
	b=TapGG1cj/MNNBx3Qa2teCF20AMx1UBkTPTwClP7Q/KpQFgnt4NM+sbJ3FL2VaGB26
	 t5nMsH/23wFoUzUAFu92sc83IHmkcmwrHEq1wpAzudldQD6tL+A+gYWAoQHRRAEAuu
	 4MGxdDKnRp1SkCh9bflpkd2ix0K5qWVr/04Aj1nsoxWGdfRErg1QeDfxYlXnE4IC6l
	 WhR+n7CahsIZARz57uccJaeGqN6Y7c6vEq+2A204LUFS5MAzK2O7avnVbTtnos8Onk
	 9w61rP4t6wavtcmvmPIPfU0r957YQ0QPMeXyRbNFE7v9GUZ0ZaXwGBqFcJyxDFj3rp
	 iSo1C0Tof/1jg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: kvalo@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Martin Liska <mliska@suse.cz>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] ath11k (gcc13): synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
Date: Mon, 31 Oct 2022 12:43:41 +0100
Message-Id: <20221031114341.10377-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_044348_785804_D4838909 
X-CRM114-Status: GOOD (  11.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

ath11k_mac_he_gi_to_nl80211_he_gi() generates a valid warning with gcc-13:
  drivers/net/wireless/ath/ath11k/mac.c:321:20: error: conflicting types for 'ath11k_mac_he_gi_to_nl80211_he_gi' due to enum/integer mismatch; have 'enum nl80211_he_gi(u8)'
  drivers/net/wireless/ath/ath11k/mac.h:166:5: note: previous declaration of 'ath11k_mac_he_gi_to_nl80211_he_gi' with type 'u32(u8)'

I.e. the type of the return value ath11k_mac_he_gi_to_nl80211_he_gi() in
the declaration is u32, while the definition spells enum nl80211_he_gi.
Synchronize them to the latter.

Cc: Martin Liska <mliska@suse.cz>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
 drivers/net/wireless/ath/ath11k/mac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 2a0d3afb0c99..0231783ad754 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -163,7 +163,7 @@ void ath11k_mac_drain_tx(struct ath11k *ar);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-u32 ath11k_mac_he_gi_to_nl80211_he_gi(u8 sgi);
+enum nl80211_he_gi ath11k_mac_he_gi_to_nl80211_he_gi(u8 sgi);
 enum nl80211_he_ru_alloc ath11k_mac_phy_he_ru_to_nl80211_he_ru_alloc(u16 ru_phy);
 enum nl80211_he_ru_alloc ath11k_mac_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones);
 enum ath11k_supported_bw ath11k_mac_mac80211_bw_to_ath11k_bw(enum rate_info_bw bw);
-- 
2.38.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
