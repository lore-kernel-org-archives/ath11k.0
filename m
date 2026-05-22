Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23351CD5BAC
	for <ath11k@archiver.kernel.org>; Fri, 22 May 2026 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=; b=j4GmVl6c25Sy+BozM8P/HF5TgE
	p6jIzTp5OdOX9OYYVjQYk69idSG0tFz10JQkJpxtGdnuRN9oIuHiArHF1yeD1FyMIlVB3yF3YLTmE
	5R47bWM8npuh+orYRvZQPYRLiU+MJXQEtQYrPi+CF8hSwFSZyeDkLy954vNDEARP7IOaxl5KQmpg1
	7PoQz9bbNz3ygFcU+p2Ww/w0sE+B9wSqFwK+rXuPUVqPE2wy0RFs2NnKvPGllAFMYFJdh4KE1CH+V
	I1W+MC9rUd0QkRcfvkR3tuBn8FEgHgYQzzOCpRjWJJkBG9e1n9KesfoBIEYiR1OhEqtkMUmCM+f1f
	+HjqQaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMgf-0000000AOzL-42oN;
	Fri, 22 May 2026 10:01:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMgd-0000000AOxi-1n9l
	for ath11k@lists.infradead.org;
	Fri, 22 May 2026 10:01:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7VmWY779158
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=; b=eHh7X2gGrSZekNOb
	xkDmqbEW54k9aNsjuHmVMXxsX8I8pWfkpIefqSA1ncFswM3zO7mNthHR9mPKM43H
	gdAmQwJvnzvcpAHEzUyu5HWmyqySgPIKvuiNNnXArB1Dm6Ws4O1XZvQdrUbrb0rM
	e5nH7dsWC7/h2UU/D6aL/v3gFuGWLccts+1ZPuEuleYzrW0DdofrlBxGwwdzeXO1
	n2Hx1KrVjELW8du55RA5vhG3FBDWrn0xMTbfzGDQr2TFvHW37LDxACLaIp8TgmjJ
	581P1XwAw4f3uPjgmxmq5AAPMezvBPq0QMjka/UXu0OVM2KHvs1t2VIbYinr6PTk
	RKTB0w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at5s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:00:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so9033024b3a.0
        for <ath11k@lists.infradead.org>; Fri, 22 May 2026 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444057; x=1780048857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=;
        b=MPacYP3KBrNcTrKxg9oujVdN7kx8rnxmatL99hj4F8OJgjXs6wL0BCZJZ/mx2g4JlI
         2/a02dhYxv1Hf3l+qVSAjOAsoHa6y4zoFeMprkrSF4l6jeDIQKaTu0+NmRAzJrrUlMKE
         CVlZ5CPWsHWX2XXZtIWAffqtBFvbYUlKCF/n2V2CS7BfWTw7eM9EKuvdeNA6Jli2CTjk
         c+6tPxpvr0PXypUlp1IKWsHwlsLYSgk5+FlifyUbf4RXlPCwMf7yG2JUA81W6q15N9oY
         vW+GWnMnFO9a7OF091r4YmPp/n7m97uj4VuIfrSYIZUcBY6AP+G6bNCV7Kt3DbP83c4P
         IQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444057; x=1780048857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YR4rbS+4WUMiEynV2sZr8pSzcK/RqiAN6yJ9tTgtN8c=;
        b=mr+MME1YbKs/BNTbnLjnS6XgRS0FrOBeiEy1Kq4bdZfEmPIe1gH+BY34BR4L8UXgcW
         QGXyidtG94/mug9c+rGiK/1CJtqhhZWE7djUTZhMQC/u0Jwv5G50T3QUNp9ZAfmrBmC7
         K8MCU7lnBoENq4CFljDu0GdzaERHp7SO08SjJYJFEszkQewcVejatJiWpseVkJ0NBfgP
         ixifs1kZ7FjsY/FaHu29/G4EHJkkDUOqzeqf6OTEus+Ih6RblP5mkXWEV9teuaxG6xPo
         OnkYXGD8PdzRlaIH1Llo1V0Ocr8u5pSLekLGGnUDi+0ji4aSVY9OhV+Mh8kWzCbhci2e
         50Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8wAjkMcB/UlHyK0j3IJZnIIeFIoMFr4s1QOy0jxpaKb8BXWdkKZSY6QF92KjSHfi3bbh9EDR4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyC9vgE8gEniUrx4nm8mSEYcvEVdGUVWXLgbBcYMom0tIsqg5uw
	j8I0UlysHtguNkXHJeET+XiBpLBvt/JJs7FAHB41klaMLHA4/9TyRhFFHHbKam40hf/yDBHj/hr
	UjRktVWRA68VZKgABGhy1NBtInrN4M4wTmF2u209P9zL8B83/KsYIBzchVKG/3MbX
X-Gm-Gg: Acq92OFiiL7lrEy/pY+ogLP0d4ldMZ+UZOzWkndQnVZyu5+GymAgvCaBYPnSDgWhMcm
	C7MxrRL2+0hCd+Z6txq3Mh2IZqcXZr5UyqprLl57hzbiiGNO2xZoQqsUqJpNg/DmyLMUxAZZoqR
	Heb/NtdEVq9jtbfFAmdy5NS08Vv8kaWKqU7w7JIQBQrFnTm7XQF42ri970xI8cAOUv/MqJLxsWv
	CHKtWg3VnV3ZqJEi7XOysgo/yC2FnEQLz4EHyKs1FiUV4GY/3BRm2lovt3irtzRBFegHWpbLRyT
	EhCr4MYmD9EBYVLKSubr7hwr1j44+BnVy5PeyMi8OIGJNpuAnHo3rEdxdSqicre7tPBqJCH2Al2
	/u8rWRsYW2lXchV35XWAAgXhJHhFJC+/hjKPmI1qaLqhtEkEs5tVTRH/9
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr3309550b3a.21.1779444057446;
        Fri, 22 May 2026 03:00:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2daa:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-8415f1a5318mr3309509b3a.21.1779444056898;
        Fri, 22 May 2026 03:00:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:00:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:32 +0530
Subject: [PATCH v2 1/6] bus: mhi: Replace controller runtime_get/put
 callbacks with direct PM runtime APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-1-fbebf41a82bb@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=4878;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=eEEN3EXZH9+ocSgYvv06EBOEmhgPIImBeQeRcWVT6hU=;
 b=yYhT3RpS8Nz/uaR392bqwxteKBb/FYzWe1XQYz9VQyNj0buTC58NW65aH4cKIQFB4iRyHRzbO
 TWR0AthcqCIB6R0xOUx+HaDt8erCDViPTRy7/AJD6uO/Nw6HrkjyI/U
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: DNov1-mifDK_6L8G-4I-5QIieaEt51Lv
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a10295a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=A_fZCR7qwrwYhkduS1cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: DNov1-mifDK_6L8G-4I-5QIieaEt51Lv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX7hPOroeH9gYB
 w5ZzuRsXO5et/6+Ugq9Bi21DAiLf0xfgvuNfzxSKUPcEgE+Hsh5CpzV5sod4Y1j9o5fsJWU2b8J
 onsx4zIhqOGLaphi1344L/3xZ4wJQHKKurrHlRpdIVyi/VLRraiE5eTz3sD1tc4BA4aIj8wfpFB
 Kg2unc5j4RFNnUAQL/3eota8j+RCwdCYaV1/8CoM8MbJXFs3WKlNF5IErcFki6TVyxi23dhgsrc
 JWi2HsoSjkmOy7ZVg6jY/OyWP3qNh7opAn8AGnAZm6l/cV7nGhlYMsiBAu1sj6egGj0tnsx5Mpl
 Wb0qeRzQHPFPLf5jBSQXlp4A6qd+RkakqkuCgwZ7bfJBKQngmtvU3TRKe1xzB8Q/+ABPhwcPXAZ
 fLhwsi6il3cq9Pw/YBt7iNdMC1r5/uozSCzV0k7/nLc6/DFTEP8AnfCQcoAcjWqZ9SC3wpZ+hrJ
 PUouXOoIXj0EqWrtANg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030059_592177_1EC4E925 
X-CRM114-Status: GOOD (  14.38  )
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

Remove the runtime_get() and runtime_put() function pointers from the MHI
controller and replace their call sites with direct calls to
pm_runtime_get() and pm_runtime_put(). Also add pm_runtime_mark_last_busy()
before each pm_runtime_put() call to properly update the last busy
timestamp for autosuspend.

The removed callbacks provided no additional logic beyond wrapping the PM
runtime APIs, so eliminate the indirection and the requirement for drivers
to implement these no-op callbacks.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/bus/mhi/host/init.c     |  1 -
 drivers/bus/mhi/host/internal.h |  7 +++++--
 drivers/bus/mhi/host/main.c     | 19 ++++++++++++-------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 0a728ca2c494..9f3ee4a14418 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -927,7 +927,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	int ret, i;
 
 	if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
-	    !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
 	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs ||
 	    !mhi_cntrl->irq || !mhi_cntrl->reg_len)
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 7b0ee5e3a12d..a7493aabc6fa 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -7,6 +7,8 @@
 #ifndef _MHI_INT_H
 #define _MHI_INT_H
 
+#include <linux/pm_runtime.h>
+
 #include "../common.h"
 
 extern const struct bus_type mhi_bus_type;
@@ -352,8 +354,9 @@ static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
 static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 {
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	mhi_cntrl->runtime_get(mhi_cntrl);
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 }
 
 /* Register access methods */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 53c0ffe30070..71919c2e9462 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -661,7 +661,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			if (mhi_chan->dir == DMA_TO_DEVICE) {
 				atomic_dec(&mhi_cntrl->pending_pkts);
 				/* Release the reference got from mhi_queue() */
-				mhi_cntrl->runtime_put(mhi_cntrl);
+				pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+				pm_runtime_put(mhi_cntrl->cntrl_dev);
 			}
 
 			read_lock_bh(&mhi_chan->lock);
@@ -1138,7 +1139,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	 * for host->device buffer, balanced put is done on buffer completion
 	 * for device->host buffer, balanced put is after ringing the DB
 	 */
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
@@ -1149,8 +1150,10 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
-	if (dir == DMA_FROM_DEVICE)
-		mhi_cntrl->runtime_put(mhi_cntrl);
+	if (dir == DMA_FROM_DEVICE) {
+		pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+		pm_runtime_put(mhi_cntrl->cntrl_dev);
+	}
 
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
@@ -1352,7 +1355,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
 	if (ret)
 		return ret;
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	reinit_completion(&mhi_chan->completion);
 	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
@@ -1383,7 +1386,8 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 
 	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
 exit_channel_update:
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1524,7 +1528,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 		if (mhi_chan->dir == DMA_TO_DEVICE) {
 			atomic_dec(&mhi_cntrl->pending_pkts);
 			/* Release the reference got from mhi_queue() */
-			mhi_cntrl->runtime_put(mhi_cntrl);
+			pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+			pm_runtime_put(mhi_cntrl->cntrl_dev);
 		}
 
 		if (!buf_info->pre_mapped)

-- 
2.34.1


