Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE4FC7115B
	for <ath11k@archiver.kernel.org>; Thu, 19 Jun 2025 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pki03gT1X1YzuKfpbdeTT2NdVOKEL87eulb7qk78kEs=; b=a+qFKejy6IaVv3PLrurhRjewy7
	xZeTVnO8RIX7XFLTMXy5ut6YhsPtuJ4zZH3srNCsW8pHhMOvfsCeRibsbzZLfNUdi8XjYX1NUQcFm
	0yTlIRusPCSethZ8NlsROtYIT1LP/+L/+dEOOGKoB9yl02mgroLuribIx+oZizklIT92KC5Dgq9WB
	cNZMERZ4tyaJFOJ0pitz2AeO4XKXHvg01tbxNabZ3PA4uMJI59ThG95xixiRLM0dPHYNkmMwl1hO0
	Gv8N7rf78kZtbMl9Om/ENnBO/6Xq5LtFvnHRoNimY4ioW+VtP/vGcZ3JhOLBL2DQ0aA6nh3fSXS4V
	fs1Tgrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAsK-0000000CTCx-1qtr;
	Thu, 19 Jun 2025 08:44:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAVd-0000000CPzx-2cPm
	for ath11k@lists.infradead.org;
	Thu, 19 Jun 2025 08:20:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45347d6cba3so1148785e9.0
        for <ath11k@lists.infradead.org>; Thu, 19 Jun 2025 01:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750321231; x=1750926031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pki03gT1X1YzuKfpbdeTT2NdVOKEL87eulb7qk78kEs=;
        b=bV/ZxnAhhSak4I1+AFhtxjZV2axB6uU7Qdz2EYKhPW49JHqHds28HW9vZcQkdgRXx6
         1e4QPs2Uq4zgiiO0INfWTw+mO7cbRVTQvlBy1W4PAXqJIrjqOdisMl/d4fD9D+yYPh0E
         ZDFz3p5acS0M0rCWIMs+erLzcrZkj/z8Z3grgfwA5fyiApF1p8xFQq44pC5TLqLDzCnb
         B3DZPGSKrbvMoHDDBfHb/WxsIgDwwBS0Zq46Ux8NxXrWQ1ha05VVC0JakVioVroxg3FT
         5/gb5nGjAXM+4dOyZXm9W2QyoavymdzobPEweXlrjZm1DKbAoQWnJ00VBBERk+Z93y9s
         SuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321231; x=1750926031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pki03gT1X1YzuKfpbdeTT2NdVOKEL87eulb7qk78kEs=;
        b=TwhQSHdfr38XTdLyih6xKU5SxdV367ka8rFukFDTop/RK6azo9bV1gbUFnjlJ6Cqnm
         HONxU5WYt/rQMXYZkCB9IGaCCm0MrG3wpxKXB5VJxCp/nG2Jvf+m/h1mIeY0NApheD/a
         iKMSVdsv9JgR2uw4dwmdmetRdVfJrTlQq55XBX9w/GnxD9SW6hmK0qiMlyXEkHaNHqAF
         y3EitFHjb1Ui3fdUSmzhxRtO8GUC1j9Nad78qJlsSDuYy7mKc7V9zE+k55sF4W+Nzun8
         2J3HHvQHvRt49Lmst4WbOnnr6njP8B9ACQOdCEh9xCwYxJQD5A2HiVfNKlWlVRzMOH/x
         sw7g==
X-Forwarded-Encrypted: i=1; AJvYcCVP+FFTnBgb7oTmowKpKZliAdcb8KXgUp9/aqNN0UVJOHbu7axAajLSdRHF03h88iKj7CEwjjE=@lists.infradead.org
X-Gm-Message-State: AOJu0YznKYP4Nj8Zyh03oFB5k3UJMdGwmhTW2vRMP5SgVixiSSYUJJYz
	Yet9yOdf06engkkl0d7Rp42lhgwDM0Im/s3Bv5EhxfQYxIY4vVGdB7GQaZpfik6EOBqyZw==
X-Gm-Gg: ASbGncthhlGSKH0K1zbemxX2+/X6tqm6MU+2PobQvl876s8Me0FaLbNegrmMT/SFFAJ
	59A3mMXTO5xp5YEAA8FdxDrrthSZxPr4CXRUlvv21rAOcPaJ24yvZ8+bYPYWmTk8VRIhkv++YXD
	c1E9SXodg6R86G6LpWXs/Jep+4DFcy2t5NFhdi+CW/yw26BC/DlkRrTqpou9rWbS9lxmN6Hs5s6
	hFXmCzGXVpe8X6uEGBYNvyRtYCbkOyc1XbyKvkdNcuntJ83duS4HCyGXTi211VLRuWXcCl3Ljin
	y5KHQry72RqCGa30R1g6VCVJOnlAw+DGZdudR3T1a92SCRHcvnnUNNnwcZBT
X-Google-Smtp-Source: AGHT+IHBETxa/0ep34g4jXorSLAAvGUjs5el+pd3xXbuTb2u9h6HMFdh9M7fitPzbY3gq3z1MXzylQ==
X-Received: by 2002:a05:600c:8b2a:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-4533cb488b5mr206420795e9.17.1750321231352;
        Thu, 19 Jun 2025 01:20:31 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e97ac0fsm21574075e9.3.2025.06.19.01.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:20:30 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: ath11k: Make read-only const array svc_id static const
Date: Thu, 19 Jun 2025 09:20:10 +0100
Message-ID: <20250619082010.1834109-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_012033_663485_990BB99E 
X-CRM114-Status: GOOD (  10.54  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Don't populate the read-only array svc_id on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/ath/ath11k/htc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 23054ab29a5e..4571d01cc33d 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -497,7 +497,7 @@ static u8 ath11k_htc_get_credit_allocation(struct ath11k_htc *htc,
 static int ath11k_htc_setup_target_buffer_assignments(struct ath11k_htc *htc)
 {
 	struct ath11k_htc_svc_tx_credits *serv_entry;
-	u32 svc_id[] = {
+	static const u32 svc_id[] = {
 		ATH11K_HTC_SVC_ID_WMI_CONTROL,
 		ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC1,
 		ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC2,
-- 
2.49.0


