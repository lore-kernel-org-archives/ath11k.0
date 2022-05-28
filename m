Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BA2C433F5
	for <ath11k@archiver.kernel.org>; Sat, 28 May 2022 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TfI10asGMReNCRkrA3X1Cf4Yh9ufzHCNl7IA97kgVVs=; b=K5olKKoVC2V4nS
	2LaYEek57w7mqYaQpaJzS7U8WNy2ttEBMA99JS7CD8WfJRSM273PrkBrgDnnPhVEbJJvwOG/GdhNe
	wf9M7nTY80TYKeaWUzynZHwqEE5M0x+ZZAPUTw7ZrlENg9DB8VVnkA6pEryzfmQ48ij5vlatyjo0Z
	jxWTK0f7IAvYI7ACK+SrXwY0t7FRorsd4o5D8+3EJbNkyBdK01wHpAsM2T5oYprJUuYKgJSCQHnL2
	3yaVhBMOuxVkjMsdNovY2hyCQOw+QdL3t42uLjmUaT+rx1NRs6EX3KF0uDUhmofV8unAFI+yV/He1
	oC4BcEksiV+gotd1tpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuxOA-002GcX-Bt; Sat, 28 May 2022 14:25:58 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuxO7-002GbD-AX
	for ath11k@lists.infradead.org; Sat, 28 May 2022 14:25:56 +0000
Received: by mail-ej1-x635.google.com with SMTP id rs12so13372255ejb.13
        for <ath11k@lists.infradead.org>; Sat, 28 May 2022 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rhuLu/zc6OSTKdNFD0CtRWDuw0q1u1ps2N0Jk8WZLn8=;
        b=i5OtqQLUDHdTR+E/1nfw5rm0SWku8A2ArnSqQ5MjjVfEgdflXStu8Y5IxDokOjW33D
         QlrRLXuCgVl+2+6o3hbA6kEbWEuv2Qo+fAecaRwxgojMMJMLtgnm9o8pz4oNb6g3HKVt
         Uqt5UUwwT0IHLX0n6tNZZs+XyxWgwogTZfw1LwWFuVREg19Q/+OwuVRynsEl0BG2AKHS
         hmm1G8GupHgh3Pzu82gmDKH8xaetu1Vh/RGFPyu0F04baR9Zvq75I3MRDKj61TMPHVqE
         weffu4Glu1ZZ7hStiFx7/Ci6v9irO4LMJbUUyKIL/JdfB98VZ2tkz6uO6pzOjfBxtKZV
         i2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rhuLu/zc6OSTKdNFD0CtRWDuw0q1u1ps2N0Jk8WZLn8=;
        b=4aXXnjKJPvjm2wchHZB2UFibzfJskgMCXDKo/JxWQYL/PXgrt7xIbAzbWwduvR2WdX
         bI0FMuaXQhww+mZT+nNyYqVsIQFxeUbajc2mT/xNJlmmA7HkoLug6i1EDbS701pBdBmq
         6n5sotB67Bq4WnuUGCTa0Oytxv8ZloUtGGfg8ZC3fxNY0cvOj/Zw5nZ/b3IWN4Vb/i09
         TEMS2gK09PGjbbBYWjlYh18pqR07brdXI/X9vTxPsyA7cTMxrAaMibhxpkOL1vpMQaKd
         Qww5tA/hpaFx8ZaNhbcnWLhoM37wiKFNJTkJpKuomzw6BofxB4U7OZOxj8z0vr+x624K
         TQ6A==
X-Gm-Message-State: AOAM531n561LTFTMeXiWxLPifhntJEKlYVGYZnPsJKbEC1+fPfIWFDDi
	PNGgm6HiRe+OH2JNZObjXGs0PmtHo+M=
X-Google-Smtp-Source: ABdhPJyRFIGi2kNZzGDKQk8oaZCc1Y0dRXWTC/qPVxQZeILkTHiFhlp0g4V8NR7jRAlh3uX77gXLSw==
X-Received: by 2002:a17:907:162a:b0:6fe:c691:47f5 with SMTP id hb42-20020a170907162a00b006fec69147f5mr30975173ejc.289.1653747952236;
        Sat, 28 May 2022 07:25:52 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id m3-20020a50d7c3000000b0042bc5e8f7fdsm3601915edj.16.2022.05.28.07.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 07:25:51 -0700 (PDT)
From: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] ath11k: fix missing srng_access_end in CE
Date: Sat, 28 May 2022 16:25:15 +0200
Message-Id: <20220528142516.20819-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_072555_405621_B828D045 
X-CRM114-Status: UNSURE (   8.90  )
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

When a CE completed send next operation is done, the srng access end is
never called. Correctly end the srng access to make sure we have the
correct values in the srng struct.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/ath/ath11k/ce.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index c14c51f38709..665205d2322e 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -490,6 +490,8 @@ static struct sk_buff *ath11k_ce_completed_send_next(struct ath11k_ce_pipe *pipe
 	pipe->src_ring->sw_index = sw_index;
 
 err_unlock:
+	ath11k_hal_srng_access_end(ab, srng);
+
 	spin_unlock_bh(&srng->lock);
 
 	spin_unlock_bh(&ab->ce.ce_lock);
-- 
2.36.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
