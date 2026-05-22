Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52344CD5BB0
	for <ath11k@archiver.kernel.org>; Fri, 22 May 2026 10:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DXeyrdoWr0DcgBTdRbVLV0jwA0imqVGVhlRKg6Geqg=; b=JM6ZedWdWSpWsXzqVjiEtGjutb
	aVT7IaHmZG9C6osja6jWVVzC51fo5I4ZxptaEDGXWuQAwCK5HgvLpEZYw2bTj1PjWpVD2GsMNQjiY
	gpwXmyoXGDwCMj/5xSNlWfRK6KgAvEC2QBKYYUCsJm2P57VgIbUaQIHtrOR92ntLBZGsqnvbyTQhS
	yaD3ocn4fU2rQrmTUClNoxJwFBndKJSiCBSUb3wDaYuPh0qAM8oqVo1tKBotoWds5+6Ln+czosjhB
	iz3jegNSX6MnBhRtKCq1xbj1vvyOJkQomihDmEwg02pFiLfE0FzFDc+cgnzlV9FtfopTtXAQIiHdF
	bAWmF31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhW-0000000APn4-30g1;
	Fri, 22 May 2026 10:01:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhT-0000000APjR-2aWt
	for ath11k@bombadil.infradead.org;
	Fri, 22 May 2026 10:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5DXeyrdoWr0DcgBTdRbVLV0jwA0imqVGVhlRKg6Geqg=; b=jb3W1bfDP4h3yrPw/SQnu4B/+S
	ooQVZWFRGGVsK9MJGFnez3okkLv6e+c40KyvSicR2U7HsUNajoQJYZsmHiNIYejCVOMZjpN5owJ8K
	u/T/ogzPjDEncn9XNRy9LEu15Ae7K/maHQ22Btq9w7Mf7IHPNXa8wGt3Dg07PBzdM0c5zdsvfLv3k
	YXixYPEQxdtioGobizQ301qOz5QraAMuOmB2syRyKXiIyhO+0eKD3QwPw31aJILMNCwMQsQXhpVW6
	nD3MePMTtSUUMBu042W1CBExniYpkJX0+tYgzAF8BaFP7cw8hNat/IWV34bXIuSlKLcaTgP/avja/
	c/mrFxCw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhO-00000009vJU-38N4
	for ath11k@lists.infradead.org;
	Fri, 22 May 2026 10:01:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8opLi1658128
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5DXeyrdoWr0DcgBTdRbVLV0jwA0imqVGVhlRKg6Geqg=; b=RlcEFI4DbYPXiWK4
	QIlBKbaRJedey4Bt6BSXn+z+qgw4dOjuyVZIn6+f4an/HrlkBJNeKn0426wyIWID
	DWGe0brdpGtxASKeEc9MAkgbfRunDdZwezz8A0DGQgex6gFV8Z2extNKtZ/1dmYL
	ZZOtc7ZT1PobKIdaS79++SrbhMjyh+cve2dXWjCyGPU5OGYMvMqND7Lxoke7LbzA
	cT5AtlMq/0QACA3d8DTQ/PMFAU489910ptdIyDy99iyevn9v2c1GnzjVbNN+aOaR
	h5D9tH3ylLKZkfS5CetSbU3z4mGceFP11qQRbDBZT81idOZgoyyuY7BTPDWutLQo
	FHdDAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkn87v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 22 May 2026 10:01:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8397b14a689so4691214b3a.2
        for <ath11k@lists.infradead.org>; Fri, 22 May 2026 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444101; x=1780048901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DXeyrdoWr0DcgBTdRbVLV0jwA0imqVGVhlRKg6Geqg=;
        b=Dw6oeV9yEVoCxeEJhtpyGG8EVirmgTJc9SVDlO/9/oTEWfp5akEPfMzbu5jnjz39Zd
         M835/SgnkV5RUiEkGZRTyUyhEBU6aZjJE1r469FnoU/BC+7qdTGJEnLuf8/gmGLp+R6O
         42cc+q/8N+OM7qrwTWWVkx4X7BHt3Pg68K9ywa1Gb69aX2CwTXU/sLEAiEsu2NWpS7ke
         +CqMvNd/Pxejr5LXV4pKb0ZiW4P/UoIiJUOxXoebJXp9eskuTOIAlFY5A93TKX4u7icm
         DMQRh9vXuHaUXV2l91JDeV1Vy5UY6S36o4iW36vCpG0pXIoiHY7e5TdNC2T2fJKRmkVp
         eT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444101; x=1780048901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5DXeyrdoWr0DcgBTdRbVLV0jwA0imqVGVhlRKg6Geqg=;
        b=JbaFjQdB4cN8LpUBzXN/nWG68ZssRuY2Ny9U5bq3uHajDKM8kNDB6V6MxbtYvjERF0
         lkiCVwAHMnfZ0AXPqE/VkUZv+xrg0EgXUPYT7Vsy8cUJD936bmEqfTmVKt+XOilv4PQG
         w7YqjBiuuHIZbU60IbA3+g5tkPh2T84MzpE2Rjz580JUm1fjb9Eg/q9s0mERb3hZdXZu
         SRKnb9ilLw+a501OJbltxwVCxKY4Si5X+737bBtrgdCHjcSCeqzbQzI85hgRSd4XtLOS
         LZkKAUcRuYkjFPd1HlXeInOUNWGRMyCeiuqYRXJvpG466OJuH4re9OKfy2c8wBmmkmO2
         7q/g==
X-Forwarded-Encrypted: i=1; AFNElJ8Lm0LLet0GRTIab2DRReEfn/88m+kjhuYYFMK1gHwq1kiIIGZz/vLvZzNNxNFEHQO5PW0GMEI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRh/s327WnSTku+NmXXmEcGZZIqcpHoFlcZFsgRh2SefFrEY9E
	K4o5XIn/QFyd1xHz8RN3mHkOXra8Xzvys8tab+jbIhNEFno1zR4qGB01IvrqKXJFs5KVVceYM8E
	J4H3Y+lU8Ta/KJkA4aCbIKOTHW2UblM883VMcagE11Tf5MJtMibmc9O81DY/HUXb4
X-Gm-Gg: Acq92OFr7FAPdhd0zqm9QNzPyRL/95BuXqebN7jUzk5h8L0VZMMqWrvWS7PZEzsfQAA
	TNQ2ui3hXKPDQytcne2e7BjGuknm2u7QM2/uru3EN/ZXu0dpAGYoJOG/4c09kypqsTRiLBtJSmS
	JUv6QgD1TA3kwZPG9kXm7XwWkfl0t4TVQcJMnrOuFW0h3cDgpMNPOhmnHRnW+Xc5ql8g6vlL9+m
	dfXL5LQ0QJUz2hDs0A1NNHfWRA0wbvUIEI+ryeoODa5jnaBmo5HJu8BBzMStN2mb9v46O/c0qMC
	F0yaSVBS0Vh0Tg/rMQNeNa0I76TYQJ5JNALNSPdIyQ/SiqB8hO8IPLy+ymzpuoAkCqP9YbU62IW
	wshNfsQ4+62xHQ6XjpSyFg+Kz+jnQdiHzPUeXljiIFCq9JmTaIBRFOhE26c42gZIo410=
X-Received: by 2002:a05:6a00:bd11:b0:82f:24e:6a48 with SMTP id d2e1a72fcca58-8415f2e0caamr3187451b3a.5.1779444100462;
        Fri, 22 May 2026 03:01:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd11:b0:82f:24e:6a48 with SMTP id d2e1a72fcca58-8415f2e0caamr3187406b3a.5.1779444099822;
        Fri, 22 May 2026 03:01:39 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:39 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:37 +0530
Subject: [PATCH v2 6/6] bus: mhi: host: Fix runtime PM ownership between
 clients and controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-6-fbebf41a82bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=7532;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=iFHxbTO6wE35Tl3kqwnkO8A1IQ+NptFsGOPDlaw/GEs=;
 b=Leraca11cxKZ9kv0wOGI3YHGBWBAYMU7jDrEbEBi0YqgqfKAQk5bm2D7Lfh9uEh0W7ZzT5vKK
 DtD9ugdBFwRClFNTiqzjFY0NRel2cgOG3a2qFCZJSiB8OgzBE27Wzzh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfXwktR4ph9Cc1w
 Koy41K8MlNz+jVXaiuIjhh6oc5/NrrFrmK5GC+pJqyE0AG+ss8rT2cBSUwTCfDPNlqSLap6LWUY
 3Zi0P+pK4kokS+a4zJ+PXh1XfEdt5NEyNuOtu9fDYcBp/p8cvhkqQ+CEIxQd29v7w43G24/Pecl
 gD8kujjorLJojAVdRX2nXlUaolz+NRHEDQ0fRBv23F1QZCa52GYRto73LlFPF2Qi4TxGjdowRtm
 wOMgVTQba15wmmw3pGpb0Ik0sCdi5dN6bSjbX7S17tyKbMDRfgbjvC+yQExGHD1ewZ3Jb0s5S70
 mPIhMXHcQscZoYtVN2hgNd2vhrOUnwVYS0Q/dMIElHcP15MbKmRYhr1FAOxgmmR9DkAknF7sICb
 JcsPNlbM8aFoDevsc2rwxV8MNWc35UgLJuq1JDRGe0Akctfs3pULL75nvjO6NQcgtssthI/zZtn
 Xwfg+bBnnThdlB/7MSA==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a102985 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=A8rfxp3GyOsx1I41rDQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: OJHud-MVMSB_hoHWRePKMAYD7Ig7S8yW
X-Proofpoint-ORIG-GUID: OJHud-MVMSB_hoHWRePKMAYD7Ig7S8yW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_110147_108564_CAEA99AB 
X-CRM114-Status: GOOD (  18.76  )
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

The current MHI runtime PM model allows the core to take power references
directly on the controller device without visibility into client driver
activity. As a result, a controller driver may runtime-suspend the
hardware while one or more MHI client devices are still actively in use.

This happens because the MHI core historically managed runtime PM
internally, rather than relying on standard parent-child PM dependency
tracking. The controller driver therefore has no way to infer whether MHI
clients still require the controller to remain active.

Fix this by enabling runtime PM on the MHI bus device (mhi_dev) and routing
runtime PM references through it. Client drivers now hold runtime PM
references on their own mhi_dev, allowing the PM framework to naturally
propagate activity to the controller via the device hierarchy.

The existing mhi_device_get_sync() and mhi_device_put() helpers are
retained, as they serve as the synchronization point between the MHI power
state machine and runtime PM, combining runtime PM reference management
with MHI wake handling.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/init.c     |  3 +++
 drivers/bus/mhi/host/internal.h |  6 +++---
 drivers/bus/mhi/host/main.c     | 26 ++------------------------
 drivers/bus/mhi/host/pm.c       | 18 ++++++++----------
 4 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 9f3ee4a14418..002f3abb8103 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1034,6 +1034,9 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	mhi_cntrl->mhi_dev = mhi_dev;
 
+	pm_runtime_no_callbacks(&mhi_cntrl->mhi_dev->dev);
+	devm_pm_runtime_set_active_enabled(&mhi_cntrl->mhi_dev->dev);
+
 	mhi_create_debugfs(mhi_cntrl);
 
 	return 0;
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index a7493aabc6fa..434ed4705d25 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -354,9 +354,9 @@ static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
 static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
 {
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	pm_runtime_get(mhi_cntrl->cntrl_dev);
-	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-	pm_runtime_put(mhi_cntrl->cntrl_dev);
+	pm_runtime_get(&mhi_cntrl->mhi_dev->dev);
+	pm_runtime_mark_last_busy(&mhi_cntrl->mhi_dev->dev);
+	pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
 }
 
 /* Register access methods */
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 71919c2e9462..f0b09657de29 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -658,12 +658,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 			/* notify client */
 			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
 
-			if (mhi_chan->dir == DMA_TO_DEVICE) {
+			if (mhi_chan->dir == DMA_TO_DEVICE)
 				atomic_dec(&mhi_cntrl->pending_pkts);
-				/* Release the reference got from mhi_queue() */
-				pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-				pm_runtime_put(mhi_cntrl->cntrl_dev);
-			}
 
 			read_lock_bh(&mhi_chan->lock);
 		}
@@ -1135,12 +1131,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 
 	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
 
-	/* Packet is queued, take a usage ref to exit M3 if necessary
-	 * for host->device buffer, balanced put is done on buffer completion
-	 * for device->host buffer, balanced put is after ringing the DB
-	 */
-	pm_runtime_get(mhi_cntrl->cntrl_dev);
-
 	/* Assert dev_wake (to exit/prevent M1/M2)*/
 	mhi_cntrl->wake_toggle(mhi_cntrl);
 
@@ -1150,11 +1140,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
 		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
 
-	if (dir == DMA_FROM_DEVICE) {
-		pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-		pm_runtime_put(mhi_cntrl->cntrl_dev);
-	}
-
 	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
 
 	return ret;
@@ -1355,7 +1340,6 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
 	if (ret)
 		return ret;
-	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	reinit_completion(&mhi_chan->completion);
 	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
@@ -1386,8 +1370,6 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
 
 	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
 exit_channel_update:
-	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1525,12 +1507,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
 	while (tre_ring->rp != tre_ring->wp) {
 		struct mhi_buf_info *buf_info = buf_ring->rp;
 
-		if (mhi_chan->dir == DMA_TO_DEVICE) {
+		if (mhi_chan->dir == DMA_TO_DEVICE)
 			atomic_dec(&mhi_cntrl->pending_pkts);
-			/* Release the reference got from mhi_queue() */
-			pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-			pm_runtime_put(mhi_cntrl->cntrl_dev);
-		}
 
 		if (!buf_info->pre_mapped)
 			mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index f799503c8f36..278fc2ffb820 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -429,6 +429,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		ret = -EIO;
+		read_unlock_bh(&mhi_cntrl->pm_lock);
 		goto error_mission_mode;
 	}
 
@@ -459,11 +460,9 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 	 */
 	mhi_create_devices(mhi_cntrl);
 
-	read_lock_bh(&mhi_cntrl->pm_lock);
 
 error_mission_mode:
-	mhi_cntrl->wake_put(mhi_cntrl, false);
-	read_unlock_bh(&mhi_cntrl->pm_lock);
+	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
 }
@@ -1038,9 +1037,11 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
 		read_unlock_bh(&mhi_cntrl->pm_lock);
 		return -EIO;
 	}
+	read_unlock_bh(&mhi_cntrl->pm_lock);
+
+	pm_runtime_get_sync(&mhi_cntrl->mhi_dev->dev);
+	read_lock_bh(&mhi_cntrl->pm_lock);
 	mhi_cntrl->wake_get(mhi_cntrl, true);
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
-		mhi_trigger_resume(mhi_cntrl);
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 
 	ret = wait_event_timeout(mhi_cntrl->state_event,
@@ -1049,9 +1050,7 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
 				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
 
 	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
-		read_lock_bh(&mhi_cntrl->pm_lock);
-		mhi_cntrl->wake_put(mhi_cntrl, false);
-		read_unlock_bh(&mhi_cntrl->pm_lock);
+		mhi_device_put(mhi_cntrl->mhi_dev);
 		return -EIO;
 	}
 
@@ -1339,11 +1338,10 @@ void mhi_device_put(struct mhi_device *mhi_dev)
 
 	mhi_dev->dev_wake--;
 	read_lock_bh(&mhi_cntrl->pm_lock);
-	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
-		mhi_trigger_resume(mhi_cntrl);
 
 	mhi_cntrl->wake_put(mhi_cntrl, false);
 	read_unlock_bh(&mhi_cntrl->pm_lock);
+	pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
 }
 EXPORT_SYMBOL_GPL(mhi_device_put);
 

-- 
2.34.1


