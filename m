Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A5606A8B2
	for <ath11k@archiver.kernel.org>; Sat, 14 Nov 2026 22:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hwyEXrWo;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=zTY1S3LK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Ac5TEAvKMoiywm52qpn9d1RqtWSFCZ0uy+PXykYl9o=; b=hwyEXrWoR7CqFM
	rshbQVayCpfLb6lNIlgilfQaJkgyub7gqnkJNI7KIViRPXyoQUa7jq8tecFYH6imszN0P8FPmsYZ8
	j9HhORlvHh8sHTPYT6umUT4JXvCmR5/ucwYV+4Es+bJxNhIpFiPVDeRnZ+DK0hoZ+qHo929u6bC5v
	gERLrxaD/fnUgJPdcf88Xm7VRMURT9u8GbO9EwYxk5wMLBl2yX/xGTsVfwfZSdx5WCJNQF63chsT4
	Elgaw8l9RtytImUzxc1TB71YUl/+bbyfLT5/8SexO36JlacF60C53a42JPxTN5kEfRI+vFLZQ14yz
	hNBirtLgwYaiWEHzpIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMg0-0000000Gras-0RSm;
	Sat, 14 Nov 2026 22:56:52 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMfx-0000000GrZe-14Ua
	for ath11k@lists.infradead.org;
	Sat, 14 Nov 2026 22:56:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c169ae1cb26so425381666b.1
        for <ath11k@lists.infradead.org>; Sat, 14 Nov 2026 14:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697007; x=1795301807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ac5TEAvKMoiywm52qpn9d1RqtWSFCZ0uy+PXykYl9o=;
        b=zTY1S3LK1klBL8FgxMuKPdb872YxYxmJoMqN/P7RSO+WmXQi51IwPU4S+0oOEdW7ND
         NNxVs8ffRkyYLhwxI47QQbHnYd+sMpEy0cQckGBgFWl8gAP9oJL1BXWUW1Ndb85UNpzk
         hV6vXKGnCLVsq6OGoGOowFnevXR6bn8GGmAFDKu1mPYKZ80SM24dH7ZCsMM+sxSASpBh
         1Of7J1SFdhdBGs1lkIKPyAtn9OFi8thw34GVpc4QZxXaaGUCQ8cQgnZV5KznIKkfrPH3
         l7zGgLuGceIWl8hDbjyRgWES4DVZqDany4NIHlXGAfGI7zkXgzLu3KpcZ0NS2EnbiTYD
         Loxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697007; x=1795301807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ac5TEAvKMoiywm52qpn9d1RqtWSFCZ0uy+PXykYl9o=;
        b=V9vpROybomwBQ7exOvE6VPh5WW5gnQNNh1dgZJFFfNJxNtCwNAu05qOK81D2g/g3sg
         R0OQ/o58Wf8/xmXlFW0hq8Gi4Z6TLY5CKcZkLuu1n0Yp/+I1x/OE0x72u9azOa+n/P66
         siozSMTfXPpc5nQcC5FktgjQJT7mB3ai0zx30J7EdaaFPhURvOGy9shf4i1aAWVpRJGD
         TCQTo9mvj6QbVSPgfDI5ZIC5W3MpcxgjGat2ci4yG0h91FAD1Ra0a0jhj42I6INbwygF
         nbYLPURlKXeDmMHubH3zj/l+6pGidmcLjbE4s3ktzcNwAlrNJTntmyk0ewe2pIyWsK+G
         Z6PA==
X-Gm-Message-State: APuU4Z/KytQDQyOoXi99/R8MS87dO6dzw2wCOAkJVlx/YIUsxRrqp/KG
	h0LuGj48UMYdsRAreCAgChN7EGlDzqIrAyxw5uoocLnjXaDme2LMHQUj/mAIgFAFqA==
X-Gm-Gg: AYBFou3PfDqgsoCgIK65SyhpBxX1IA+FikHRBHvQbA/10eJtfNPWJyg4MVgvOuWLoAG
	KR/4udKYXJWRGU91L4xji1oU3vtNMlOLwyY7vM4Jypoxt4X3KgSb+VfNRkKbjl1au1Q9TbvApnQ
	J/+rFQhvGRnsG/Cufi8J0Wur/s5Xw7FCikpBK/jsT4uzRF4wSB4ScvcgDfy6idG6w2Je/jkDS28
	jTIJOBXigJ6i8FLN0VTBOewjafrzRX6N5lYjn0hczukULSigwQvLgrSR0wveINDFe+Ed8MbQWI0
	tcICd9KnvbRmBxFs6SnXd4VAmfnQVRkGDkP4Y1z6iMk0HOrkN/fi/5rKngjEiz9a9UB3l2XvBrV
	A2/sO5zkRHhPyDvdv9GFDAPXse777sTe2Mtao99m+/aaT5hkD+kLWvoCizTZvBKjTt1ZM/S4dgr
	ldxxups/nRBzEtHZAZZGUkHoGmDYpnw22koaHyPQS8tiZSsEEVDxvDZaj8vBOB/GNid8d7YMPBG
	LdvcurhtgsRQ/5i3c/kjQQw9E6P3P65pokh9IoxnaG46hd/HEAJpIluPqNSIu5Hw3qrgU8aGKQK
	uEqpagiqCC8jFDHTcQumE3oKRfB6RvAt0BG7i4pxCU1sAnOxX4RxOqq6qSaSgM5gkBhBtXPBQY3
	m9mG/sSpADGwjGK794aE4nvjKZvZ8rgRUed4u4lJCjQjSjv86m1b1hYSxGSfTaAKW4E1BjhWxXi
	2Vv5RG6eoR1+TwrZXb4aEm7MKbN0CkG9uV1uZatZzsZWlddCrynslPuqsT6F913HmPJePNP/WWt
	C3yXLTdp2xVj/VOojUm5sYf7xV5U9payYFmQp/PzPG+DzizaKAYQEKMJwlWXNNHxx0HgMdtMI17
	SazsjIe0MhgmkEXg+YG8uLTcrhabBJ5WcI30/k+4dKPIKklp9mT0YNhPmV4LiMNV
X-Received: by 2002:a17:906:f043:b0:c49:9247:9688 with SMTP id a640c23a62f3a-c507bc6cd67mr755011266b.7.1794697007245;
        Sat, 14 Nov 2026 14:56:47 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm2751595a12.17.2026.11.14.14.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:56:46 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	John Crispin <john@phrozen.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	kbuild test robot <lkp@intel.com>
Subject: [PATCH ath-next v2 1/2] wifi: ath11k: forget a key the firmware failed to remove
Date: Sat, 14 Nov 2026 23:56:42 +0100
Message-ID: <20261114225643.962015-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114225643.962015-1-julius@bairaktaris.de>
References: <20261114225643.962015-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_145649_312421_1CFC294E 
X-CRM114-Status: GOOD (  12.78  )
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

mac80211 frees a key after set_key() with DISABLE_KEY whatever the
driver returns. When the WMI command to remove the key fails, ath11k
returns before it clears peer->keys[], so the peer keeps a pointer to
the freed key. While the firmware is down, removing a station frees its
keys this way, and the following ASSOC -> AUTH transition passes the
freed keys to ath11k_install_key() from ath11k_clear_peer_keys().

Clear the host reference to a disabled key also when the firmware
command fails.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2: new patch.

 drivers/net/wireless/ath/ath11k/mac.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..9c3f577c9562 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4615,17 +4615,22 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
 	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+		/* mac80211 frees a disabled key whatever this returns, so
+		 * forget it below even if the firmware did not remove it.
+		 */
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
-			goto exit;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
 		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, key);
 		if (ret) {
 			ath11k_warn(ab, "failed to offload PN replay detection %d\n",
 				    ret);
-			goto exit;
+			if (cmd == SET_KEY)
+				goto exit;
 		}
 
 		if (flags == WMI_KEY_GROUP && cmd == SET_KEY && is_ap_with_no_sta)
-- 
2.53.0


