Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF85EB64DC
	for <ath11k@archiver.kernel.org>; Mon, 10 Jul 2023 23:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8P6n2KJ+FHG0qUJyFpYgv2f83R6Zo5WPkXXiZf5ojWQ=; b=fEfChJhU8RCP9T
	KTdCFcO/OEDEgW7R9Y1bZ0jBEvQNj1ro779HKShE16DGFg8gfXD4wHWxiyXZDACunqWUOP6kWIec5
	jDLdlP3iD4/7ZkfxxvN/jsRfQMQlpnteu3wtp3i75udLCQXW2gHunbtwnu8F4WvWjW5vQfYwAZxXR
	JONCptxf75dxE6xhj6ZXX/KnBel5ovHAg30e0h4USY2XvjIvuGT+NO16gbKFMdhSOGX+Y74yUyQXk
	Cm3tmnSZl/RAt1C1VCF52xgq17FgSr8yFz07t5Pb6sVRlMfMZ7Jv3xIsAtqHuq036eApGdoUapXaO
	nr83vXRleqRoWcuyLChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIzxC-00CuvW-0s;
	Mon, 10 Jul 2023 23:06:02 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIzxA-00Cuur-0E
	for ath11k@lists.infradead.org;
	Mon, 10 Jul 2023 23:06:01 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6b74e2d8c98so4445407a34.2
        for <ath11k@lists.infradead.org>; Mon, 10 Jul 2023 16:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689030358; x=1691622358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kdB0Zjv6MHxg1jrCOxa5nOK7H6uTbKe8bxREOoXZ/8=;
        b=KD7av0sNv+y/rnfGiRqoMlQj57lQXBoY7teeOYOH9jC4tLFy7ZNa09c8VdwrwZwGxK
         Yaw+BPsT5QOaMdw3APWhed+lAsBHPdJe8XP6D0ofn4Gtpgar32OZtgNVL6c5w7961h7v
         dBC0DTfESJabyowoDk8ib4+fJR3xG5WPA6lNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689030358; x=1691622358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kdB0Zjv6MHxg1jrCOxa5nOK7H6uTbKe8bxREOoXZ/8=;
        b=kVXrWZvPLfOP0wrReA9aSFm4BhGct7pS06t/opa88i35rdobV0y89ubfNnRg5cv36b
         aLsJySukIXp23CKaQw2cQyH9T6aIh8jwoJdO0fz802xAYfjwG3snbVaVHXGRRHoA+06Y
         AI1B9135j6MolsyKr2tAmPzqGGdEypJJWuE3WOD3uv0isuikbdqLwfLOacTme6m/Kv4f
         q5yhfTGkcXYWgge4xEIvUkIna5J4tU9Lgoph4FpTIV4wa4hvTpqG3yo1UjvOFzEgrEkH
         VMiM3ejsK5YBlvQEbFI++DgdF63HfRbw9vJGd9XDfmWcdNno8XL2iPAOqe+lOUzo2ApE
         9Cjg==
X-Gm-Message-State: ABy/qLahDlYOSoV80nJSjmmP0lIauRW52cERuFd26ewoNCQ2Oi5tlu58
	I6d+vdTlp/Qq/KabjF/HSf91o3XVkFf6f+jy+nE=
X-Google-Smtp-Source: APBJJlFsyIeItqeqTbyIX7LVYMFdu4mDKSTHQBbMvpo3712AvbnzfW0w5FdFkj5sXvtKxzvfbKv+kQ==
X-Received: by 2002:a05:6871:60c:b0:1b7:15ac:ab9c with SMTP id w12-20020a056871060c00b001b715acab9cmr7269757oan.36.1689030358074;
        Mon, 10 Jul 2023 16:05:58 -0700 (PDT)
Received: from arowa.mtv.corp.google.com ([2620:15c:9d:4:816b:4512:ab1f:a663])
        by smtp.gmail.com with ESMTPSA id z20-20020a17090ab11400b00263e1db8460sm6768947pjq.9.2023.07.10.16.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 16:05:57 -0700 (PDT)
From: Arowa Suliman <arowa@chromium.org>
X-Google-Original-From: Arowa Suliman <arowa@google.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Arowa Suliman <arowa@google.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] wifi: ath11k: Add crash logging
Date: Mon, 10 Jul 2023 16:04:53 -0700
Message-ID: <20230710230546.3544912-1-arowa@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_160600_126058_79CAFA75 
X-CRM114-Status: GOOD (  10.04  )
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
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306141105.c1e82Q0y-lkp@intel.com/
Signed-off-by: Arowa Suliman <arowa@google.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 3ac689f1def4..5db4b61c1cba 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -325,7 +325,7 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 {
 	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
 
-	ath11k_dbg(ab, ATH11K_DBG_BOOT, "notify status reason %s\n",
+        ath11k_info(ab, "notify status reason %s\n",
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
2.41.0.255.g8b1d071c50-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
