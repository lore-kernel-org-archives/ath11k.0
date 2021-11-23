Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC6EC433F5
	for <ath11k@archiver.kernel.org>; Tue, 23 Nov 2021 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OfaCRDLMvAc1cSUcq+TBUbCLpdMSaeWXdTDhtLdoHH4=; b=kKuy527/cj6v75
	4jaxj7jUpESfNhZHWkmugpknM0rFQPpFIGwv4V9RwihLchW8HHQkfU0AyiluJObmGrpXmt7ByT6Wv
	DIox1JM57at3SdlVp8GhoUnKwumMaRDoVykR7ts+0b7M/IL07Y1kIAdAlIDsM0G5XSmd+eygj0BMU
	ZKh+lszDv8tSKh4Ssy7IAYdc8ZxerxCwn0oXE0AXSTvacs37YTC9glGhNwCLjDn3AhGDeCQRyU9IV
	JH8bKbCOaV3RWCuyWYIAuGyGjHmpTwWt9YGzhp75k54fQwY8cP0+ff4DRmX2LXe6UH4TGUt6YxBuJ
	1BsGqiC/F0ulbtx5Jzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpRjE-001PlE-6w; Tue, 23 Nov 2021 09:04:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpRj9-001Pi7-TW
 for ath11k@lists.infradead.org; Tue, 23 Nov 2021 09:04:37 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso1525749wms.3
 for <ath11k@lists.infradead.org>; Tue, 23 Nov 2021 01:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ppn9KYLUktOj/QHnYjHMY0C4/1wB69v7mQXRVYA/g4Y=;
 b=o3yiz6KS56n1KvcbD4V90lY6AM4keEqI3UDlSmzQaVjXaoLrNS+emTSeQrwYZjIRqU
 Zv9QRPk6/0GrzsdELd6pup67/1OV/OacG95FwvFcVVRwr4SMAGHr1yHoDyIgGwy4B/9d
 YP0HVqeAmGfH7z9/iZ85Q/9fqBBcRzbw7Lo2m1DMV8hOQsz55KKV1rHivN4DbadDBgsu
 iaKI3K0M4iW9HK4vHigm2KFRgkhdSZrkI9/jbYBVWGWMw63dSDQHMr7o+8RhgSyjDZDG
 WP9/qiZBMcpVutKsp079TQMn664M4KjrQdagy0F2+cCLpHW/wdH7v9Rc5P3tNNSruzhM
 WN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ppn9KYLUktOj/QHnYjHMY0C4/1wB69v7mQXRVYA/g4Y=;
 b=CuuXdShZEBG/sOe2+B+gjyExNiEOvfmpY8JMFbyUSW1FNDoHnb3Hdu7vlRrs0+UIIs
 SXEQcWpvlZQXP982c/cL6ap5tV2yPWqFovCs03Q+7gQvQNQ7Ay5N8MSZIU1HYoouTJ5c
 ys14GP3nDRxp45NjYyRnBMQZXJGScuP7XRGSOLP+HWGCmaZeNabiIR2/Gk2t/93ti0je
 P9tUzxFRWc6fqLSOtKwTrT1cKeIQtW0lj7rePNeKMnoQN58QPgQrEmy1pp9dqAU7hgLB
 /Ta17D2/U3vbFdi9evk76YJLUOq3hS4tUIjRhEg/NVAjAaUvB1J/z+ewKdYT2xoa/+dR
 5X4w==
X-Gm-Message-State: AOAM530BYHsXppWx5SSTl6s4+0dxWkJLh2EyaLSdzuyfjF3oNgAPKbjS
 PNvuFCPbkopI9JE3Uj0tgi/8
X-Google-Smtp-Source: ABdhPJzScrp7Z8emr48dP+PHr9nk5Cky63LWRFXInhaHtMM5KV1lgpMtaaQwqIpZ58OCN6mnNdyPKA==
X-Received: by 2002:a05:600c:2242:: with SMTP id
 a2mr1025016wmm.141.1637658273393; 
 Tue, 23 Nov 2021 01:04:33 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id t8sm532590wmq.32.2021.11.23.01.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:04:32 -0800 (PST)
From: Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To: Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ath11k: Fix spelling mistake "detetction" -> "detection"
Date: Tue, 23 Nov 2021 09:04:31 +0000
Message-Id: <20211123090431.165103-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_010436_005396_FDE6551F 
X-CRM114-Status: UNSURE (   9.57  )
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

There is a spelling mistake in an ath11k_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 614b2f6bcc8e..24b74a373df8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3506,7 +3506,7 @@ ath11k_wmi_obss_color_collision_event(struct ath11k_base *ab, struct sk_buff *sk
 	case WMI_BSS_COLOR_FREE_SLOT_AVAILABLE:
 		break;
 	default:
-		ath11k_warn(ab, "received unknown obss color collision detetction event\n");
+		ath11k_warn(ab, "received unknown obss color collision detection event\n");
 	}
 
 exit:
-- 
2.32.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
