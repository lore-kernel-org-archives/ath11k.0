Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E964C56208
	for <ath11k@archiver.kernel.org>; Thu,  6 Aug 2026 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymHCMhp95SwoR/lwvbU/sbCoey356/mVPBXGq5SUs6g=; b=tCTt8AKbt67evBsTbPyVORMNEj
	tF1BF+Y4Pkn0aNu1vm0WmLtKPUH9jPhOKdwjSgA5kRO86BeuxlSWIaFjVJ111W+POOeFM7qxPXSrd
	Su5WN47zHvn06COf8xM+a6K1DJ6m4Qj18a/onXyNpfgZ12yjaaKEqfIz2P40Wd0mxdNOAnuOKusxw
	AGumAGhsqKPPqQdFuoxqJOzUPtWMZ+lJ+e5qPwESSrtYA5mnaFM+fRDa8UbrbEjDIEDDTC9m1VFFC
	VYkaqDRtNXhEPpcHFr5elkwEMumdaBqsHZlxYGYiO1z1ifOUJaZzjmhZ93mNFtUOLZT3fqb5NijRI
	DywM/Ngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv6c-00000005WdS-3g4s;
	Thu, 06 Aug 2026 10:13:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv6a-00000005Wcd-1Hkd
	for ath11k@lists.infradead.org;
	Thu, 06 Aug 2026 10:13:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neIE2104782
	for <ath11k@lists.infradead.org>; Thu, 6 Aug 2026 10:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ymHCMhp95Sw
	oR/lwvbU/sbCoey356/mVPBXGq5SUs6g=; b=TGLP2pmFsXdzO5FNEF0iDY+wgno
	wazJauWdBUf3W7CQ2F6lR3Y6MEA5c9h8QQSgYPiuM1PafpMa38EAYMyxwIU8HURN
	pm7xxwbtJ0xwFBal2ww9PuPih4fmDQTCiICTgZdJVfYCrO4WrDNDbndSNe+CYeVs
	FQ/tWM3kWqtuuZKc06aYF3VKyee0qqyJdZ1+ofzOzsSODwIOpntY6wiqS8Y6sUit
	1lEMjUJcO3wDVbBxCzDgen3ISeqdgH6WeWtO0fnCePEuUnimOE+yu7tBROSa9VnE
	BuS53+XTLh1mV+M9RB4jtZ5VFrjfSY+bxifNNYnNJlpExdFVJ6W1aSxB43Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvq730atj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 10:13:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so806181a91.0
        for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 03:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786011219; x=1786616019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymHCMhp95SwoR/lwvbU/sbCoey356/mVPBXGq5SUs6g=;
        b=WsZSQ2A43kqdBY4f/3MTVfuXkcMbJYhm6h8c1cxoqfOIJ8uGMEDvPjKXTgNTRp/STs
         wKwG1UrmUYOvK1Sa7YDvAjOaP+sTu8/WMXF+qJDirbDmLlR2z/azee+AsaN45JGuh7OA
         P7OC2zW1jOYqYuc4vOHIulcuWL9xZFWpPz3WxfXBA0/dPnqI5P/NrxHP2SXNfyoxDZCW
         hoANUpKgd9Q6waTFnCTOFB+wctjmCivGM7KEG/Fte7akhuTrAwMW6To89Of+uZGTDt7a
         0dmPXhHfTy/hbBYMu8sgemxk+RHoCKUesAptg0MXrTQyO8Kxxrj4pi1/Iv8QLpVGpes0
         N8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011219; x=1786616019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymHCMhp95SwoR/lwvbU/sbCoey356/mVPBXGq5SUs6g=;
        b=BLK2223mLWPmG3rnQOdsVzMJsO7reCbn7ufs2iBBucmPKSKZVRZc2vrZ7gSIVhrOWl
         JYtEDZoaVanbxMJBXsBTLZYYGHWdhJvJjLVRtkdlbXhhyachMom+EtdP128Z8ebthDyp
         wrNjQpw3iNp5/Jv4wvMXuSAJID1yZN4kF4gaJ67HzSnaN5mHCcQ994TA1zXEMfGZnPBC
         9hVTWUw+ZDBbEN6aRmy1KEbm5f0AGYA/3sBICNbGkInDaqaR0KCvT59ekpTJLYxg2dxn
         3U1+nPib+1JJGRmcmmuBWbJi1KHsKwztO5m42CrKUAXDMS4InN2o/ao/NTiRzM2tjjee
         aIMQ==
X-Gm-Message-State: AOJu0Yx5HRQU8tt9OMtvESpmnzkX0okuhu+3aQ8PLPSvqBpD6qN6N8bA
	26xCRWPAPmVUB2qiT0Uho2GzhWRHFH8DZLMemfwkAhR9moppvRZEn9razo2fdxzWtk2FaKIwkOO
	RJqBqxFP7eEzNd9QRp00RJztieigUHULoDQzesC3D++YY3bKaX4YPQ9ATqMqbqkpQ2iu0CNCyMI
	s=
X-Gm-Gg: AR+sD13crctZUAWjQkXLyGmekltAwoNq9BgiMvEHdYp5w8poT3bV5q857kiOIANhfgK
	zw1+sDfo8l6q2cia+zlgRfevvHOx64vkeZttn68hLQil/1cTggSjnSufHmOqQAK89Sau06QzMuR
	DPV6aNkARmmmO0RZvsDwEbt7eOD6STANsXYqYziT3lWGljGFfXdQL7VDgibVB23lmoucITi3T7V
	q9T6dZwsWydidRsEVhZ9jiAu3TgUQEA+KX8+sXAqJALiX5ajPxiYXcHSWUn+76bXPrqDx/CRO5S
	/SWkrVFtNbibAiXb9/9+g0QRVPtjr5dA6LDvP8ni8tinYrcXI5ABieJFv3nA63ohRUcBJ3Xs7KZ
	VZ5SJElHjEYOQiAyKyvnXmwFGZ4pVD3DXPs0F4xIwZRaprDw8TNLHJ0HjRLI=
X-Received: by 2002:a17:90a:d2cd:b0:38e:5ce1:ae30 with SMTP id 98e67ed59e1d1-390897d2041mr891730a91.14.1786011219129;
        Thu, 06 Aug 2026 03:13:39 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cd:b0:38e:5ce1:ae30 with SMTP id 98e67ed59e1d1-390897d2041mr891721a91.14.1786011218641;
        Thu, 06 Aug 2026 03:13:38 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm1257090a91.3.2026.08.06.03.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:13:38 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current v2 1/3] wifi: ath11k: fix sporadic WLAN initialization failures
Date: Thu,  6 Aug 2026 18:13:29 +0800
Message-Id: <20260806101331.484063-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
References: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfXxT/zeVcOn1I6
 aw1CDQk2bjVLiBsud+bZzlrRMIJQSbKjTS2ZFKxADYROSOB3pjceKq9tb3HXzlxlutGcnd3KK+p
 wwmfMkd57qkhOeIm98wbPDtVkPlWtVgh2KBQuezW5cHcKbSi7XYD/V/31QDva0lEAkAZ5t9dvq7
 xoRtMmCCek9JqbYUa33Q/DwG6+j2n87J4K4YpD4WpHaQrNi1XzMtwRpunElfL4j3ZHT+CinEShW
 jYQAVHQ0gTXOcdgSBYZsuEW7wJD+aoZ3UzXUZ9SClmj/q1KFaXf0ZNTqAPuuWtMx+ApQK9/BXMM
 /ldUFrsbrSfVlqbVcHDsCmnbh4Bd5PpzjAxFh/+qUEZFWcq7+081o14f66BqqYiV6rbfgVmCGB6
 zhh5QAnNYoG7bBdoiPgRKOz1N3qbPR6wphFMg90LpYTEIhctrH2BtPPjVndWVK1IYZ1ekZpNPCn
 Wc/gwQvQSo1zJYNGLUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfXyi5S7k/zew7G
 wVbcni3XPJ0s4x/fBccl4zm3JenF1Hp56uZSa6Efo8wCleFjj/asPzDr1aPVQWoRDdMQA52wS5p
 9zSlsuVFhxeTdugaScnRenE2D8Lpk4s=
X-Authority-Analysis: v=2.4 cv=EeH4hvmC c=1 sm=1 tr=0 ts=6a745e53 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=izyCnyVwb-cPu2P0njQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7WvC6cF5NqjgvMIyiVAVn-A1bu9qpFNf
X-Proofpoint-GUID: 7WvC6cF5NqjgvMIyiVAVn-A1bu9qpFNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_031340_369727_6D0A0919 
X-CRM114-Status: GOOD (  13.75  )
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

On WCN6750 platforms, reboot stress testing occasionally results in WLAN
initialization failures after boot. The WPSS firmware reaches the running
state successfully, but no WLAN interface is created.

Analysis shows that ath11k_ahb depends on the QRTR SMD transport for QMI
communication with WPSS firmware. However, this dependency is not
currently expressed in Kconfig, allowing qrtr_smd and ath11k_ahb to load
in either order when built as modules.

If ath11k_ahb is loaded before qrtr_smd becomes available, WLAN
initialization may not complete successfully.

Make the QRTR and QRTR_SMD dependencies explicit and add a soft
dependency to ensure qrtr_smd is loaded before ath11k_ahb.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/Kconfig | 3 +++
 drivers/net/wireless/ath/ath11k/ahb.c   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 122726f84492..44b520d2e66e 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -14,6 +14,9 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
+	select RPMSG
+	select QRTR
+	select QRTR_SMD
 	help
 	  This module adds support for AHB bus
 
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index ec5bf5c9fd79..e417b0a0f2d7 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1343,5 +1343,6 @@ static struct platform_driver ath11k_ahb_driver = {
 
 module_platform_driver(ath11k_ahb_driver);
 
+MODULE_SOFTDEP("pre: qrtr_smd");
 MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11ax WLAN AHB devices");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.34.1


