Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72550606A32F
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y3t+oYE1;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=KvOCSUTa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9O61ATkKp+DlIEXsj3DD0qBP/WN9VXV3+UsO1P4gT6Q=; b=y3t+oYE1bkj2FuLdKWYfqq0eYb
	KZ8s0yuIfe++XQxiK0ZFjJ+t58DOBt2spPY5iDwBbMCxFAZ5Ryo7457i8hux/4OQSgnlewoy6HE0i
	Uz8QpHNKcAjibhxA686nZZcOSmhkAzPe+sltm6h2LrBZl57bEavipCnLfo9cWHNwXhVOFY4vyMLnc
	S9HAG3k2s2Ur6BNx79VpN5ThT/fnupH9uNJ7yXyC8j1GPgaWE4gW/Sc+lxl0TzFF9YPrypzodCaZG
	Qf4U8ny+gx+t3voSe1AbV1kWps4apyLnBikp3Pr9EUcQhP6ez6Lq7/TnNyIHD2b6QVWwIbtTxbSr2
	uEuTz+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNZbX-0000000Eitd-2LLU;
	Sun, 01 Nov 2026 17:44:27 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNZbV-0000000EitH-3jmk
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 17:44:27 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so3522362a12.2
        for <ath11k@lists.infradead.org>; Sun, 01 Nov 2026 09:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793555064; x=1794159864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9O61ATkKp+DlIEXsj3DD0qBP/WN9VXV3+UsO1P4gT6Q=;
        b=KvOCSUTaTe7ORTnP2oaywz0mbT0BcMDEfGv1bTShe9wv9A2OMyBP9m50w34beRHzWv
         nYqcfG6L7gkIqIyjY5uwatksPh3eSQh9n1zJqPwE8+/RA0q51gjoZFNjW5bl0ear4lJC
         BooTFXJMlbn8acuRWghhZHL3A3n1itEUCipPCHpeh0V3i/1JXL34kPV0U6qCUT3PCEel
         tpAPxwTwfcpTBvXpAYUlcK2xZFFeAc28VFdElxK12CBiHoXz0ah4diAa2HD9raEcOsdn
         9n/J3PSwiQ4J2FaRDA4iTboZHIwQYeJ2Ikes024DSX8AvjdrhSbsxCnW/l19IGlre4Jo
         NbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555064; x=1794159864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9O61ATkKp+DlIEXsj3DD0qBP/WN9VXV3+UsO1P4gT6Q=;
        b=2f+jN4gPNW4Cv44cEq7HZsZJIfh/MSr02uFCQHFd9VE/AMxmyNENLahaaSzHiZ9Xsk
         lqEVByVYGueBt1GPjhTK5EfapRq2cpjCjgksoXka8XMDxciVsdxijkJ3pRLYeThVUucl
         uxWq8Q648LE9o20Cu3iNqM8orfXI2Ys5OUAvHkDAaJ0bfRzseVDmeFEeciJ+KW/Omesq
         0SD3CTRYQ9wCh7ZH+pam0ibPpobuAzE6FHHiceL80HLciVDeaUUKHDL/b7S7aRLVYwEt
         LnipglgdF6OgB5o16+6O3zAVN0bAYYN1VM2skfyes8PR4AQ32EV4868HB8ZV9jXSYoWO
         iexQ==
X-Gm-Message-State: APuU4Z/95zCvt4mlomnf/1R/98O3pbP7kGMfF2niS4onlua5gRUWIs8s
	oeMjZsbjwIvgqzrN4xAeXdE82XA81xf8OVCzinE/GyIgoSst9YbWGV0q6+AE36IF5A==
X-Gm-Gg: AYBFou3FHQqA/2k3BCqPOoFO+wkmKKtVSXUTulki2B2n+wy0r5D81ZQNHM6xwLfezWp
	D06QFw1dgJ5rz3+VvFleLQ3jDm7tbzQojBQleYK4ouc2C3vNtyjdiQH47D/Uj/oXLWLQA8hBnCU
	qnekXMLW4Wliheb6dROZe2FNnFjV0hvOeI2Er3qcgYKnoMyYauIRDMH9vL9F1L8ri4SL2nW3XBT
	mQVL1MVPCB/e+iGPU/RVibFginz8tUAvacUH7WCUKN8yJbOIS6aM1BZ4EvY5zZJsTkuC6c3YhEz
	CcIMK9qR9OTUc2/fudhVWdN8AapXxbIjQbyPmfhGD1oq9jfQKcWrQHk77I9RBYEpa+m1C2BGSSr
	RIbG2BCWfuvGmBypDDtEvm5Eon/SOVX0jEFq0T/5QsBzxtgJ5iEuH/vin8zkdCvTMs60AWiCE4+
	XjhZzPFiR1H+2hK/eI0YW2QyctKC12nh4ghbgg8/k7XPywy5PfmK4v7jOHVVJGi+XnZfxyO5yxq
	lJVCWSbv6w7PcC5PK5K5Lr881o1riWel3xwDFGemhbSdzjNSfQlTqddwdJ8azf+oYPVgri1Y5Lu
	q15JVAsslNtBZCQtql39VZTN25T/x0C5Xrc0+W8RTcTlrx+Bs6pESjquN2MUHjivbVIgcjTteMZ
	iSPe72HYego7gt5WFEHflR3zyvR83pKTt+KC9gbggJzvOCmedVmIw40iEc11xs2HvbtGG1NQUIm
	8gXRSmT/lUGXCry3lrVI6eoKfvs+qqcU9SDU8wsvAqJm7SVd2IN/Ajg4OQ9bdgBUANxAvFxDcKW
	6rczpvXskxGZlwjGHBkzeTKZPrxGxxUFIzou7OUTHf5bmdlMbiuWBrCNq+rMh4mzBym+T4i7rwL
	mYDj4Vx9+WMxg1Vnb3U=
X-Received: by 2002:a05:6402:1d51:b0:6ab:7700:9371 with SMTP id 4fb4d7f45d1cf-6b4d468b63cmr5289419a12.25.1793555063954;
        Sun, 01 Nov 2026 09:44:23 -0800 (PST)
Received: from Desktop (p54aff7cf.dip0.t-ipconnect.de. [84.175.247.207])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca21356sm2369094a12.35.2026.11.01.09.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:44:23 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath11k: do not fail down transitions of the station state
Date: Sun,  1 Nov 2026 18:44:22 +0100
Message-ID: <20261101174422.1275413-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_094425_955307_37771262 
X-CRM114-Status: GOOD (  11.98  )
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

mac80211 requires sta_state to succeed for down transitions and warns
when the driver returns an error for one. ath11k returns the result of
WMI commands for ASSOC -> AUTH and NONE -> NOTEXIST, and these fail
with -ESHUTDOWN while the firmware is down. A station removed during a
firmware crash then triggers, for the disassociation:

  Driver is not allowed to fail if the sta_state is transitioning down the list: -108
  WARNING: CPU: 1 PID: 5952 at net/mac80211/sta_info.c:1561 ieee80211_sta_eosp+0x119c/0x1668 [mac80211]

and for the removal:

  WARNING: CPU: 2 PID: 2080 at net/mac80211/sta_info.c:1652 sta_set_sinfo+0x1118/0x1144 [mac80211]
  Call trace:
   sta_set_sinfo+0x1118/0x1144 [mac80211] (P)
   sta_info_destroy_addr_bss+0x34/0x48 [mac80211]
   ieee80211_del_station+0x1c/0x54 [mac80211]
   nl80211_del_station+0xf4/0x174 [cfg80211]

Both paths already warn about the failure, and the removal releases the
host state of the station either way. Return success for every down
transition.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
ath10k and ath12k return the same errors for these transitions.

I used Claude (Anthropic) to help write this patch.

 drivers/net/wireless/ath/ath11k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..e5bab84a36bbd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10074,6 +10074,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				    sta->addr);
 	}
 
+	/* mac80211 does not let a down transition fail */
+	if (new_state < old_state)
+		ret = 0;
+
 	mutex_unlock(&ar->conf_mutex);
 	return ret;
 }
-- 
2.53.0


