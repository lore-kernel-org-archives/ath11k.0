Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FD0606A32C
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JFjKfNIv;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lqYcxfc+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=; b=JFjKfNIvj+YfPy
	lFP2xvSTaJhM78A7GUil9zCFZIi1twEpRgu13uaix426oWS8zBhMhO330ssWbJDL7abwehm8ibvCh
	2LU7mk/Saejh+N6gKFc8v3ucLP9S6BeJZZRZt0xmv4HRAW/2vSAX/CohbFZPykfCPG7uWqG0/boiX
	JlY4L6AQeKwco19zcHCQv06uAVAQ+B+ytX74+O7Y7hO8JPsL4hnVhbqpcw9vXGNHIs2QvYLFLR+9u
	F0PaHPphTxJA6+zhTez/wCvn4pVow8BzwUCXobHiL9R1fAc+leqeS0WjaY/LxuNm1P1SHOjWNk22v
	Q4x/oxl/c6OcRBTgiWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7q5-000000019eC-3V6b;
	Sun, 22 Nov 2026 13:42:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7pw-000000019Vf-2Q1b
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 13:42:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c5126505cb3so311828366b.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354951; x=1795959751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
        b=lqYcxfc+Y8nE/W73SJ7QdPix/MPsLDZQyhFiXasDuqF51Da2RTrx0N9eXJFn+6+Rxc
         qYZMGTo017p+SSZ/dJ2+ZeWgpfrGvc4nSHlp8eU6X1x8mf7+4Pse/8AvrP7vuunx5Qgn
         QkngPknJnZs5Q9fuc5L3Gflpix7XxB47W4H41XyUsp7REk4xikJ9tvt7aJC2lTzAYDkU
         CyLsZBr5EYnzAL7AL9k2P6V3mJxkH9LiNYJBfP6mMZAcQhR7RPZrDpoYgDEKp3QTgTHP
         /v9iECcijI3eeEC6CtowZw7GYO3+89lUEjuktdD2G7NUTqGaRvt2jc9dSI9HqxanHwZ8
         uKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354951; x=1795959751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/EnDq0cYzj1Unoh1AP9SwyoUO1qaDu53CnMoUXDa1M=;
        b=A7jVBgl9Efrwg+Gji2EK7qAbPbkN2ChrAT++4HjjknhKR9JDuxGl7Kv3ZJUcBSXuDG
         1+MyMBBUHj/WOzekI6pU1XYu6FFhXiWI7r+k78vs+WwoJn2BpmowlawQm5ZbFmxON/1U
         gUCIewf90o92/OIHbvPXZmq1y9yPHyuzWLq04HDozHkgRSphGdR6n1Mne56w28JSd3rX
         rDU4ji89Nr9IloxC7+yGUTO6cFIKipd8Xsldc4+wH6JwgnjUk7R33YV3Q3w8+lFqi8ur
         jFfvL8QS2BxTzXHVeTX955CEar3mBg4AP4ayWzW9Z2H/1E92S9DGO4T8u/J7PWHt3NVA
         OmFQ==
X-Forwarded-Encrypted: i=1; AL+hErFYG2Sk5JDBsFcStXPploF99/PmQ+vbty3t2EtMEURN3ufmUGQyO+V9F7F5Ng1nC9gZwtUs9dM=@lists.infradead.org
X-Gm-Message-State: APuU4Z81lhJf0i1CIVLyv0x1FendP5jqP2cCsasThBCxDjqjzjmARUit
	4bYmaVxv1N5SER3oyhZPkAOWWkVMsehHsk/hgdDSkN27ym2HYsiZhErR7aHwbDOA+A==
X-Gm-Gg: AZFdTZcy9Bu1p8remJwRa0zmgymBbjDF0q5xCZzYwxAmCKHDopNCAoiYRy+koiF3WcI
	CxFZkUE7PRQwMLYa/Y7oYi5xmWkOfTvspkqsBCgbVpjGamcYk+xwJ3M71sfvPgSMomUXOJQY1xZ
	F3j17S2sMCgVxzHtCWeRgq+Z8nXHrQRiFnl0iBqiypDU5k94CQGDoFjLH9PKsEeAxID11VMqtR2
	aBIVSF87GTAGcC5+G1iZt0sZiskD6z5Kfc6JgChdoVAZDLEhx5g+wTew97EGcmex5OoosvJ+aQS
	Z+qpmS2ndPgYHQq1074KeiYvbK86RWViWZ1zu9dgAVpP58mhT6TQQghLKjOGNrPB2wIA4c5W9OS
	W7f6i32CMukpk9YIbP3MlKznFct0eNeEr2NmQ2C4nLNnP7snQp59FIg44E5rECZhfsCfcYT2FRH
	u7mwuGjTO5LFjPnAMamDxmj/o6SBY1ZdJXddgj+jBdZTPoqqLCTsXo4+fQAzuKtdF35Cg3dEk9P
	QPwNY3qsSFgRV2DhuRqIxPSNF/p/vXpOeaA34D5miYUO/CDNoZTPSuvrcb37rfwjHRaUYuuZrVk
	okiJ+6QbDsgtTedKg/iuRoc2iadU6krVTdM8kVbZDGs6Us9/KPrAMAJ0KbVEKino2Jp96qZcvwH
	Yid6OdAGaM1fcvqO3ka/2cSz1OaKOV6sI5qlX0QDh+fCbLjRrMxirBGRLL7VbPrubZgjyF85qyZ
	stMNXPs2NL3m1uytM11rXMqhtrX50A6iY8ZWtxaGve3bjQHUTTF3q/OmElyrsxZsq5/Fk82oN89
	04w6VR9uzzEvC7W4ESUuEfo3tL/8cSsuwU1iw+dcvUSLCQlwI3mGonUgT/001QVVrxe9ddSZKDp
	JiSF3a6QEE0iv+BVrIYS2O6TjaYryCLtL2m2J8LOWdf9rSWyhf5YJug=
X-Received: by 2002:a17:907:3e1c:b0:c51:53bb:8d70 with SMTP id a640c23a62f3a-c5153bb8ed8mr418956066b.16.1795354950990;
        Sun, 22 Nov 2026 05:42:30 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 3/4] wifi: ath11k: pass the TID of a received 802.3 frame to mac80211
Date: Sun, 22 Nov 2026 14:42:27 +0100
Message-ID: <20261122134228.956044-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_054232_709894_1614F3C1 
X-CRM114-Status: UNSURE (   7.82  )
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

ath11k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver already took from the REO or MPDU start descriptor into
rxcb->tid.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..7235399c5b39 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2493,6 +2493,7 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, rxcb->tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
-- 
2.53.0


