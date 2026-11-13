Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173CD606A321
	for <ath11k@archiver.kernel.org>; Fri, 13 Nov 2026 04:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eH6gujR2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRIFTipy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5pTCbeuMBw4mtr39j3WfpOFFcKqtGe3X/Jp0q87wrlE=; b=eH6gujR2hRG5txRe2E7E/eKVWQ
	spbz6mTTVzUn00xre0tFrXznM+V9vfKQ5YavxgtDtJrGPbLeHIbwRe9ZImavoC1PMIWyz/H6z4mCE
	9ciycZvm/ZC6YC8N/cogRJWiIsSug8DcmUAz0+G5zdMnOoY5dEyALDNgBHmGb6dZyMDL0G4c/Fk4J
	n7TNZYdC1BcVLW7eGnaZ0GFxZXq2BLtScuFnv8wbKs3rewggV3CyPvSaPDAAbk9osdG+AU+Lt6YT2
	TCcU/T4/gfIKZORRAqfZE5xQVdmVgWcV1vfCSKtP9Qv0Z/wc/DmKRm4f5Ws6g6MEVrqWuz9bcyV60
	1bp11XZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRj3P-0000000Be6q-0inr;
	Fri, 13 Nov 2026 04:38:23 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRj3M-0000000Be6X-3IjS
	for ath11k@lists.infradead.org;
	Fri, 13 Nov 2026 04:38:22 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-91f2b826fe9so28126d6.1
        for <ath11k@lists.infradead.org>; Thu, 12 Nov 2026 20:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794544699; x=1795149499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pTCbeuMBw4mtr39j3WfpOFFcKqtGe3X/Jp0q87wrlE=;
        b=CRIFTipyVEJiJE6Py3VNUtaqw1O3+eSVJiLBMyOjPN3L+vu9O6jAhnSy3aigNvYYme
         HS8z03RvMojOBJeRO7QZyq50l1zuS5nUzeDBVN6ewkNJI+9sFje/+H//9VYWDLBYmWe9
         leQdrkpsvi3aiFROEFQezr6FOk8e+8NaMnLdSjEU2KAAC2OZXCGz1B+2TFjeGxuBZuG4
         2J5NeolD3SmgGC4h2zqmAxFu+0kYKyy+R+C5bYPlT+O6UDPd3kfp7jmjER6dAl36gm6f
         FHyHlMmOrBlzW0vJMLlQ8ymM1TPVnhf68Avl5n6SMufavRDgS1G6lzxeEnAB0tx6dDGC
         R3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544699; x=1795149499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pTCbeuMBw4mtr39j3WfpOFFcKqtGe3X/Jp0q87wrlE=;
        b=GcuptOx0NvDm7Ri2ZC2meUKyX06ClRGaPuM/ARWYUiyIhAFRkzBJRaCbw5tmbw0yE/
         K7svD5ma1aLbkPqaZlm0Ja0k5nfq9wwwL4WKb+5ly2qqQt6o7bSLbjL8RIWmoclIYaHg
         EcVUVc8XHs3BCrr0EjMdrkfNCXkq9lmc6OtBywY+xKIj9OsWjVqq34tujKcAD0jAFgjD
         SvqOenKBx3Cv3/zt8m5eClVeY5A2zmNPmgz0jNYJpY0bRYwhnEfJ+PeXnnLTdLn/ZnQ9
         4aoycgAIylndEru1lHGOpkb202uNeR7OuIGT2ll0b/3/75M8v7epL5toClfg6TwgaHDh
         KlpA==
X-Forwarded-Encrypted: i=1; AL+hErERQAB35EseUSuG9PLqoJFh9T3IXyTkCvLjH57HYSECUVZTPi7FJgY2KSCVJMKVXOm2Sfgt6F0=@lists.infradead.org
X-Gm-Message-State: APuU4Z8UyXWImp6sA9Ge36LgRxTwmScHwaBUiJddglVMMyC67ZZ3UXca
	w1EfC9t1Nd3h8W0wGhzXTAYNWbE8Ps6O6WlyTA9TS6EBAFa/3tj5AOjW
X-Gm-Gg: AYBFou0avJn8WmYq4rBGmYG9kQb9bTzxmZGX9nx8UJEXdZQQ7O7K+VaXjmbIU0F1J4c
	KxZmD54H9IgIXYbOFwVR/SNBWgG0NEG7l3R500OvqT9cCRRdcsw0LW61c+chNHtyZDThQJjjFLj
	pNtpO0ZI9+ycU/nPevohHFBWxz8nTMy/MUJa81dfmFVctFQrvjg/VGl4nvlhpipgMpRBnmuk8Fi
	imAeg8JNPG/ovxcSE0LezySry9+0zVvr454W95TCQSudwHkP3/9hwWTimq/ihiP+aIVsJj1yDHl
	RaSvK/hjT6YI0TExCnAXit5kQF1gSSBxWpQEzeBgI133R1H0ZTso2kWw+ZpujUP2sLHp7YvQtXr
	NxXCuJdgoF18W8QeWcdf0kn8wkIU/90PPIQKxLeBitT1A5sSe1q1rxPpBUY5YA6wwxI/rEsb1WS
	JFhyHa4tmpIFJKjcaosUqN/ipuzPztOA6IRZa2i0rf8pwUMhG9F855NbvGN+Pd1FR3eP/Xixzoh
	UbQPQIK7c5wMF/07e0hSayKA6Lk+AJvJxKldTYPRhN4trNYbU+pZgyTj1y6E6lV4RmImgQ7RkOr
	3LjI9iiMnNbA5E4nCBLaOWMYNOcTdB7NN3g0Fu7nol6FfmMQNM0JvB77Yn8oWNx+SJ2zieM7+Jj
	e6tEPp1orD5jY+nhwBjXE
X-Received: by 2002:a05:620a:400f:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9494bb5198amr253467285a.36.1794544699199;
        Thu, 12 Nov 2026 20:38:19 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8f9576sm97734885a.42.2026.11.12.20.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:38:18 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jiale Yao <yaojiale02@163.com>,
	John Crispin <john@phrozen.org>,
	Sven Eckelmann <sven@narfation.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath11k: hold txmgmt_idr_lock while freeing pending mgmt frames
Date: Thu, 12 Nov 2026 23:38:13 -0500
Message-ID: <20261113043813.2174717-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_203820_835167_58A80350 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

ath11k_mac_vif_txmgmt_cleanup() and ath11k_mac_tx_mgmt_pending_free()
walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
completion can meanwhile remove an entry and pass its skb to mac80211,
which frees it. ath11k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
from the freed skb, and both walks can read an IDR node that was freed
after an RCU grace period.

Hold txmgmt_idr_lock over both walks and make ath11k_mac_tx_mgmt_free()
expect it to be held.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

This is the follow-up for the skb use-after-free that was left out of
the "wifi: ath: avoid IDR mutation while iterating" series.

Compile-tested only, with x86_64_defconfig plus ATH11K_PCI and W=1.

 drivers/net/wireless/ath/ath11k/mac.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..ef60811fcf54 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6151,10 +6151,9 @@ static void ath11k_mac_tx_mgmt_free(struct ath11k *ar, int buf_id)
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 
-	spin_lock_bh(&ar->txmgmt_idr_lock);
-	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
-	spin_unlock_bh(&ar->txmgmt_idr_lock);
+	lockdep_assert_held(&ar->txmgmt_idr_lock);
 
+	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
 	if (!msdu)
 		return;
 
@@ -6172,8 +6171,10 @@ void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar)
 	struct sk_buff *msdu;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, msdu, buf_id)
 		ath11k_mac_tx_mgmt_free(ar, buf_id);
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static void ath11k_mac_vif_txmgmt_cleanup(struct ath11k *ar,
@@ -6183,11 +6184,13 @@ static void ath11k_mac_vif_txmgmt_cleanup(struct ath11k *ar,
 	struct sk_buff *skb;
 	int buf_id;
 
+	spin_lock_bh(&ar->txmgmt_idr_lock);
 	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
 		skb_cb = ATH11K_SKB_CB(skb);
 		if (skb_cb->vif == vif)
 			ath11k_mac_tx_mgmt_free(ar, buf_id);
 	}
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
 }
 
 static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0


