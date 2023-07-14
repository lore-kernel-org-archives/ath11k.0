Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950A7C001B0
	for <ath11k@archiver.kernel.org>; Fri, 14 Jul 2023 00:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EgsKWhwf9I4eVts2YZiRQsuOLkkYNftbgG54xv2V2fQ=; b=3s33HWm365Af2t
	toPolEd32XlfhRRmanlY3l6dXVOA1M56Zbn8bjTdjyEsCTpz5zGMTajTEMmfkp7MMhnBFGiDExbZx
	WTjS9SbqdGQgp9S1eghbiTof40ngMHQHNgypqkkK+d6MTqz4gwfwR1OoLEDb/7YWzxpxrn0EzsiTn
	+Bk2+SGdrT20qHqDCrnc4RDZvvGzsO42Utkjns416u6rbfL7C3Q/UW1Rc8zEFxOQKJqZiMgyvTWYQ
	hciSjZy54BjSuSc4zplFXoDX6Qr2N/zI6qU17YOcWFcdOapKke1otJnp/xDpWrhxOQSMawasoIAds
	CZ0mtUiBw39fagvwEaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6PO-004c4A-11;
	Fri, 14 Jul 2023 00:11:42 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6PK-004c3N-1P
	for ath11k@lists.infradead.org;
	Fri, 14 Jul 2023 00:11:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-55b0e7efb1cso803289a12.1
        for <ath11k@lists.infradead.org>; Thu, 13 Jul 2023 17:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689293494; x=1691885494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vqUOvUXa8K5Wx+m88RxVlwrv8R/El1ZGP9GFTtwjCI=;
        b=W5MkhmHGhYTWevAnklGe1SJrBEc4X86lBc5Bt+8KOBXcZkq7R6Cx+JcbVv9i/q48n4
         WD/oisoaO0vnhgPjsp2DFBOfj+qrTSqSkBCX1am4CqVzeIk/eEM1+60lInYo8I55uQDO
         TBVZ8TEgF1B+ulcfQTP8Eiqf3zonk3AAXhyuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689293494; x=1691885494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vqUOvUXa8K5Wx+m88RxVlwrv8R/El1ZGP9GFTtwjCI=;
        b=GGmgZgkzgoJ/4iNbhX6P7xxEcTqlC9mp3zNfhGH0aJsmRn2/nm60Xl7qnnmtrGMHNH
         bI3LdiJKVWZ24V8n6+OD8vA6JEW2NaMqsS8YiBlkqF/oOts3hpPOrsm0pNe7Ov5TESUC
         nE+zR8fkuvEqhFeZjbDQkTVnaqet9o+o6BxvYnA6hqJokeF1fd56S0iWJL4Y+Y0P9fo2
         zn+M51NIUCJXpBV8hmtWIGuHKOwMOMJhoqYQfl0wYyGnvJDOmFEIEBSqFtgla5QOnNNZ
         52ucVb8ZWhG6xPUJXuMbrKWNChpxXjVkASP0S99qxZl7DUYf69Xk/eaWv9V/jEe6HjzU
         TX/Q==
X-Gm-Message-State: ABy/qLYYc6eiQaH9BFO+frQ3TjzBtSRFenh9FOuxAQAzH/oJgrfQ5BTc
	6EhyGT1Fb7+JtTtbFcYcJE46RGz3w000VxBzDZM=
X-Google-Smtp-Source: APBJJlENggqfPIe1kAkA+PQdxXbJ5uO5HJuxYrC+uu2Rnd73CEg/zX2p1g9IRDhdCcV6yQj8/SaiFw==
X-Received: by 2002:a17:902:c40f:b0:1ac:63ac:10a7 with SMTP id k15-20020a170902c40f00b001ac63ac10a7mr2825431plk.68.1689293493801;
        Thu, 13 Jul 2023 17:11:33 -0700 (PDT)
Received: from arowa.mtv.corp.google.com ([2620:15c:9d:4:752b:86eb:10d6:65b4])
        by smtp.gmail.com with ESMTPSA id 20-20020a170902ee5400b001b81a97860asm6444207plo.27.2023.07.13.17.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 17:11:33 -0700 (PDT)
From: Arowa Suliman <arowa@chromium.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Arowa Suliman <arowa@chromium.org>
Subject: [v4] wifi: ath11k: Add crash logging
Date: Thu, 13 Jul 2023 17:10:54 -0700
Message-ID: <20230714001126.463127-1-arowa@chromium.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_171138_519047_DC8FE8DE 
X-CRM114-Status: GOOD (  10.67  )
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

Currently, the ath11k driver does not print a crash signature when a
crash happens. Checked by triggering a simulated crash using the command
[1] and checking dmesg for logs.

[1] echo assert > /sys/kernel/debug/ath11k/../simulate_fw_crash

Change the crash logging from debug to informational and add a warning
when firmware crash MHI_CB_EE_RDDM happens.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Arowa Suliman <arowa@chromium.org>
---
v4:
Shift line 329 one space to the right to fix code alignment.
---
 drivers/net/wireless/ath/ath11k/mhi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 3ac689f1def4..025fa58b1503 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -325,14 +325,15 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 {
 	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
 
-	ath11k_dbg(ab, ATH11K_DBG_BOOT, "notify status reason %s\n",
-		   ath11k_mhi_op_callback_to_str(cb));
+	ath11k_info(ab, "notify status reason %s\n",
+		    ath11k_mhi_op_callback_to_str(cb));
 
 	switch (cb) {
 	case MHI_CB_SYS_ERROR:
 		ath11k_warn(ab, "firmware crashed: MHI_CB_SYS_ERROR\n");
 		break;
 	case MHI_CB_EE_RDDM:
+		ath11k_warn(ab, "firmware crashed: MHI_CB_EE_RDDM\n");
 		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
 			queue_work(ab->workqueue_aux, &ab->reset_work);
 		break;
-- 
2.41.0.255.g8b1d071c50-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
