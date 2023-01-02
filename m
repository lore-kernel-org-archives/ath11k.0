Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4A4C4167B
	for <ath11k@archiver.kernel.org>; Mon,  2 Jan 2023 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CmJVMFR0q4YtvlBp+OhKdTVv+W6wSE9dkIJv7l48/iw=; b=IQv1r1dVCpOYtp
	4/ZNcp1txmozz2BOzNgAp1EfSg7azh8tnJEcoZLSVv3p/71dW09f2LpKTVK2EjemefV6o5cfTfdMu
	BvY3DP1qysWmPWVNnzmBVtRYfk4/tde9mRhxkpp8oibi2+SSNOhHj44Uj+qEUDSlb5ZGyY048GxDY
	fdvAPw5LWl63nGQdJoMYBURPkDuRANhD6+JiuVhL1/oD4RVWvs/t/Mdxza5m5bxo89m4DcXOHuFgx
	K1qGxXpXiK6f+v9v4K9mvia0kxyAa7VLJRmwXCIakBgAOGfP55pi4V5ntF4/lsaB9jKR2NrXIdyf2
	ooM+gdRRGM/2zf1+thSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCFvW-009LVd-C2; Mon, 02 Jan 2023 08:12:10 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCFvH-009LRH-4s
	for ath11k@lists.infradead.org; Mon, 02 Jan 2023 08:11:56 +0000
Received: by mail-pj1-x1036.google.com with SMTP id ge16so25713405pjb.5
        for <ath11k@lists.infradead.org>; Mon, 02 Jan 2023 00:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xoAMGm4CGvulGlKzCI+T5yNGQVVBplAVmvUDydQXfE4=;
        b=g0YrG0K+HIe6E9s0E3k+f0UfLVIOE4dhrwK0h1beLo+prLcCLcbMoBAxYTOjCQcCD0
         wFau4LuG1IqnSrVVgPCi7hA/H+LTaJMjl7NFVwJJzc8nfTUfYvL67wxus/3RrlaBcdOD
         7PLtsjbqeJGBL3jUSamUIiFLnFdJCMwEOLkJVyKaHRb6vpmuRF4rAHCI4KIsssqIJ7CF
         z/1gpL1VQetrYPOCN2ByKr/i/SOTZYhGUmEQJ/RC/JhvMiXMyJVDucclgYtIzELuU8Uf
         vLM0h2nD3/i++P34kGtTkwPPzTQJ98JHsO26C48Ody/tI8dxAvX7kBBICO+EGB169O7d
         SE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoAMGm4CGvulGlKzCI+T5yNGQVVBplAVmvUDydQXfE4=;
        b=1C+/8mfk5WGvQ106wRb8+xOJG1KlXyWMNqIEOD/IK0+uf3v/ZM4PzT/IFjH2eXM7z3
         xYbnXHtCDYTnklRJ4DLcQVN2j8WCpmuYdNQy5x4K3HNY4YjzoWiDZa6uENkElcqezrZT
         9AYWe/FLLeKqwIAL4+jGooaSiK9OFOYEYfE/TI5Wf5RUE3mUTcuFJKUrYG6tcfjAsiR6
         YrKwuMJP6ViZu2KzxFC+EGKZqM5Eo9CPfvXzD7umrqpccdNMJuRJtCQlBsrOv7xqVMJL
         3amLiI1AmsaJpKKTR2lB8qLisbU3qo2KmqAB7ZginYSZSVuuo3FMqO/8BNxdtvqEMmTL
         ZOPA==
X-Gm-Message-State: AFqh2kqJsCgqWaFN3mAHzk28QBqcmdqx3jPswIJMVSG9VdnM1drt4PLC
	LQYSo09UfgtsMQtX51uvJts=
X-Google-Smtp-Source: AMrXdXuVvPcP9uxZ92+n+yZ1f4eQ0Oxnv6FSfkNmp7LL/1Xf01k25Czk/idkZV/0rWox39I2gxNyCg==
X-Received: by 2002:a17:90a:e513:b0:225:fb71:efc1 with SMTP id t19-20020a17090ae51300b00225fb71efc1mr24410317pjy.0.1672647112573;
        Mon, 02 Jan 2023 00:11:52 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id on16-20020a17090b1d1000b0020b21019086sm32585201pjb.3.2023.01.02.00.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 00:11:51 -0800 (PST)
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
Subject: [PATCH v2] wifi: ath11k: Fix memory leak in ath11k_peer_rx_frag_setup
Date: Mon,  2 Jan 2023 12:11:42 +0400
Message-Id: <20230102081142.3937570-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_001155_283410_223B4D00 
X-CRM114-Status: GOOD (  10.17  )
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
leak. Add missing crypto_free_shash() to fix this.

Fixes: 243874c64c81 ("ath11k: handle RX fragments")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
change in v2:
- add crypto_free_shash() in the error path instead of move
crypto_alloc_shash().
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c5a4c34d7749..0c53d88293eb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3126,6 +3126,7 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
 	if (!peer) {
 		ath11k_warn(ab, "failed to find the peer to set up fragment info\n");
 		spin_unlock_bh(&ab->base_lock);
+		crypto_free_shash(tfm);
 		return -ENOENT;
 	}
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
