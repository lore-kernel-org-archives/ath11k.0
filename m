Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1835CC54FCD
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 03:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYFFatroACJPZgrWGjCltvltJd9wtFIF3w6l6ozfvvM=; b=xMR/sxYDqvkM7bAlAHjSzDqBYa
	TDc9TApgm5w80fCG1v4bdWDgPY8vPT3aKX+zJzV/o2kHJcstrnjZgmECuvAzFFGLRDBT3nvlFJAMe
	iowYukJ+Gr8rRXfhc4ivftPg3kwt9uGO3PUJWZS09AzGL49Ju0VSI0buG8ffz1fOPvGj3/52Powdp
	Hw0pkXspjLNfxe0+SqPHXO2nMoQbyef9tY2XDjfqYZ8ekcIj+z3UoMFDORGnXyGBjGK37fI5TNTqP
	xBp3HIPLHy6NzIr3N09IAcYuGBpE8ANuA5YhK6NjCT1VZ/54m0ycfeP/QathvIf0WLJgsQ7UeteWo
	9YRqBZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHAL-00000009OQo-0QFs;
	Thu, 30 Jul 2026 03:10:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHAI-00000009OOi-0bWp
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 03:10:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U35uU13634964
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 03:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZYFFatroACJ
	PZgrWGjCltvltJd9wtFIF3w6l6ozfvvM=; b=QpFLYYSSZNMpQiFouLUf7ZcAk/B
	FyZdTeRvEEFToQoOiczCsE1wVuo3B1fTaEIOWoI6QWm3M1D22kjYnLz/r8NJ2eqF
	dAUkUw19e1sb3iGgmleSFq82xp0xUXuuQdeJC/JSZY5CfzyipwSyUkwmQz52OZRE
	H6as6scN0vk9NR1QSzeMesrFIKP9hQDiJrwvjMM6gT1QHC/UvaZhPAehqQXjCg23
	vBkMPzlhsduUdJFe0O4si6bPzkA5UKT4MbsqXtYxsBlDU7tQpSb11qzYGcXivWC5
	Kpvu2v2y9zFgDIOpOxG7knr5nycAQKhd4B78f+XmuIfvGL3GohHQivaKvdg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqxde80hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 03:10:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so36987855ad.2
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 20:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785381032; x=1785985832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYFFatroACJPZgrWGjCltvltJd9wtFIF3w6l6ozfvvM=;
        b=HZFVglM7+5CtK5dYCAvy0M4QLGOWpmQ3mWiqQq9EitKer2xglG+IOrRrwgQmcq8d7e
         8tDeeVDT1LYP0ZERlYyUruEOSSXYKWtL0VddwNIpzA+wh6qDUze+3N+cIU8fsHgY4nLP
         gJNlitZE7Ty/UhbPFKMMmO/0bhBnV9y+/ZqyYHheGE5T8BbovEjbhG9wQhSg0Ny7aTHr
         GrEGiskQrTJtUAGdZmKI0H+UX/euY+P9V4LdnrPuD+ysYI1T+WNxvQOEcJirAAjJ/Eww
         uPLdz6/okDBujxW0qRGRYN8ZGxXuFxOYJTGeFIpQIqgVMjprhHREXUl0tDao84cAZi3g
         p8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785381032; x=1785985832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYFFatroACJPZgrWGjCltvltJd9wtFIF3w6l6ozfvvM=;
        b=OadPRSuTnOk63O5DMtU2t2wwukPM2B6Gfa6hn0JBuhRmDNlOy8PjPu40mua8COZw1T
         lOaXi6z+y5JZza93QrMiG9yo8IXYFhr0gDgFk4A29y+WjXrMfRr+EuFHT6i4BIvFXzmB
         MwbSbJDQh8r1rE8oxO4ccZN89p5XorfomwOZ4cCPZ3MWRtHS5JbFDzGtmD6Ai8a9uXVS
         jLux/8XEZt/wGxLtDWc2Mnhx/N3VDima+/B5fGlFMpsGtZNAYeqPZdmhSOeCMBWKUmA0
         GzrK34UlQ4RUV9l/k6xI2DXARGgOmeywEGg4Go7VaHc/vJmFslNVgHfypEEkxkftyKeN
         SJYg==
X-Gm-Message-State: AOJu0Yx2Mhh2Uok5gs1CtWv5Ez00LTRvIly+8IvwEgF8uaEBnzfn/DFM
	CRgpyobg0I+5wsWRik9c+wTxO6c3QJ5zRBxPJvZ/+q9B0Mrg8uQBcFq/1P7Va7naQ+QUY7DL9Lh
	fJlvk1x0VZh6Im1uUYmA1HispZDvFqpFPiwVL12219jM975P/h4k8pfYGrj+8YfvjrwAN0hjung
	k=
X-Gm-Gg: AR+sD13/0UQXBXwdiItaWSaGUR8e5GVvukhYH/GQApTB3v+6yHraqzEYgVnaIRKBOBu
	P6pY5NwDQALBBeUv5/OvLvIsipAchJncyDBl/GJsW/EETJWbm7jr4LuCUnyjRBcT2uwOMjI71hz
	gEtn04mCk8g59dm71spbf4k9jOQSJAW8rggD2b4fkh9Jz6NorTwuY/QxiHp/lGz5Y/JDmQ+DS19
	t+rYVuC5oDUZRN58NWemXZ9fW9m55s37+meWgKCHzWqLUozqdnLv/wseptgfn94l9DeI71vdGIY
	Cd5PYp6Y8ph8n6ZZg7do/zy09i04bsO6OWlg6HvSBOQvW52oorgF8/OtfUnFc33du9czqCJIAnk
	tCITUG15YzMQSMwAvmjlTsfD2UO8gb9FZHxoSptmDeyT5UsJp0b4/JpYhd+o=
X-Received: by 2002:a17:902:c404:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2d035cd9f0emr8998255ad.37.1785381032163;
        Wed, 29 Jul 2026 20:10:32 -0700 (PDT)
X-Received: by 2002:a17:902:c404:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2d035cd9f0emr8998015ad.37.1785381031701;
        Wed, 29 Jul 2026 20:10:31 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2e5b2sm18928035ad.74.2026.07.29.20.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 20:10:31 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [RESEND PATCH ath-current 2/3] wifi: ath11k: fix NULL dereference in ahb remove when QMI init incomplete
Date: Thu, 30 Jul 2026 11:09:47 +0800
Message-Id: <20260730030948.147892-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
References: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=6a6ac0a9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1dbm4JsyFlBaYKuhsR8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfX4Ou8G0QZijTm
 cXfORtzeyvDc35IqGs8YzHYDixxD6MsC7Rn0OTRkNAUQVufCx7IoxWRAmAfjuI/f3TS/5GoFt3m
 Ymq/WYI/oUysZnagS7VWrBfD8bJp/fA=
X-Proofpoint-GUID: SUdrNSdm-dj2In-ubhm6RLwHT9M6ZA4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfXy43ydxvLcAl/
 tA/UfuvJeMBhSZvXigBd9TjVcFrVFr+Y8bx/PyPxHt9vbHlBfxpMpdNeM3vJRl1jdArFFjqBVKp
 L4laO4jZ0bjnskClnzzMvMvaQs6OyvRFa5bLBN/zBGcY6/PUQH4ROD9dUtwmZWXscXUdnQZSB8d
 jg3YSnJQAyBjkOELOmWMk9RNGS8w5MBG5ruNyriThshyMjs0zzVEOSzJZF8J8BChoTVs/EFo/X7
 HsMDjH+BrlmvnMK0qRf9FOJKG8Wj0jAIzY0oIQI17MfmaHNwIQ2lvWavMOgE0Rx+D0Vx9xtjSW2
 Mfsr2qMHkdGOXN6OpE4wdsqBNsx3Meu5fOGEYBEotF4tbPfR5a+RM8hD8YuEcubB/AGMOJPDY/F
 eE3wwyV40/zgefgG3a6xhHrueBnnZ85CYRr7ZB4PugJZlDFPMptLtrteiLYRvkH+/+sqhh5b2SR
 NasV417hr9JnCGVm0Bw==
X-Proofpoint-ORIG-GUID: SUdrNSdm-dj2In-ubhm6RLwHT9M6ZA4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_201034_304025_8281817E 
X-CRM114-Status: GOOD (  15.73  )
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
check and skipping ath11k_core_deinit() when either QMI initialization
failed or the device was never registered. If ATH11K_FLAG_REGISTERED
is not set, core initialization did not complete and CE pipes may
remain uninitialized, making ath11k_core_deinit() unsafe.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index fb5640882b98..7f5f5c8d7c56 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1265,14 +1265,16 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
 {
 	struct ath11k_base *ab = platform_get_drvdata(pdev);
 
-	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
+	ath11k_ahb_remove_prepare(ab);
+
+	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags) ||
+	    !test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
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


