Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815F1C4332F
	for <ath11k@archiver.kernel.org>; Thu, 29 Dec 2022 07:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1PK9TRjRhVU/5Y1zEjU95R6jVp7kgEeDP8mJDzXwQ7o=; b=aGdTzgHYPliym8
	qyaUHfLkUDA4p/JxJV989NJDuVXaSeJ5CnjsyGhPcUUcdzBovK3QcvwHVDIobhE2qsxjFyOiRfd5P
	DeZkx01wFwy79M71/vyPXwcVNNkl9ZD0cH1TTZKfukt2mwLJCrjiBCPFTC2hOpPt4Q9/fc/p95hGs
	auJKYKrkMohL71hKdovanPRtT2rAUOeL6g5+9zOGhpxvOXDMvDmUrpogv43f22bM5rSswS0bssmGI
	UlRxV2CxcRsDR2px2MaEprh9gIupd6psTlvQOMnDJtDREAkvyWlQ22AE7YsYKtw2KNF5kEruImNqX
	jwCrOxVujn1MMBO6BPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAnVH-00DLDu-8G; Thu, 29 Dec 2022 07:39:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAnVE-00DLAT-Dn
	for ath11k@lists.infradead.org; Thu, 29 Dec 2022 07:39:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id 124so12176372pfy.0
        for <ath11k@lists.infradead.org>; Wed, 28 Dec 2022 23:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQszMWeXFPAfmDJi4sx+8Hf/q+9+cLOONIJyAQ7Rc8E=;
        b=V2xfjPRuzPwskYbvlUUr5aTd84JZ1LVV8WNm9c/hLcgcMTOQqDEmf8KlhkO8wRck8q
         AwhjEutQlv3Uu+uLoV8+F2CdXQxG1aEqg+4tFI5ne2UxiLYPyrKfZGG5Z0Fejw6sUE/c
         1z5m3FS2I7M027yFST77lTeTNNUJe3Eu/Lwly2fDXd9jbZzdr+k11oMRATpYktv22ZlK
         RUOoDlclkWU+nzDMp1a0cGTBV0krvCVw+oTF7F5E+LGQ5PKbIxA7GqZ5b9l60E4TwNHD
         9WDAQxQXQ4vCXENwZ+smJsrRNNjosZCCnaqalIobNRcricZjpcMiFcxNAMwokSJfySjD
         oKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQszMWeXFPAfmDJi4sx+8Hf/q+9+cLOONIJyAQ7Rc8E=;
        b=Qbwsaz6FYFbj4tOdG/RS+4tazKsIwS+JEZSvroq1iT+PfpaljVGAS6zLhcFFAHGKDs
         5IWifR09aerlkthV9KxdLiJjQsYVzvkMqqrYoaU+uszBO2r4WflFRgf9BQhMPyR16i9u
         Wl53V+zjI2H7JDfXKDUO+rggoH3K24Ws+4NATA//P1TWBYp+VBWfH0eDpX7Oz+Do54vb
         XWFJqcy8FsNCzyvu4AQYL8lbNCRlym1Z9eKmCDwwxA3jmkl9kpKyzDyEEmXs30iYX38x
         7spHyp9LxtdOlkQI+9AcEI5HxmoIUv7JzefvPc7LA5ogC7B9WHiSc/OG6l/vR5fXQ6VL
         7Zjg==
X-Gm-Message-State: AFqh2kqcMq/fSSbPsfXP+l45XbOVJz0jM2Qiu7ayvJkBxLW/mT00lEWJ
	betaM2mIf1iSWVxv32rHFeM+MLUFS6XFxOvE
X-Google-Smtp-Source: AMrXdXvPDVBuXn3kzD5VMsb/0gEzdxL2d7QvYlr8LvCQGlr86hiYvkno2m/X49UBYdfgCoiuK7KsTA==
X-Received: by 2002:aa7:8502:0:b0:576:a500:2c7c with SMTP id v2-20020aa78502000000b00576a5002c7cmr45101601pfn.27.1672299538685;
        Wed, 28 Dec 2022 23:38:58 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id y17-20020a626411000000b00575b6d7c458sm11401168pfb.21.2022.12.28.23.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 23:38:58 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Manikanta Pubbisetty <mpubbise@codeaurora.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] wifi: ath11k: Fix memory leak in ath11k_peer_rx_frag_setup
Date: Thu, 29 Dec 2022 11:38:48 +0400
Message-Id: <20221229073849.1388315-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_233900_514393_83BE4439 
X-CRM114-Status: GOOD (  10.87  )
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

crypto_alloc_shash() allocates resources, which should be released by
crypto_free_shash(). When ath11k_peer_find() fails, there has memory
leak. Move crypto_alloc_shash() after ath11k_peer_find() to fix this.

Fixes: 243874c64c81 ("ath11k: handle RX fragments")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c5a4c34d7749..1297caa2b09a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3116,10 +3116,6 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
 	struct dp_rx_tid *rx_tid;
 	int i;
 
-	tfm = crypto_alloc_shash("michael_mic", 0, 0);
-	if (IS_ERR(tfm))
-		return PTR_ERR(tfm);
-
 	spin_lock_bh(&ab->base_lock);
 
 	peer = ath11k_peer_find(ab, vdev_id, peer_mac);
@@ -3129,6 +3125,10 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
 		return -ENOENT;
 	}
 
+	tfm = crypto_alloc_shash("michael_mic", 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
 	for (i = 0; i <= IEEE80211_NUM_TIDS; i++) {
 		rx_tid = &peer->rx_tid[i];
 		rx_tid->ab = ab;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
