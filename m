Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14D9C636D3
	for <ath11k@archiver.kernel.org>; Thu,  9 Feb 2023 22:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iUEmL2+QYwXc6T0Qx+Rf4YWwy5fVlg6EPbaE54BGys4=; b=VcDpZ/mCC+r3Pb
	AE1b0MEfB0qs8X5hgpct0xEMtE70FtDv7x4QOPR4WtSnjxeqXLH541lGc7+Q0te9+/HxvAPkJgwOj
	/9lmnCEGUUBtQS3VfwQMDlKVsjff7NJju1uHSOrZpa+N1z/YuRND0IwMu105gtM2niggCZsovikAh
	QwFavryAcIC4qZSqS7euag4sjye5JW7ibb2AXDq8bpetoOEbiPvZBYo1ypsN/5n7MuIu0gMh6v8TA
	OCKJsuYxntsp7sRXoQFe4QaCGcCSd9VrT2xp3xfRVEGWh+iwsdjLM/FV/qXZ8iNQSnAFZ/F/j3A8e
	fJ3kd9thTf5k+/b/t7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQFNk-003Oso-MJ; Thu, 09 Feb 2023 22:27:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQFNh-003Os2-Ry
	for ath11k@lists.infradead.org; Thu, 09 Feb 2023 22:27:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so4752175wms.0
        for <ath11k@lists.infradead.org>; Thu, 09 Feb 2023 14:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mA+W2iIOZyTuxfiY1E6tdbEkL6JPb15N04qIIGKc1Bo=;
        b=grXmBtKibLp67pM4ScaLs8kExZlNValb1oKoIp5YGcr5Ka8i5Vst+TIefQJ5MpCB2K
         VpPw/jCAfXG9qHDSmBCEXEsY5abPFUomHZoUOkjAhusUsT0KWs/mRzHw/Bjytfo2xvqB
         35I0J8FA2XqUPrUh/JwRiZql3tU04aw8cu907PJbOcyPSxWYifpN076p3fVwKC+9GZCs
         XsavH/GYiGWIL+sOHCxOTYP9yRpJGezm2MWtd9+01hSuQ+dWDRs+OPRkXZoixrYwbeNd
         Okax6wTuJMxGGj1Rhvi+8GnzIctYs5qdmDjNexCH6XjlPTSe915zwj5iqq9V8luXkvb5
         7nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA+W2iIOZyTuxfiY1E6tdbEkL6JPb15N04qIIGKc1Bo=;
        b=OEMGHQsga2Bi8sy9BZ9QcLahYVx67Aq2MnvTYqM3tTzs3zfm3JLRXFiUnzSxAq6iCE
         Mthwz2yfeZCkRcySoYt6JJbPe6eo8fKcjDJ+PsoL5tKOeG4FBpmWDPEEXXzkW/BukMTj
         aSabPATDqopqz/JtXyyPYBvBRsrWaO/K/4O/l7oHQLmdlbOmRYrSgTmiISnQxo25XpNw
         NVxo8FbCTcMAsPQZFmJyoCk3EAI6jNleffB/QKVlPkF30eaMcKajg9jrxBlAQDkKNB+Q
         TDVl9MtwekHPyrn4KRJbqtY+MGyyxSB2ZE5zA6q5oo1jl8GVsConZiFoOQIiZ0+5uyAN
         N54g==
X-Gm-Message-State: AO0yUKVYHF8FEYdN2oxLoZ3u3Wsho1nxeFuOzsc3Zt7CGbJPMeCazi8Q
	n8wRko341jaVRxjZyKLXazQ=
X-Google-Smtp-Source: AK7set9Ua413yrHnTvV7eGnWB8gqVZ8rPiEhK2aJcYr1DUcPahcls/IN6j8/3u9hoWhWels9ombxLQ==
X-Received: by 2002:a05:600c:45cf:b0:3df:9858:c03c with SMTP id s15-20020a05600c45cf00b003df9858c03cmr7827388wmo.17.1675981622191;
        Thu, 09 Feb 2023 14:27:02 -0800 (PST)
Received: from localhost.localdomain (93-34-91-73.ip49.fastwebnet.it. [93.34.91.73])
        by smtp.googlemail.com with ESMTPSA id l40-20020a05600c1d2800b003dd1b00bd9asm3573030wms.32.2023.02.09.14.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 14:27:01 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Carpenter <error27@gmail.com>
Subject: [PATCH] wifi: ath11k: fix SAC bug on peer addition with sta band migration
Date: Thu,  9 Feb 2023 23:26:22 +0100
Message-Id: <20230209222622.1751-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_142705_978604_F2484A96 
X-CRM114-Status: GOOD (  10.37  )
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

Fix sleep in atomic context warning detected by Smatch static checker
analyzer.

Following the locking pattern for peer_rhash_add lock tbl_mtx_lock mutex
always even if sta is not transitioning to another band.
This is peer_add function and a more secure locking should not cause
performance regression.

Fixes: d673cb6fe6c0 ("wifi: ath11k: fix peer addition/deletion error on sta band migration")
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/ath/ath11k/peer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 1ae7af02c364..1380811827a8 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -382,22 +382,23 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		return -ENOBUFS;
 	}
 
+	mutex_lock(&ar->ab->tbl_mtx_lock);
 	spin_lock_bh(&ar->ab->base_lock);
 	peer = ath11k_peer_find_by_addr(ar->ab, param->peer_addr);
 	if (peer) {
 		if (peer->vdev_id == param->vdev_id) {
 			spin_unlock_bh(&ar->ab->base_lock);
+			mutex_unlock(&ar->ab->tbl_mtx_lock);
 			return -EINVAL;
 		}
 
 		/* Assume sta is transitioning to another band.
 		 * Remove here the peer from rhash.
 		 */
-		mutex_lock(&ar->ab->tbl_mtx_lock);
 		ath11k_peer_rhash_delete(ar->ab, peer);
-		mutex_unlock(&ar->ab->tbl_mtx_lock);
 	}
 	spin_unlock_bh(&ar->ab->base_lock);
+	mutex_unlock(&ar->ab->tbl_mtx_lock);
 
 	ret = ath11k_wmi_send_peer_create_cmd(ar, param);
 	if (ret) {
-- 
2.38.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
