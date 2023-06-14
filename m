Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434F2EB64D8
	for <ath11k@archiver.kernel.org>; Wed, 14 Jun 2023 02:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4SRyIUALihM0jIIULRrpifb21RNWNCMg64pfeRXMwWU=; b=4DstkyCFmvoNiu
	CuIJmS64i2JiZtaoXXsCohmKnJpI8lO1T9Ge0tX/5RzW00Y3xBlk1Ilri/rXi7LXQs1SCGnhp3bhE
	F8w45ns/QZYP3ofT8tZ0PdAQRED99xVr4MfLtRGGOD2Sg4pZVfNlSgZiw6RdETW1qwErXTbjASToX
	p/d/Ad83z2w5UX3uFG6JQd+/xjnb74o1ewVEsSmJ2qhSaL1qV0PA3KdzrFwvScQF6g1JuPb8rXgGI
	lZC+p720hihEnHPq6oxPAZcAfNSJCgBlb5qMjOmHqSJJE16nP+b9zpdOjramS5a4mS3MqCzzFLB3A
	5+GysjY8lNjcHGv6ajZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9GIR-009jwp-0G;
	Wed, 14 Jun 2023 02:31:43 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9GIL-009jvv-0e
	for ath11k@lists.infradead.org;
	Wed, 14 Jun 2023 02:31:41 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-65314ee05c6so4986235b3a.1
        for <ath11k@lists.infradead.org>; Tue, 13 Jun 2023 19:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686709895; x=1689301895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mu/bzW4YDRTXm6cR+TpzVhop9QR2G5AavGdzqjOazgY=;
        b=CIBXFlsyyvLzoDaN7H6E/wd+00XfAF0g9EX9xwNGyTqg6+QxcnIImu7jienSY96tvh
         cHZUIKNO7UactgKINOgq5yLRLr5QbwvRzqF0dD5EaS+lXasnRMshYVDNN71XJjH7cODB
         BSZzuQUB8M/GJRzYV0zhvF4aqQKsHteycngSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686709895; x=1689301895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mu/bzW4YDRTXm6cR+TpzVhop9QR2G5AavGdzqjOazgY=;
        b=lyXdzPhBPBBN3DZXik+D7uAs6HvHPf4IBGpXdVbaB13XWsGBVCxddPc1PsQxzmvwGo
         kaY8Pkesitcyb4KS4QYwOVZpdu8Z4QXAMG1alZIGQqru18vUKAckrJb2NjKFDYqlR7Xl
         kxPLTMYsnv63L3olL/7J89FXsb2suXccxow7zJxYLpVS5U6h6CF17wnMw/Tvjp5nyPHq
         saBsqUD9yd45KhcsQEJY/htWU2pg9PFCX12GpSXAk0DfoIFdHdvFHFN6diseedR65K6v
         rXlYma7UXEbgqmPOZd/m2oVMLSCZvvCICchH53OrW1bI4a6Keb8btrypHTZ13X443ypi
         ZTkw==
X-Gm-Message-State: AC+VfDwOcQwxmOPbx6szSWUOe9pCAVeqffqkWhLO6/iTuhRgvG+pJhUX
	nM6yjxyVaIHldZsUzZ7ZvyGBKfD0/SSPJ0Tf63k=
X-Google-Smtp-Source: ACHHUZ5Na9d99FoDjfvef6vmvvuaT/Z/e+4nMGfzYxgfLHB3qyMNZ1tx0r0QKI9Sr/Oi2gRpMEI1aw==
X-Received: by 2002:a05:6a20:a10d:b0:111:97f:6db1 with SMTP id q13-20020a056a20a10d00b00111097f6db1mr904632pzk.19.1686709895330;
        Tue, 13 Jun 2023 19:31:35 -0700 (PDT)
Received: from arowa.mtv.corp.google.com ([2620:15c:9d:4:7237:6c0:a6ba:d618])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902968300b001b0266579ebsm10850714plp.194.2023.06.13.19.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 19:31:35 -0700 (PDT)
From: Arowa Suliman <arowa@chromium.org>
X-Google-Original-From: Arowa Suliman <arowa@google.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Arowa Suliman <arowa@google.com>
Subject: [PATCH] wifi: ath11k: Add crash logging
Date: Tue, 13 Jun 2023 19:29:41 -0700
Message-ID: <20230614023125.284218-1-arowa@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_193137_284541_8518750E 
X-CRM114-Status: UNSURE (   9.51  )
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

Change crash logging from debug to informational and add warning when
firmware crash MHI_CB_EE_RDDM happens.

Tested-on: Qualcomm WCN6855

Signed-off-by: Arowa Suliman <arowa@google.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 3ac689f1def4..fb203e7c962b 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -325,7 +325,7 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 {
 	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
 
-	ath11k_dbg(ab, ATH11K_DBG_BOOT, "notify status reason %s\n",
+        ath11k_info(ab, ATH11K_DBG_BOOT, "notify status reason %s\n",
 		   ath11k_mhi_op_callback_to_str(cb));
 
 	switch (cb) {
@@ -333,7 +333,8 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 		ath11k_warn(ab, "firmware crashed: MHI_CB_SYS_ERROR\n");
 		break;
 	case MHI_CB_EE_RDDM:
-		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
+		ath11k_warn(ab, "firmware crashed: MHI_CB_EE_RDDM\n");
+                if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
 			queue_work(ab->workqueue_aux, &ab->reset_work);
 		break;
 	default:
-- 
2.41.0.162.gfafddb0af9-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
