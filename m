Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BB2C4332F
	for <ath11k@archiver.kernel.org>; Sat,  5 Nov 2022 19:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=plEJUifP3jx76BTP0JZEtL/llTBggBWUpn9sRTa7wLw=; b=3RQXnVONT22T9+
	ge6Ya2YBt1VJbqAjNXqheX+LvPjSn8MJkp4tlcJvY0GOb/skJovVyXFSB3lB/XTvIuMtW1cKekp2H
	xPo6/I7EhpCfbar+ZqY02IBEYsB1LwfdImTNmUZYUS7SIHV1F428165X8Wp2uizqg9tzIp1wUdMxs
	l5StJHRo0alLFY/mSPlaf/+jewM0LPK8ODJnvbrnG/3d3Q5j2FgbDd+fNQ7TsU8ndra7IjgPRW+nN
	anxKrqqDM7BMlVh3pV8is53j/iKKshwjgDfihxslIUfGtLXAbQ1xBy/MuCkMeIX45ZdeUPMo2tZeT
	9gshCH7NVc7YB8AFHqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orPAx-007BW8-M4; Sat, 05 Nov 2022 19:49:55 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orPAs-007BT8-7V
	for ath11k@lists.infradead.org; Sat, 05 Nov 2022 19:49:54 +0000
Received: by mail-ej1-x633.google.com with SMTP id n12so21022095eja.11
        for <ath11k@lists.infradead.org>; Sat, 05 Nov 2022 12:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNGGWZ6zU750lS4mF7crv8Fbn/LeLMY1NyuuVpO6zPs=;
        b=Mh8FZiBPjmFaDt7ZQlPySqFcz/LaxiIfgNYqwSCg2uSzNCiedQL/UTmXUyJSf5WcVd
         hOE+gJ3rQtKn7FzK4lWyviGpKV4yQtUKwZ+2EJRBfZxrTCdk8NbkKughVGPfDKBHzdoJ
         Ni5J+cNbeEL6Oz+w+VbghkhnN61a9HaV6Qa85wzfG1/HKaUbmjYZkJzzi278/2NDotjl
         5fhoiFh2UDDIz+/TUOVkq8qLMDQ0vzoS67KEBuDDPG6urdOfeiPv2kYYVodhGcnqtVrr
         yjpEFKcSPGEy6h3NIpYSkb4sjKsEOGY8O8s7YPv0ARWyvkSii9EF1m7D9em+YzPwcMid
         PKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNGGWZ6zU750lS4mF7crv8Fbn/LeLMY1NyuuVpO6zPs=;
        b=wtX9UzCYuldyHB4cIk0oRyTYbJ+wplSUfK6VoR+IHlBkX2Z96GGiyQShoMSq7hZTYV
         alSAlx2rMzKwHInIIafC5+bwdkB19BwoLWeXf6Z+NrZztlSY6LiHj1GNo6LK97Y2casO
         wST+Js479iDmUqHEDmzZZei9iCCGEaVs7sb8ek4OUpnnfFHQNI6rMQ51ee2469ZodKvU
         yRkjn0Kl0hLj0opa/2Y5dLXufC4SAdPciOhikGx6eN0PV/PRcrjp6CBQ45o0DPzwaeyw
         guKHW9I4ck2peHvGVkuDGE6acHBATRR2xHw1AzIG1xfnTSfx4iUpSDaWeJAjkYrx7H8l
         XTGw==
X-Gm-Message-State: ACrzQf3aiOJese45SS3sYTrHHxLxECWSV3C8SiDRYEdcXQ9hla/o5QWM
	YTPbp1WDFuZW76qt8iGDzdU=
X-Google-Smtp-Source: AMsMyM4PMnBmGhge8boYpR+/vT7VI0pVYOR28ruySN7vCrXt/Z6nw4oy9Hj6y6GGngNX0EON3MI3Ug==
X-Received: by 2002:a17:906:847c:b0:7ad:d6c8:35d7 with SMTP id hx28-20020a170906847c00b007add6c835d7mr30749561ejc.170.1667677787252;
        Sat, 05 Nov 2022 12:49:47 -0700 (PDT)
Received: from fedora.. (dh207-96-23.xnet.hr. [88.207.96.23])
        by smtp.googlemail.com with ESMTPSA id et19-20020a170907295300b0079b9f7509a0sm1289409ejc.52.2022.11.05.12.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 12:49:46 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: mani@kernel.org,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	elder@linaro.org,
	hemantk@codeaurora.org,
	quic_jhugo@quicinc.com,
	quic_qianyu@quicinc.com,
	bbhatt@codeaurora.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Cc: ansuelsmth@gmail.com,
	Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/2] bus: mhi: core: add SBL state callback
Date: Sat,  5 Nov 2022 20:49:42 +0100
Message-Id: <20221105194943.826847-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_124950_291113_DD8CC4C0 
X-CRM114-Status: UNSURE (   9.01  )
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

Add support for SBL state callback in MHI core.

It is required for ath11k MHI devices in order to be able to set QRTR
instance ID in the SBL state so that QRTR instance ID-s dont conflict in
case of multiple PCI/MHI cards or AHB + PCI/MHI card.
Setting QRTR instance ID is only possible in SBL state and there is
currently no way to ensure that we are in that state, so provide a
callback that the controller can trigger off.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/bus/mhi/host/main.c | 1 +
 include/linux/mhi.h         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index df0fbfee7b78..8b03dd1f0cb8 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -900,6 +900,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			switch (event) {
 			case MHI_EE_SBL:
 				st = DEV_ST_TRANSITION_SBL;
+				mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_SBL_MODE);
 				break;
 			case MHI_EE_WFW:
 			case MHI_EE_AMSS:
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index a5441ad33c74..beffe102dd19 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -34,6 +34,7 @@ struct mhi_buf_info;
  * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
  * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
  * @MHI_CB_BW_REQ: Received a bandwidth switch request from device
+ * @MHI_CB_EE_SBL_MODE: MHI device entered SBL mode
  */
 enum mhi_callback {
 	MHI_CB_IDLE,
@@ -45,6 +46,7 @@ enum mhi_callback {
 	MHI_CB_SYS_ERROR,
 	MHI_CB_FATAL_ERROR,
 	MHI_CB_BW_REQ,
+	MHI_CB_EE_SBL_MODE,
 };
 
 /**
-- 
2.38.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
