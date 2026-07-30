Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F422BC55164
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 03:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZIFPKJkDGSnuUkEjLb0SYepjsgYlAfbbIULDJ3tKKg=; b=SBuV8K7t/i3m5KeXiuzqTsbPMK
	IZ8CoClqniu1UeeUuGqLY3BEbKoTE/6OAHQqdnkniC8YYrt1lmSaXpVz9PpLDM/xMTrlyzi46iJbE
	leQSG0t6YFoDVPRTuX1ziXhYchgojPTlQ68gpZ2VSGMCK9MtKvT/VtuiJmMkqf0V8HiXoiflfkBVr
	ppCBYAvNwCItDVNUC4XfijHDCViR+Tukuhe/Iz0FWeYz0WeYjZGUHucj1DY4YuwfPdakINXzd0KuG
	6wcN7LBu6tfmF46Tw2K3ZROHX1EVJixBNtAC0tFmG/lb3hftxvTYxozOJMLTiAMLFbdhY/0Dn+HCE
	TJ/SkEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHAH-00000009OOg-2Bw8;
	Thu, 30 Jul 2026 03:10:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHAF-00000009OO0-3eOf
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 03:10:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U38uMI3902045
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 03:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GZIFPKJkDGS
	nuUkEjLb0SYepjsgYlAfbbIULDJ3tKKg=; b=kAN4Hfc0x/FTMR2hZLIDyb708Ax
	ryMPkJdcZif/Y5R7tB1PywQvcaWeOUhKI9Z2awNLFhFBpGyW0t43uegfljVDVaLY
	drL/a+gSDQ76KAbcl5K2pimZFDLIGWQYa5l2QrhLAWy0ALew673+lWnU2ZvMx9hS
	s1CCg9pG8LIR7rxri9MAgu2+eNS/ELOc5TsjfffQIVuu6c0w2OeVL97ByG4lFnTw
	fF8Su4i5i0bRFvl1x/ARV/fs4EQOfnIfn9lolnEMG0QU+FuOJJ7Io7M3TvuCkTsH
	P+qrCUz5DtdVR3705n18Q0FpIjHqtojYjhnQCyR/8xphicWaOQZ1LMlZJeg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqxf1806e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 03:10:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so16064205ad.1
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 20:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785381030; x=1785985830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZIFPKJkDGSnuUkEjLb0SYepjsgYlAfbbIULDJ3tKKg=;
        b=clsvCfa4cTkSyeAJ56ngdz76Uigoz7bSitrLfrNhaXzVJhmTm+c2MTY5vk37921/bJ
         UK4eGkh3wSmDOfD/EIiVqI+NDmersU2g/tso2PxU/36cvEB2RPXBq54w39QpYt22rI1m
         EW0gHzrvLCYWAu4PzR4lDfmx/E02QzPgrxchyUeZ2ys0A9fjq6IyuG8xB/3fDSxLpPy5
         QQtQDjmZyVUJ9DCw6TMS4m+fZ8X+zBu+iNQPCXOccSYZCqUTJapPgV4JnGdLATmk+JO6
         4m6gm6KirKaZijta6U6SpTt9xAH/7dcEpi3B7IBp08awDyN4BP5V3d/OZmRjdMje9cFP
         mUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785381030; x=1785985830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZIFPKJkDGSnuUkEjLb0SYepjsgYlAfbbIULDJ3tKKg=;
        b=Q5cxgWBAMISHfnxojxUTSjNiU4gNCY67gV13HhrLw3zH93OcLbLoQyDN+PcRRLzDPg
         CYuJMkCSlPP8TuKAy9Hxu5x3WRvR/rq03WE+oy7vmlAGvoAHzLQutjfpPeM2G3nA5V7+
         KqQecMW1j9ZykfsqG0Da7EL2KIkaHkDXKiseDZoj6uOndXX3f5rV5FrdzXjOAU1WVzUw
         WDzNJ2UUMSmNiaGTDpz4Y0gdKX+6AQ6HR6OeFf4l84UZRNso5veLZYQJ5opGbS9Hw8sd
         L6cvILCnYLYIEwpK8u55hhj/4Vc2Vo2kOVCZskMqbON0hj1QTMAa68qiipqWSUbHL5tg
         FMpQ==
X-Gm-Message-State: AOJu0YySNgdrNlut+cGMTSQuIDwwF8NxEmSx9prZEOuTd3tXcd31ZHmI
	Mse0pawuWJU4kOAGcmnuZ6K3ls0x4DxcsU10u0ByR15sZXeQ0NrsrtVzAxU06PJplIZVhACSYuF
	wFbiMYzJrRdDPsDVTzv7mo+YTKk8E6gGwfosKfrLyJhZuQ+oFwuE7HjngOI3w8hcO
X-Gm-Gg: AR+sD10gpODDJb7jWfOUXoVgy6siBUsLLa/rbslBVUNSDsT9Wu3Tyfa4sS44L0QK70J
	jOHUdEWtOl3hUum/pnf9+ncAo3WzjMPIWrW1d6fX349HBeQhBbJ87KTRM3hcs7rcodaITvZpyH8
	Gr2U928ivNiBEo7EjOR2uK1X6pvrjCjN5SolNh680hQjSLIgwXacCvAQ3GjqJFuUzUZhTAFdNvi
	r8AqLxmpDL5rwlTPqnK9NtqvqvB/t06UtKB1ziQeAwpAWgBs4NjpE4pMMpwCzb3Yd9BLUTJdPGg
	zjPgl2EMqtAOrD2gW7YuoUDErHkraRhkLS2Fs/jxMb0hwXm347wRs+rVjx7RsTc/bNGQ4N5JvMY
	eeb34dUw0E0dM8xVOaC3tPRcJSLMRsgBxQ3ekRsc/oNvki8Jkw00DEKQ2EP4=
X-Received: by 2002:a17:902:c943:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2d035cfc878mr8924955ad.42.1785381029863;
        Wed, 29 Jul 2026 20:10:29 -0700 (PDT)
X-Received: by 2002:a17:902:c943:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2d035cfc878mr8924665ad.42.1785381029414;
        Wed, 29 Jul 2026 20:10:29 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2e5b2sm18928035ad.74.2026.07.29.20.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 20:10:29 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [RESEND PATCH ath-current 1/3] wifi: ath11k: fix sporadic WLAN initialization failures
Date: Thu, 30 Jul 2026 11:09:46 +0800
Message-Id: <20260730030948.147892-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
References: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oF1vK8wC3xAMMzbKcQlz5egO92Fdqr9h
X-Proofpoint-ORIG-GUID: oF1vK8wC3xAMMzbKcQlz5egO92Fdqr9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfX4TFqDku/gu9+
 mUw1eSPeBz7faaMcyVUTUglo/zFNnzSTbF8NctBtrZBenGjJYkOYkqOAh5UhAj9GQSslpnmfUA4
 wos90nCZF1wqirnyoHhMsdTUXRkgCN2hKT8psVfux+Uw+u5AlC36qfkWW5VgIma/CaxlBCvuD5Z
 WqmOCCqUYFceZT53LY1kekAxid7M2ld0XKcD/n5bH9A5h2BWvypi0RHlXlgfgAThDvgHxTBC3Hj
 mzTBFeG0AjVnt03DvbpdoDvhRAsghPpCqiKDZhuoVtqrFqeDERGv2fu8IOOcCRAmmvZhw1zYR71
 xBXzhgAAta81+qXzUMsuLOKhEJWAcGvMQfNIGKHC3ov9jMnSHijd9SSriQK4Afw+8cIn4rUKlp/
 i1MbkZ7D6T/4UbmzdymtlUxUQVFd7y4NGV8MHe1gmusgJkJVCSD9Xh8GIBiRXgE94VdiUVil3Nt
 +KOrzyCLfDOlt4twNlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfX2QCG/hMa3X+F
 CJLTT7IpLS0OCv1aqMr+AOOxFWFcguVYZm+UPWAn+7br1ukm3OutsyIfh1FQ21vyBcADQBv9vFl
 2l1VhErI+k6WbdyytKufF6khYs3jzpE=
X-Authority-Analysis: v=2.4 cv=MZNcfZ/f c=1 sm=1 tr=0 ts=6a6ac0a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=izyCnyVwb-cPu2P0njQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_201032_034331_36F21F74 
X-CRM114-Status: GOOD (  14.24  )
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
index 1e1dea485760..fb5640882b98 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1312,5 +1312,6 @@ static struct platform_driver ath11k_ahb_driver = {
 
 module_platform_driver(ath11k_ahb_driver);
 
+MODULE_SOFTDEP("pre: qrtr_smd");
 MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11ax WLAN AHB devices");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.34.1


