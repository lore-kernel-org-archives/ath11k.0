Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCBDCD5BAC
	for <ath11k@archiver.kernel.org>; Fri, 22 May 2026 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=; b=Mu/DsaEjYbuQe0gwpadzGil88E
	clnxGeJW5sB45D/H7I5Kv8gOvjVgrS2c9R1L0PFpuXW9HEzTftQ4FpDFJYvdri4u/7LP6H2qhLpZE
	B6rmq6Q54Z/rNDRAkTjhspL+XTeOMdmfmXOkSFGuzwOTiFn+e6Y/l++jAoKlbDHV+ez7dKz03x2vv
	9Z1Xxqp8QGStpiQgasyOOhIYzP9orolDBCMDnjh5Arkrwe9nORCPulV1yKWUb+l3asLaQrRPMdK9y
	EPN0pgTiZWWYhyH3Ximecm/VZCnpNRZUY8T8iRrJKUp7G72Q1in3bK930IvS2wfLzt80OvguUDSR8
	NImy+GCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhH-0000000APW6-0k0Z;
	Fri, 22 May 2026 10:01:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhG-0000000APUF-0Eqw
	for ath11k@bombadil.infradead.org;
	Fri, 22 May 2026 10:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=; b=V3anYL8p4jur9jzFECdHR3gtdn
	BYWkUC/YuZf3TpULGBWVEMdwWYTeRJeLSGabkqys/gSxnNAK/Hv2anjd+4nscU2T3LDFBVimjW8HJ
	C/wTZOHdCBgSOccqiHffdB7LvxXc6Z5pHZW+4N44jBuXQ/HvfLpDbdFu0WXVMzyC/w2QUv6hWGJGC
	uct9e1CaVt45P/0F39GV62JAUUKnTgcf7MhJKGPoDpzWz1zlCph2LRJLdm9aB8RHnum8k5eY1KFw0
	xX5kT9PApIx4HAq0iy9d1tyC6WCO0Xfvf8ny3rZYO7XHybrE9D8eCahXIb32HYr7qyBwXGrhZBtBk
	YNDXQqyQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhC-00000003vDX-0xAr
	for ath11k@lists.infradead.org;
	Fri, 22 May 2026 10:01:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M50ocT312832
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=; b=aB4/UNTxbpSN1RC/
	1dG3EFP85XnO7MT7R2W4Qs0lipz9XHR4AqH5O/T458jYczzhH9G7qHfvZjAgUgBI
	VvxFvf4a6EKgKH3kzJIOIwANo/pZpIXHy1nU3aLqbcb9+0nQX1kzj/o7raFPvblj
	gcVKLOBnnpwt9+bz2NHLdKvGDNqK/EecVXNA8U8lNbFf6RF9oWMOsYUEbcHiA49x
	etdmiOPpYg4zrKLhqZGR/7ff41oKhdoS3aUXrE7zX5xpQD8I+ztT/YobcKmGa8CO
	PnYbS/AukIu7j4O8tvvolAql4or1OHnTNVsqHw5BpQFqMxuBVzAmhDLM/qfd5hI3
	Vh2QxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea88338v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:01:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83f24cd00f8so3887528b3a.0
        for <ath11k@lists.infradead.org>; Fri, 22 May 2026 03:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444092; x=1780048892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=;
        b=iLle8xVk1R0RRZd/1rQzk3E0cGXCyvhgvWAXa+svFF1AxO5fImdSc68ltHnoR4naL/
         7GWjbzUiPQInkpss3sabp0Mff5fALX8DeO9FciMN7zjnuZR5FDuS8Czmz+6wJpHT/9ab
         T/wJQixUsfP/JM/ldgLI/tIVVhuX9aa0V/GEwgKGGJHHe1TNJc4EEcbGVdKwxXsh+p+7
         IZ16Ojwlr53NrEQWEwV/M8s0Kjptfx28xkxgAQ3SngrUpc9+vMyVKkBibVbwfPrHoM5X
         /C3tbfXCdhrE87L5VZfioAPFXZqHDGnTTtw2g77Du7Cjut9vcUVr4YmLDvBu4BOrtsm1
         uoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444092; x=1780048892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=;
        b=MIlI7P7FB7CcwZMbFAukZwqCIhZgiXzlnQWfdSnh2wyeRhFc+DBw8Od2kZS/hahWtv
         RbQL/uGZHWy3c/DtnXFwTLD7K8wL2pTzv0K+Zuh60qkMwNuYnczeRq7aU3uWFIeBRAkq
         AFPDf8EC4Zr09ygFRQwZrapINKbWefPn/Z2eg3BcLmXlZXNWw9zN3FAAyyYcSq1VgClD
         hgIaKY9FIk7o04+xbd5POZF1muzBKCnt7lcGoqo8ncHD+djl2VOHvYTC4XkNuGW38INE
         4hohKRIV8EirzyncJBP4MKav2jNzWcgUTzZ6ikrji7bcjtYWh3QhUgaC5xi3gdHwJ3Tu
         3Ccw==
X-Forwarded-Encrypted: i=1; AFNElJ/KbH8km8IGHKMuiblIb5o6lcK+JnH74UQHe9Pt66OfIqfb8A4NbgyEHYuY9AYCvjRyy0t74vk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpATvNRzlnhXrCZVcij34elr9Nkv7zvx+cFmazgW2aITthMqO7
	zUA06/PR/PAFFQtMauUuY5QjF3+wNlOp75JQdMPghIKkgPAd+DYQ1+9Zrtiq5HWxMTuSzxjzMU9
	ur+ESU8oBLbEjwu6EzQKHV5d5YZSnPUdIMVXIU0qlKRAZJwWZMchmuMwa4GvUE23L
X-Gm-Gg: Acq92OHCQZqrqQUAy2wJDoY3Lu2ssmSwx7flYlnbKouqac0CM6J1Lo1xYSzosaFDwoz
	GzY08GzSoEjHK5j7XR1TO/U0uEfXpW1VyRPdAa5PNUqgNpR6l4uhR06e0+mOzVR5hvsiBk9tkGq
	XnOu5nR2C0koQVzxkz5KwX2hWsThUOplK62/M6RwoZUQXY/LVWVHwhHrxmJGdpbk7NcHrrPnkHU
	R1fXaWSJxwgvNsdpbRAPu810vaV8N7ee3lAVFMrJbZxOyw7MmaZOPWWnR9Vas1F7oz8FE/p5/eZ
	PyxyFwyA0pZPsoNu44Y9nYUn0KGZrx6+K2RELRA34xz7C8t9RH7zvCsn9mG7YdvIyuw7rUEbqk8
	vZL9MOhYv8c8xdCkIUV03DfvtKiflfDFznurTit+J3dJKLNMx0ntroA5s
X-Received: by 2002:a05:6a00:1988:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-8415f158d1bmr2990100b3a.16.1779444091947;
        Fri, 22 May 2026 03:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:1988:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-8415f158d1bmr2990025b3a.16.1779444091299;
        Fri, 22 May 2026 03:01:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:36 +0530
Subject: [PATCH v2 5/6] net: wwan: Hold runtime PM during active data path
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-5-fbebf41a82bb@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=10149;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vGJb93aYUaQ8jo1tSvCSFnkGptC5OIX1Pw2nFhM0VA8=;
 b=5HBYYXQJRnjFECEDyTxAMsVcYHphefIrjpOXjPGckvK/1sqC+W9+kiVtG9bbrgpJFZpJ24t7g
 QTVXR1LTohwBnb5K2h0l2+2Ptqd/7bRJefIPqDTarqjhDq3aBiTiykq
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX1v/Jzg8P6PRA
 D2V60R7KoHQUvS25qx4PZLS21Ff19KHZolY+XFO81I536clDMoYQelK2CrKKYLAYVgmFF1r6Y9g
 XL6k6XCLSR8UmZ9YW72ssHSUqTmYhnjXundupEi2rfUz7GCh7Mv1/IqsFpaJ3m+og9IJsZIW45v
 iIJDE6y70RFLSor59Xif60DXD49AY2BzzFbmuOQrQ6EE1dAjSbvepGjpc4mvJa/KnpX9v7Bb1Dh
 a1v/0JVyjerp6qq2k3a6yCU75frNp2dGHSrTv+TjtfRVtj1dHOa44B66qfNHkPJza68xfsWJIv2
 jkdjWjd+h9BRS/Oof3vMXuJ6mBq8PLFRsfAE5Y6UhOzddBW0KVGph3wlrrLPdkqnfCPY/vZqdDo
 EgVft9pgxcFeOxIyWPLVQ4erYheV0XrkKvU53GdDg65bg81Q1jNvfGRYy1jprk7i8odyRauhSpU
 CeZ/EksLAtEZdq/fWvw==
X-Proofpoint-GUID: 7UnEN0Rzv2skwemT10hTZUG6rmoV2GoZ
X-Proofpoint-ORIG-GUID: 7UnEN0Rzv2skwemT10hTZUG6rmoV2GoZ
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a10297d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2zpQ2AhS3inu96TDYMYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_110134_959083_9D763984 
X-CRM114-Status: GOOD (  21.60  )
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

The mhi_wwan_ctrl and mhi_wwan_mbim drivers do not coordinate with runtime
PM, which allows the underlying MHI controller to be runtime suspended
while transmit, receive, or RX buffer refill operations are in progress.
This can lead to stalled transfers or failed queueing once runtime PM is
enabled in the MHI core.

Enable runtime PM during probe and take explicit references around TX, RX,
and buffer management operations so the controller remains active for the
duration of each critical path.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/wwan/mhi_wwan_ctrl.c | 60 +++++++++++++++++++++++++++++++++++++++-
 drivers/net/wwan/mhi_wwan_mbim.c | 44 ++++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index fa73861db6ad..0fe0f24c0df4 100644
--- a/drivers/net/wwan/mhi_wwan_ctrl.c
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -4,6 +4,7 @@
 #include <linux/mhi.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/wwan.h>
 
 /* MHI wwan flags */
@@ -79,6 +80,13 @@ static void mhi_wwan_ctrl_refill_work(struct work_struct *work)
 {
 	struct mhi_wwan_dev *mhiwwan = container_of(work, struct mhi_wwan_dev, rx_refill);
 	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
+	int err;
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+		return;
+	}
 
 	while (mhi_wwan_rx_budget_dec(mhiwwan)) {
 		struct sk_buff *skb;
@@ -102,17 +110,27 @@ static void mhi_wwan_ctrl_refill_work(struct work_struct *work)
 			break;
 		}
 	}
+	pm_runtime_put(&mhi_dev->dev);
 }
 
 static int mhi_wwan_ctrl_start(struct wwan_port *port)
 {
 	struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
+	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", ret);
+		return ret;
+	}
+
 	/* Start mhi device's channel(s) */
 	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put(&mhi_dev->dev);
 		return ret;
+	}
 
 	/* Don't allocate more buffers than MHI channel queue size */
 	mhiwwan->rx_budget = mhi_get_free_desc_count(mhiwwan->mhi_dev, DMA_FROM_DEVICE);
@@ -123,12 +141,15 @@ static int mhi_wwan_ctrl_start(struct wwan_port *port)
 		mhi_wwan_ctrl_refill_work(&mhiwwan->rx_refill);
 	}
 
+	pm_runtime_put(&mhi_dev->dev);
 	return 0;
 }
 
 static void mhi_wwan_ctrl_stop(struct wwan_port *port)
 {
 	struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
+	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
+	int err;
 
 	spin_lock_bh(&mhiwwan->rx_lock);
 	clear_bit(MHI_WWAN_RX_REFILL, &mhiwwan->flags);
@@ -136,12 +157,20 @@ static void mhi_wwan_ctrl_stop(struct wwan_port *port)
 
 	cancel_work_sync(&mhiwwan->rx_refill);
 
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err)
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+
 	mhi_unprepare_from_transfer(mhiwwan->mhi_dev);
+
+	if (!err)
+		pm_runtime_put(&mhi_dev->dev);
 }
 
 static int mhi_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
 {
 	struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
+	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
 	int ret;
 
 	if (skb->len > mhiwwan->mtu)
@@ -150,6 +179,12 @@ static int mhi_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
 	if (!test_bit(MHI_WWAN_UL_CAP, &mhiwwan->flags))
 		return -EOPNOTSUPP;
 
+	ret = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", ret);
+		return ret;
+	}
+
 	/* Queue the packet for MHI transfer and check fullness of the queue */
 	spin_lock_bh(&mhiwwan->tx_lock);
 	ret = mhi_queue_skb(mhiwwan->mhi_dev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
@@ -157,6 +192,9 @@ static int mhi_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
 		wwan_port_txoff(port);
 	spin_unlock_bh(&mhiwwan->tx_lock);
 
+	if (ret)
+		pm_runtime_put(&mhi_dev->dev);
+
 	return ret;
 }
 
@@ -179,6 +217,8 @@ static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
 	/* MHI core has done with the buffer, release it */
 	consume_skb(skb);
 
+	pm_runtime_put(&mhi_dev->dev);
+
 	/* There is likely new slot available in the MHI queue, re-allow TX */
 	spin_lock_bh(&mhiwwan->tx_lock);
 	if (!mhi_queue_is_full(mhiwwan->mhi_dev, DMA_TO_DEVICE))
@@ -217,11 +257,26 @@ static int mhi_wwan_ctrl_probe(struct mhi_device *mhi_dev,
 	struct mhi_controller *cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_wwan_dev *mhiwwan;
 	struct wwan_port *port;
+	int err;
 
 	mhiwwan = kzalloc_obj(*mhiwwan);
 	if (!mhiwwan)
 		return -ENOMEM;
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	err = devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	if (err) {
+		kfree(mhiwwan);
+		return err;
+	}
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+		kfree(mhiwwan);
+		return err;
+	}
+
 	mhiwwan->mhi_dev = mhi_dev;
 	mhiwwan->mtu = MHI_WWAN_MAX_MTU;
 	INIT_WORK(&mhiwwan->rx_refill, mhi_wwan_ctrl_refill_work);
@@ -240,11 +295,14 @@ static int mhi_wwan_ctrl_probe(struct mhi_device *mhi_dev,
 				&wwan_pops, NULL, mhiwwan);
 	if (IS_ERR(port)) {
 		kfree(mhiwwan);
+		pm_runtime_put(&mhi_dev->dev);
 		return PTR_ERR(port);
 	}
 
 	mhiwwan->wwan_port = port;
 
+	pm_runtime_put(&mhi_dev->dev);
+
 	return 0;
 };
 
diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index 1d7e3ad900c1..56e660ecfcb4 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -20,6 +20,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/pm_runtime.h>
 #include <linux/skbuff.h>
 #include <linux/u64_stats_sync.h>
 #include <linux/usb.h>
@@ -153,9 +154,18 @@ static netdev_tx_t mhi_mbim_ndo_xmit(struct sk_buff *skb, struct net_device *nde
 {
 	struct mhi_mbim_link *link = wwan_netdev_drvpriv(ndev);
 	struct mhi_mbim_context *mbim = link->mbim;
+	struct mhi_device *mhi_dev = mbim->mdev;
 	unsigned long flags;
 	int err = -ENOMEM;
 
+	err = pm_runtime_get(&mhi_dev->dev);
+	if (err < 0 && err != -EINPROGRESS) {
+		dev_err(&mhi_dev->dev, "pm_runtime_get Failed %d\n", err);
+		pm_runtime_put_noidle(&mhi_dev->dev);
+		dev_kfree_skb_any(skb);
+		return NETDEV_TX_OK;
+	}
+
 	/* Serialize MHI channel queuing and MBIM seq */
 	spin_lock_irqsave(&mbim->tx_lock, flags);
 
@@ -184,6 +194,7 @@ static netdev_tx_t mhi_mbim_ndo_xmit(struct sk_buff *skb, struct net_device *nde
 	return NETDEV_TX_OK;
 
 exit_drop:
+	pm_runtime_put(&mhi_dev->dev);
 	u64_stats_update_begin(&link->tx_syncp);
 	u64_stats_inc(&link->tx_dropped);
 	u64_stats_update_end(&link->tx_syncp);
@@ -396,6 +407,10 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 	struct mhi_device *mdev = mbim->mdev;
 	int err;
 
+	err = pm_runtime_get(&mdev->dev);
+	if (err < 0 && err != -EINPROGRESS)
+		dev_err(&mdev->dev, "pm_runtime_get Failed %d\n", err);
+
 	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
 		struct sk_buff *skb = alloc_skb(mbim->mru, GFP_KERNEL);
 
@@ -415,6 +430,8 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		cond_resched();
 	}
 
+	pm_runtime_put(&mdev->dev);
+
 	/* If we're still starved of rx buffers, reschedule later */
 	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mbim->rx_queue_sz)
 		schedule_delayed_work(&mbim->rx_refill, HZ / 2);
@@ -501,6 +518,7 @@ static void mhi_mbim_ul_callback(struct mhi_device *mhi_dev,
 		/* MHI layer stopping/resetting the UL channel */
 		if (mhi_res->transaction_status == -ENOTCONN) {
 			u64_stats_update_end(&link->tx_syncp);
+			pm_runtime_put(&mhi_dev->dev);
 			return;
 		}
 
@@ -511,6 +529,8 @@ static void mhi_mbim_ul_callback(struct mhi_device *mhi_dev,
 	}
 	u64_stats_update_end(&link->tx_syncp);
 
+	pm_runtime_put(&mhi_dev->dev);
+
 	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mbim->mdev, DMA_TO_DEVICE))
 		netif_wake_queue(ndev);
 }
@@ -614,6 +634,17 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 	if (!mbim)
 		return -ENOMEM;
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	err = devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	if (err)
+		return err;
+
+	err = pm_runtime_get(&mhi_dev->dev);
+	if (err < 0 && err != -EINPROGRESS) {
+		dev_err(&mhi_dev->dev, "pm_runtime_get Failed %d\n", err);
+		return err;
+	}
+
 	spin_lock_init(&mbim->tx_lock);
 	dev_set_drvdata(&mhi_dev->dev, mbim);
 	mbim->mdev = mhi_dev;
@@ -623,8 +654,12 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 
 	/* Start MHI channels */
 	err = mhi_prepare_for_transfer(mhi_dev);
-	if (err)
+	if (err) {
+		pm_runtime_put(&mhi_dev->dev);
 		return err;
+	}
+
+	pm_runtime_put(&mhi_dev->dev);
 
 	/* Number of transfer descriptors determines size of the queue */
 	mbim->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
@@ -637,12 +672,19 @@ static void mhi_mbim_remove(struct mhi_device *mhi_dev)
 {
 	struct mhi_mbim_context *mbim = dev_get_drvdata(&mhi_dev->dev);
 	struct mhi_controller *cntrl = mhi_dev->mhi_cntrl;
+	int err;
+
+	err = pm_runtime_get(&mhi_dev->dev);
+	if (err < 0 && err != -EINPROGRESS)
+		dev_err(&mhi_dev->dev, "pm_runtime_get Failed %d\n", err);
 
 	mhi_unprepare_from_transfer(mhi_dev);
 	cancel_delayed_work_sync(&mbim->rx_refill);
 	wwan_unregister_ops(&cntrl->mhi_dev->dev);
 	kfree_skb(mbim->skbagg_head);
 	dev_set_drvdata(&mhi_dev->dev, NULL);
+
+	pm_runtime_put(&mhi_dev->dev);
 }
 
 static const struct mhi_device_id mhi_mbim_id_table[] = {

-- 
2.34.1


