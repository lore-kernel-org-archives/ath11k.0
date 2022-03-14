Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10877C433F5
	for <ath11k@archiver.kernel.org>; Mon, 14 Mar 2022 21:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ICKsK3jpUmjJjWZ6Bs4uzVq0VgXR8GS1ZFrY0X3u8l8=; b=biSUcy/8KneqiZ
	I6qAhJ0NMJ+0mlVDr2kAbKfKI8puBIMnkLRtGMJF+PeOj/EAUReUGfk6VmYdE/4sTl8CTf80TQZVJ
	GSRYlifeg0d9NQyuLGw2UxCiapeJe6EyrH5iEdgDyWP/zu8G3Vgqwkwwq5bJg+6Zr6kXLon1bS4wJ
	V3oSPfi49JSmHgpM64bWomxwvaYiuvevUJvNaLGl9iWmLPk17P6G4lH44gny5XngGjfEoFN8lsn/5
	qh+27j/gsVSuplVFBs4/3UZkecDzKTgpqlv946Nw1FAUoqVPcjeYPkMuaq8PKFa/Y1m0oPPjKM5HZ
	nqzo52JiHtbxv1ghkHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTsdT-006xGz-DX; Mon, 14 Mar 2022 21:53:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTsdR-006xGP-4k
 for ath11k@lists.infradead.org; Mon, 14 Mar 2022 21:53:50 +0000
Received: by mail-ed1-x529.google.com with SMTP id j25so8422516edj.11
 for <ath11k@lists.infradead.org>; Mon, 14 Mar 2022 14:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7nlDmleCWlPyxEiFZ9UL9nqrSJw2NZiKtyYgJO1iLVw=;
 b=NJSHvitCF55xFNO/tX7+S933eZgG6cVJzA2CxouUrgPptinFdz7Pc4OiRlrCBS0GvZ
 LpFpqOh7c8zW8ysdMtt5nWhfw64pmcDnKSh83KOto/Tj1a76dnbynbcb8OV56rP/J2JV
 aOV48sUYEDToyt4hWDRfYXrooR0QZQtbkWvODfz74fVM7htQHvFMS/Xf27Fp9x0Mvjiw
 CCy0kHX74KelKc+8SXw8iCkcnWFlNWLMwW4y3FMXPmEAKs1JMf5d1nCodljbJ+u90A1R
 ZnjMxYifZj1SNFz8q7wjR95WHsOaOHfmRw3v6WmtiGXeX9FL990qlKGlQunxK7Mzl0h1
 OIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7nlDmleCWlPyxEiFZ9UL9nqrSJw2NZiKtyYgJO1iLVw=;
 b=La8AYzMii5nkOgMa4RMpZGXpIx0MGScUxsAk/kecgE02yIlW5/Z13n800/2FTs/R8n
 3hNofUxnqKAENrQLG016AfDiFfRB7U3fKhxC4XRv+2qYDaStjaL9PmRQqSmqnOnN6pXe
 pwv6Spt0XL/oMmCOj7XFBGvDIf1H3gvBNxHfm0otxXhiBIWSXlhr0PrR3inSI4gJxw+/
 YtIj1qenvkZAJL6MzxozAgeEPAUUNhJMq038xzt2DvNGDSGzHNc7v/vF9YuUifrQ6d63
 Vgm1/0aHYpiBpm1js3liowwp64pgNoi3F9c8Y07VIpygvYKqRcl6axzTdtMU0veBnjwf
 1Asg==
X-Gm-Message-State: AOAM5317cS8rdp2PzV80PEZEOup1pPOUg3wcsK1AltcAGaOvBvWFi1m7
 /+BrNDmHe457Vi3OttPjsvQtWWgAleLoZg==
X-Google-Smtp-Source: ABdhPJyYVhIRlF6SxJJz3RXNhqtQ23bxQ2+bgaWyxYoZNhPMEiCOO/iIeNZMq7NKl//+XahYC3eyFg==
X-Received: by 2002:a05:6402:6c3:b0:415:ffc9:3a09 with SMTP id
 n3-20020a05640206c300b00415ffc93a09mr22660635edy.403.1647294825811; 
 Mon, 14 Mar 2022 14:53:45 -0700 (PDT)
Received: from nlaptop.localdomain
 (ptr-dtfv0poj8u7zblqwbt6.18120a2.ip6.access.telenet.be.
 [2a02:1811:cc83:eef0:f2b6:6987:9238:41ca])
 by smtp.gmail.com with ESMTPSA id
 qa44-20020a17090786ac00b006dbe1ca23casm1088434ejc.45.2022.03.14.14.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 14:53:45 -0700 (PDT)
From: Niels Dossche <dossche.niels@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Carl Huang <cjhuang@codeaurora.org>,
 Niels Dossche <dossche.niels@gmail.com>
Subject: [PATCH] ath11k: acquire ab->base_lock in unassign when finding the
 peer by addr
Date: Mon, 14 Mar 2022 22:52:53 +0100
Message-Id: <20220314215253.92658-1-dossche.niels@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_145349_204758_80604D7A 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

ath11k_peer_find_by_addr states via lockdep that ab->base_lock must be
held when calling that function in order to protect the list. All
callers except ath11k_mac_op_unassign_vif_chanctx have that lock
acquired when calling ath11k_peer_find_by_addr. That lock is also not
transitively held by a path towards ath11k_mac_op_unassign_vif_chanctx.
The solution is to acquire the lock when calling
ath11k_peer_find_by_addr inside ath11k_mac_op_unassign_vif_chanctx.

Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 07f499d5ec92..5db2333478a2 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7077,9 +7077,15 @@ ath11k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	WARN_ON(!arvif->is_started);
 
 	if (ab->hw_params.vdev_start_delay &&
-	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR &&
-	    ath11k_peer_find_by_addr(ab, ar->mac_addr))
-		ath11k_peer_delete(ar, arvif->vdev_id, ar->mac_addr);
+	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
+		struct ath11k_peer *peer;
+
+		spin_lock_bh(&ab->base_lock);
+		peer = ath11k_peer_find_by_addr(ab, ar->mac_addr);
+		spin_unlock_bh(&ab->base_lock);
+		if (peer)
+			ath11k_peer_delete(ar, arvif->vdev_id, ar->mac_addr);
+	}
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath11k_mac_monitor_stop(ar);
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
