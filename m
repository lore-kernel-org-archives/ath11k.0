Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EEB606A32C
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J6SM6fs+;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=UqIX2NFx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=; b=J6SM6fs+sRugV4
	JtAvYrAQLSBhP5er9t2I9gf6zWHOFGrBrP04wEkJrpTyWx6PIP9PREuP4dGE5bUzRLCGvcTIsAPZ6
	wl9pSY2TMaFwLsRlIXhxr4HNy6VoqOWVl3cqL9IZluvWswNWG5R6Q3n16lanVJl+vRzHPKYRg8t07
	r4t0Vp7ZcFLC++ZZ+gQ7P5l8OJTmWrOczLakX/mFM37Bjd9mA9SHTJrmVA+luBnes/GnbyDIHbD8n
	lhJ+GHZUBt8oRV8dHNqpYRmJx5ogTGxOa8q4fKmZqw7z4uQ/qPi0bLaSlKNbGIPSn2iG5Mnl2/hzI
	8nngm6CdnSPIFC3LD+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7q6-000000019fn-1ocs;
	Sun, 22 Nov 2026 13:42:42 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7px-000000019XN-2Bhv
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 13:42:36 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so3042885a12.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354952; x=1795959752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
        b=UqIX2NFx8nfCALPpWps/WtBn+VodbWPQNEugyZ4cVey0XRxGl60v0j8lTYb6DzdLdt
         Fd4dZr29r4YhPwhdNapxvJRd2B5cdXtaT1dEqQy3cgQoga94LzVUBycSkSQaGWvl4CYm
         /tmo2oQBZLUJ9VoaPDHjtI0JFs3bb4Si1iajOFcJUcR0P2u9nTd7ngRyHAE6bpi6Sb/u
         0t+HZ9w/VEsJP1EPVHW8dyI/nO1+eeLUvvpO3ZZXz8tIAu9opGVQpW76X9mlXoA6HReb
         bQKegW5qqO1OkaEKs8fwaacLPl8PVxFtXT7OfkQIJAydptd6Gt6uhGCSEagzbFinYOQn
         2ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354952; x=1795959752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
        b=j+amH1uz9DtFnNeXLs8ScfIBHl6hWmlreP975ddt5bMkpS7ZMCMq1eKRP6O33uZrV8
         4g6QZ9rpvuqIkBJdtOrmJVmNkA800sKMbYeHGw8UkCatE8XAlJ4m8XMlVfNMNk+iXdoa
         K7t0cijJwQRu1PbGDLCtH123fG+LOot68Gj0PjSA53bu1Tv21k3Tn5m/U4C/OvuXCsQl
         IPwJEK9RoQmZRKG7DJ1bkygFPtt3lpQRf9yGZuiK7jb6Tv0GXT4RrG0INcovaKt2G+Am
         cK3va5QJG2G3eifqnR04+fFJbJT4qGcj/mw125CeLpvi3OzBru6uZVS5b3FxH2s/uMxt
         z9+g==
X-Forwarded-Encrypted: i=1; AL+hErGr5mjF4NCUgY69izujPINi9Y33lUaIALJX6ZLkK0NEBw0i3jKpO5CKY7PaxpxyVU05SCMyX44=@lists.infradead.org
X-Gm-Message-State: APuU4Z/9NpvxssQyG8zeFoB3PYdcnYxmG2nTlk425+EzPm6YbFkvj6w2
	xyz3nH0XHYzEljYfBYIMHtPlEnc/REf7FdVdMdW+iW33NdZkyvsJV91VkGaydN/Dng==
X-Gm-Gg: AZFdTZeCrGV4hsO19lNz+lY3Q52GjxsIupULpzhr02MCtGjmKyvgSUg4wHAIbh3FZmL
	PswNoyvPxLykBDlxjMBcFISOIagH41OPt9VvpOJ2bHBwO3JbYVcdYiOz8odXZD0AC1nrGr73MwP
	KPzinV3fsq6vKpbRYDl78mWAU1JNv2c1S2IXdakpm+8pItF1VFe6mdlQK6uvp2P+EigndhHRB9Z
	mVI2fVGhW9jKoXLntcLamS1nQBhLrQNHYRIJJOc0pwNPqQEqNExsYMhAmZFkIZOvvzi8RDrvBFq
	RvzVoZuznFhj/FkXzhAybge/XI5t1AjxG/57uLfTpNOJ4j4gdic0DBzhsR4T/Dv9zMIIipn4OuT
	Sy4Om0c4LlupAXuJAJG65vpPuhIo1UBKrVCrkcXMhQsiu+y3BxU/STV+Yk+kKdZxocbCsJOKCRv
	brWzSUo+5/QiGCzodxA86QhBPKUSi4hwVI1mIFXSwIjAUnoqLDAbPPn4j5H91xWEc29icRcpHAP
	4rwI2XWlG5x0SbBwcto5G7LF/8xhJaa4ftoQtIGJpGMQiLLtPaxRTV5ayAaZnZfyd7wVKVzp1AM
	WcvUfC8aAbgqIwq8aknyFw+vZ4s0YV6uKVq/OCKowan72S1C64yWU6JSo09nl46F3mcVs3wDg/2
	nQGU2Yrki3XrkwxzS8gsXeIodiW0ob/awIHkBfJq8nc+7+NulYDEnVe6r2Ou8E63Fh95oRpDBV0
	PxZP5cxu9ZqvDoOVgofCZrn3FLeHs5qTLyvSHm5Q0TPPhfNlMdJExZqq5LjC0jrBIGQxQcC4eCS
	eforZHWN/ON+j8eZ8nR1BEmEAj5DD01lxOWr3RvreGwGcbE8xG6WfZ+97cjgNyXHcJQfAAexpKp
	pBbokJoR6TnwXyaRB8FZEecnmkVFDSY7M9WBIsbwKO0ufu4KweLSUiI=
X-Received: by 2002:a05:6402:2745:b0:6ba:9d0c:cca4 with SMTP id 4fb4d7f45d1cf-6ba9d0cced2mr898964a12.33.1795354951690;
        Sun, 22 Nov 2026 05:42:31 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 4/4] wifi: ath12k: pass the TID of a received 802.3 frame to mac80211
Date: Sun, 22 Nov 2026 14:42:28 +0100
Message-ID: <20261122134228.956044-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_054234_069758_2DA28605 
X-CRM114-Status: UNSURE (   7.29  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver already took from the receive descriptor into rxcb->tid.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 36be543b7c50..fc381945d163 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1413,6 +1413,7 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, rxcb->tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
-- 
2.53.0


