Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522BBC55ABF
	for <ath11k@archiver.kernel.org>; Thu,  6 Aug 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz+Xi3sIoSgATAmnnTJCucX6u98YnUmIS2O6aEmGou4=; b=lpegImnfu78eJkTBFBr7UaLuLC
	PQDLunWAqC0kIimNVFoDQCKlnBcFVYgyhtufeAojW6ysgFJiq/O5pKoSH+3tLhONfYv4fZ2XLbADo
	xY0vTIRSsmTkxk9ZaOO8rRZQcOTXO2USZhQmNpGid+YLZTbM3zsvV5SRyIkI85I0q56fMPcJWatib
	65Z0eNCUnHpooTZ6wXGFSYO7CV5tqs4vffBrkNQTP3xNjn8ojTwEA0bzagRDLI9TH/oOEBMb0EWZH
	4xos1NrJdeLk3BMbexw2zKJAU9U7QCaFTBjaGg/4jdEJjcD+dZWDWPqkgI+bGWW0VqarPeoZVbWNZ
	TT8k+h8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv6f-00000005Wfa-40P7;
	Thu, 06 Aug 2026 10:13:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv6c-00000005WdO-3eRG
	for ath11k@lists.infradead.org;
	Thu, 06 Aug 2026 10:13:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ngOg865644
	for <ath11k@lists.infradead.org>; Thu, 6 Aug 2026 10:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xz+Xi3sIoSg
	ATAmnnTJCucX6u98YnUmIS2O6aEmGou4=; b=cJ/5JT27fAacIEjgkT+I4O0PWDf
	5d73bWYAerUeOm0vPWsOgug5yr8gwEp3HAg+zNax2nL3t9n+KuBxQx68+G0ykWQc
	Ugt2MoW577nkg7+HGA2kvRVTcdkHJoO3+o2uYnMlAD7dXGT22CKLnIf1eW4z/zOo
	wLG0ULkMnMPHr+H0iDyDCDGo1ntGTJAGhMKL/vZ8kOtpJatfvJKQMzdJ4AoWU3+i
	RR0UuIoOLyozJseR6V+8Ygc7xwaTnZhTNhEjPUvpAHU0IBX8tyndjADAjwZvKro7
	RCwTLFzCbx5F4mt2fPwp6YfclqwoAK6koQAl5AJ59WaD4FVRAee1Cy0Vo6w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5bm8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 10:13:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbbb9c9bfc3so1272891a12.1
        for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786011222; x=1786616022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz+Xi3sIoSgATAmnnTJCucX6u98YnUmIS2O6aEmGou4=;
        b=MtdT1KybEzNCEfIZO06WoFC7UEtSDWxgSWdVQUF6uQAtfmJzUxuWnR/XTiGxLlgyru
         1ZWxdH3Elio32voser4I1jNXBl7qPM7FXKuO6jpnyw5BB6TkKym2W1op5n3cr6LG39J1
         6nGmZIt/EMqy+cd15CyxkCVUqRZ8LehHYy7Vgm++tIVWn7gALnUN/Tr/niXGgBLLEXiQ
         l7nABTH57nwZ0lhV2R16hj6BI/wyKXCIcNSmRv/Tmkp54ZSJlYypl4GU6hPYJcVVTqGA
         KFAOTAjOm9+/SyU5Rs7IV9y01lJBzIjFFtEZ3lHllRyt8wIg55gnGcaF5mpbCMQqNpsm
         ClSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011222; x=1786616022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz+Xi3sIoSgATAmnnTJCucX6u98YnUmIS2O6aEmGou4=;
        b=tBYtFfuU6LcdQ9RKIokRHGVHCBc4hM2/FM+aa67tl+a5RFZdeoOTCsm/D9zK2I6Mm4
         dE10Z7UlyXpByuzDFVwqLvUuHLFrhgMWupyRGXOvAgXb5c/JRlklRpkX70Bq55aSQ7PE
         DG5m2XpoN3/i6VrLnqnogup8FVKRZ5b1z+Zk+o8OTsLm4YoLjskVK5NqQMsHYgKyMlTY
         EKYRj0BS3BtFd1fxblSpzBiGzd3y0vQBg2kKgVZh1mB2IgYkOl6MvNxukz8vSoowINT2
         a7BWpV8tgHU3uMAcM2XnfaEEvVN2ILnmbvOCT9rnhptqfwfKIG3b1pWkxa8xoV8aPICv
         Ybig==
X-Gm-Message-State: AOJu0YwiRHidu03aLQ9LmeI5rMq6nT3784LCsYTyjWZIuGYDEc5Qm8X8
	C+srXXGuFBm80Y2tvfR3WhI6j4sp3pbYS89Nu2XV5xzMZNo/7LY6r8Ayg+OH4GlMT2sC+r0AfgA
	c4r2IEz1eHZmwNemhrC945/ukHpoKKG3c5ioYViqVuj+Nj/M6kW6HdHDYRVZ/Yr7S
X-Gm-Gg: AR+sD10TFQ/RChK9kFJisv7RAosLnaVkbQ10z8wZ+bR02FRR0k1ZG8x/OY9jEOdfeHW
	N3bD899TMbPgaUtk+dcsPUsP83EZk6AxzFH/jJyJWtSs32lT3AZMqec3hIHvInLLgmy6gqUIA1C
	URFPCkbB/R/NnkP8HVRCOCkIyHYqpAMg/HgZmDLjUMLzueCvDggj6kO033Vir7/nLMsE9wb7Cib
	/JtbHMyZl3IkuU3DL/9pEbamNR/8+GwvK9TzMjX5xtMRFfzynBwDEOD5B68n6rmSNClhZYf+d01
	mrNRJ5CjsSrPc5X/k2oEaJ0KppyD2IG3Vjpj4LCY0tf89Sk2YGQQ0nh+Abo5755H35zngzD/qWQ
	P5o7KA0xmSPz3h7CI03W+X8c+soUHx5jtrv2KCc35c9EvLRfTDd66gJWT+1I=
X-Received: by 2002:a17:90b:17c6:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-3903c59330amr12938705a91.9.1786011221408;
        Thu, 06 Aug 2026 03:13:41 -0700 (PDT)
X-Received: by 2002:a17:90b:17c6:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-3903c59330amr12938657a91.9.1786011220912;
        Thu, 06 Aug 2026 03:13:40 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm1257090a91.3.2026.08.06.03.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:13:40 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current v2 2/3] wifi: ath11k: fix NULL dereference in ahb remove when QMI init incomplete
Date: Thu,  6 Aug 2026 18:13:30 +0800
Message-Id: <20260806101331.484063-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
References: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Hc10frrZEFBO5ccBstGVdU62Ql911Wmw
X-Proofpoint-ORIG-GUID: Hc10frrZEFBO5ccBstGVdU62Ql911Wmw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX9JzHOfbsgKXL
 xxTAQJ/hcHtrVNZunyxRHhMMdibgvYkhCYxtm/KPi2pJDduFNh8s0ePqvJ3lmH/2GawFFm09gLy
 91nFnL2b8WtWABNDV0T0KMNFisB2qi0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX/XdKVi4SdYR1
 nheLuS7UWjPDk8cPfwbcw7dwuZEXodEdCndXypWA+N1jA7t1qBBGnHz6fxjEjQ/dwZ/CHF6TezX
 FmIS6+JVzp0SJWtHr/IZK5BpRdHQeqId3jfFgdSD4RUpZPbvqeWKUu/BWO/H0MtEU7e2r0pvPRq
 vunM6KzwJgaN7pCcPP5nfbLNQk4Zr2VL1YXlZLwe2BUcMFlX/4MdvsMN9YaFhHa2MhFdBlbaW5W
 y9KDyQLWf1Hpp7y7fJi1ImQYAB0NDsVD/YJmMYdfR9jDvgW+V2/+glHiy7c/4rWVjimF0Tuhynh
 JNLIhWVilwr9wiFlYIG9yGcANI+8QF/QRvfHpO5hTkzh0yHs1q0X930eKB+glSx5pttXq7fluK3
 uATNqzsX9TFMDXRJ1o/c3sq0Ed1oyOkR1P5qKVvhy2E3a04bKoKQ/U7W4dYCJag5ZuV2wqO0cpI
 d/4iQCrCkNS44y3a+lw==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a745e56 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=yEnPkioJ1CB-1oi1TZ0A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_031342_924841_E4FC6D07 
X-CRM114-Status: GOOD (  15.76  )
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

On WCN6750, if QMI messages never arrive (for example when qrtr_smd
is not ready), WLAN initialization stops before the device is fully
registered. In this case ATH11K_FLAG_QMI_FAIL is not set because no
QMI event handler is executed.

When the driver is removed, ath11k_ahb_remove() still calls
ath11k_core_deinit(), which eventually triggers
ath11k_ce_cleanup_pipes() on uninitialized CE pipes and results in a
NULL pointer dereference in ath11k_hal_srng_access_begin():

  ath11k_hal_srng_access_begin+0x14/0x68 [ath11k]
  ath11k_ce_cleanup_pipes+0x184/0x190 [ath11k]
  ath11k_pcic_stop+0x24/0x38 [ath11k]
  ath11k_core_deinit+0xfc/0x1c0 [ath11k]
  ath11k_ahb_remove+0x38/0xa0 [ath11k_ahb]

Fix this by invoking ath11k_ahb_remove_prepare() before the state
check and skipping ath11k_core_deinit() if ATH11K_FLAG_REGISTERED
is not set, core initialization did not complete and CE pipes may
remain uninitialized, making ath11k_core_deinit() unsafe.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index e417b0a0f2d7..c3ce5ea36e3c 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1296,14 +1296,15 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
 {
 	struct ath11k_base *ab = platform_get_drvdata(pdev);
 
-	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
+	ath11k_ahb_remove_prepare(ab);
+
+	if (!test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
 		ath11k_ahb_power_down(ab, false);
 		ath11k_debugfs_soc_destroy(ab);
 		ath11k_qmi_deinit_service(ab);
 		goto qmi_fail;
 	}
 
-	ath11k_ahb_remove_prepare(ab);
 	ath11k_core_deinit(ab);
 
 qmi_fail:
-- 
2.34.1


