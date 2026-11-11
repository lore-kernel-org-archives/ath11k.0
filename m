Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940960A263A
	for <ath11k@archiver.kernel.org>; Wed, 11 Nov 2026 08:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LFJ0XqJs;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=QLch8zTm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=; b=LFJ0XqJsFWbKGN
	n+39Tc5znHRSH147DtTzR6u0hxdxhnb+UXH0JTiLTS9AR5Et3GinWzCx0GivmTSzZgb4sh4LTRzrV
	ni5uzTQWHFlVebbzgg4dc7IYg4PEcRRGSLnIRyEZi3lPsiAlziSLZNM5XLJ9HT9c0tjnLf+K38kH4
	sw/VC87+2b2qSq30Rczcc6ZmK/Xp93SmDputKPzsYC6gNRgvydxm8jAGzXOZW/J7aZgLGCg3djI5f
	n2heGNqG0VU6mvl19Ytr33V5oil4QI7HCPiREVqssaPoics+rHb1GqL7c0Y3Xu3nGYReWeaSQahYB
	8GrOgU1Pu5NSyIBqFTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Li-00000005zH2-2DHH;
	Wed, 11 Nov 2026 08:06:30 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3Lg-00000005zEV-0NJs
	for ath11k@lists.infradead.org;
	Wed, 11 Nov 2026 08:06:29 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c505c561fd5so194231266b.1
        for <ath11k@lists.infradead.org>; Wed, 11 Nov 2026 00:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794384386; x=1794989186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
        b=QLch8zTm/63OFq2IDuwr4ykEg0MEUK/8vd4xH5Qn4gK3aRqf/6Qi85+I3816owsoiz
         p9i57FIfoGEKs1Y/kKnTlbMuX3TimSK2CzFy40C5K0Ks77K7HCmmEj3lsDchkkdan+0J
         1KadHAUMw9VNijKkW9KRqj6mkepEh18t+y/slSCpwkWTMoNMO928zkxpQOloj23rsgKD
         9mauoRCvXZLeHj2QmXQPYaJ+FtIcWsjxkDCRgfTtNb+nUBE9eTcXzqnZzsANUCsGzyaS
         0khLC9zhWZQuWZTDPu3aBzCeWiPaNWc1IN6V8z/bOwtGLZXqspUofujcwv+cVpiJ/fOB
         29iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384386; x=1794989186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHr1Tu21bGs9T8Fp/x2oMufBq8Kyqkzni5U8VPWCwnI=;
        b=q0pIX6IwppvuX4z4BJmIpxnH/5MMyfXzqEj48cN7rvHU1qR/xzT/hEZ/wvCjmPrGLE
         QW2ovid+i5GtJpJuBVzm5PsUx7Nt7jHeXrQlEDMw+kAtsYeQbxA0LAWkg8fZt9iPfLQD
         g6EY/Yk2i2qDmWhL/WSaNxyvLXQQUh4to5suWcgLTHD9bW1HZW8+mFGkwsQokv5lRQB0
         JZm0PygDs9ktrAoTevgeLmTTD98wO+Scg+nWni2cZOpYTV4XryKv8LLlW37DOixfgzz4
         ttxWHnOcEavumHmD3RUFXn2BxFR4QPHuk1W61j4PLYtGG4EKWARw3V01fFDwdZ7Aw30w
         Uffg==
X-Forwarded-Encrypted: i=1; AL+hErGhUoMxzBOWWSNw+XoBzyP2DKeiiwe6wDQRRmzIWItIXGQl2c6PCPFQRJyYrJhQ9d9C1NWEj4o=@lists.infradead.org
X-Gm-Message-State: APuU4Z/2q/Nyn/bIt+hksc5gWGQn8nDh3A1NrpJBRm9aF59bppqV7dKN
	n+nrz+2CM9hXO/x2US7pAzbNc30sR+DoRiYxEF+Xje4Y5HN96L/epq8rL674FSvd6w==
X-Gm-Gg: AYBFou03cwJMPCgCQCjb9vsIf5pbTNaGUjU2r75rQ63EqJZKmcXkg9axTtA31P2SBao
	O8Y87Oa6xbhcoV09dO96P6jem/Fj97+6R9xBhNdHJH5ModCb+66fXAaLWygY66n6Zw4uSEkTv7T
	8zAzmWIeEZnjlhTtaTk6vK6zsjrp9ruJypylb4IU5JrbjnLKAorhRmHLFX5L7w7KJQs3PbiD+J9
	Y1EQQUTczUAqKVEDgqPoXE88T6DgHkIUfnV8mzcCUfQFcYZKyakm1dJhu6MGzhfSFp2r6ghTdcy
	3SphDZ90cGW9FQ5GRB/oSTggAOLjYDxgq5enxZO9M9Iq7mLDg7k1ZpGrrNyrs7Pa9iDs3RU4ZZy
	nN4zr7vKejJRcjFWOzsUG0/h0On6jA0qnzulrYPIurl2x1JylqOzfqw63zB97X6eNmn43c4cjUf
	bmXK6XN6nhdBYrRn4DC5rOsLujsuKl88bhP+j06jOrUUqeMPouuHEokfDarLMB7m5VQFBZhCInR
	r2sfIfKcl+70nzZnzA3D2nLXMur4JrnSz1dPFgUfIWjInZh9SNgublQlUHC8vGTjJ6dLNrg3QHb
	g3c3MtwrPXUe9Hrzma5C+Qwg2jxJxYO66ljlTNyFBhwobV3Z2XeZDpR1diHbuAX8P50kP1GVa1m
	sd7k9B1OzqTa+4MhGOBpeV10Ys8Qap0OLvaHJfxS8ngcizA+PU3+n+fje5lT9uVLaRgoRVTVyzJ
	nY+W6BRk2l+az0JgR98XhrNDr0R7lAYcAu1TcDO28Lh4MP7twGFTKFNyzx/38PwiwbfVeQZcY+K
	Rgu52gUAJfkufyjNSpsQFbehgfDlqOqac9eOOGBq8cinPdqXwJXreM8p6CIB3vRa2iVJ3YZ+lnC
	Q74EWp8sXRSWFHs2Mjg=
X-Received: by 2002:a17:907:3e0f:b0:c50:5275:fb97 with SMTP id a640c23a62f3a-c5066d70b41mr112406166b.47.1794384386217;
        Wed, 11 Nov 2026 00:06:26 -0800 (PST)
Received: from Desktop (p54aff574.dip0.t-ipconnect.de. [84.175.245.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm2219265a12.3.2026.11.11.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:06:25 -0800 (PST)
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
Subject: [PATCH ath-next 2/2] wifi: ath11k: drop TKIP frames too short for the Michael MIC
Date: Wed, 11 Nov 2026 09:06:20 +0100
Message-ID: <20261111080620.244164-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111080620.244164-1-julius@bairaktaris.de>
References: <20261111080620.244164-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_000628_170909_6D201056 
X-CRM114-Status: GOOD (  10.63  )
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

ath11k_dp_rx_h_verify_tkip_mic() computes the length of the
MIC-protected data of a reassembled TKIP frame as msdu->len - head_len -
tail_len in a size_t, without checking that the frame holds the header,
IV, MIC, ICV and FCS. Defragmentation trims the MIC and ICV from every
fragment but the last and the IV from every fragment but the first, so
fragments that carry fewer than 16 payload bytes between them leave a
frame shorter than head_len + tail_len. data_len then wraps, and
michael_mic() reads on from the skb data until it faults.

Drop such a frame, as mac80211 drops a frame shorter than the MIC in
ieee80211_rx_h_michael_mic_verify().

Fixes: 243874c64c81 ("ath11k: handle RX fragments")
Cc: stable@vger.kernel.org
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..f77a45b7bf84a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3270,6 +3270,11 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
 	head_len = hdr_len + hal_rx_desc_sz + IEEE80211_TKIP_IV_LEN;
 	tail_len = IEEE80211_CCMP_MIC_LEN + IEEE80211_TKIP_ICV_LEN + FCS_LEN;
 
+	if (msdu->len < head_len + tail_len) {
+		dev_kfree_skb_any(msdu);
+		return -EINVAL;
+	}
+
 	if (!is_multicast_ether_addr(hdr->addr1))
 		key_idx = peer->ucast_keyidx;
 	else
-- 
2.53.0


