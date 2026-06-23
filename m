Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0C2CDB46F
	for <ath11k@archiver.kernel.org>; Tue, 23 Jun 2026 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ViNuCLfK+fFW0U/eEAsK3rYml2n+gN9k9b6JwUIS9lw=; b=0w1/XN236EbO+Uc/nEmR9XmYlG
	TwV78SSS2spGm9NzrclD9pDHSahhsRKu0PihMFRqsVShUgjPz/FCM8wZ8w5Xk7LVFRNPFSALep6PB
	acZzcZk/wtGA+2542TOwnSquKbSswMT7JRRIv757rHwoOyX8tIMytScRMbp1DPHbQFUcYhdR5ZSR6
	mE0hDv7FtBvVj/Vj++P1P4dwt6Q4P00lMEk+YGNSp+UXEbh3bbffYVM+KMDnClXta+d8q9yF9DVal
	LE+UKM+9BUUIb9P8cWayw3FHNgOgN1BjZGD3ddQupyN65UeklPq3u1o+yN5e8o5WraLPqXiiJlqVd
	jpkYqr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1wK-00000006Q3U-1CEn;
	Tue, 23 Jun 2026 14:17:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1wF-00000006Q2H-1SU4
	for ath11k@lists.infradead.org;
	Tue, 23 Jun 2026 14:17:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NC6ojJ3745537
	for <ath11k@lists.infradead.org>; Tue, 23 Jun 2026 14:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ViNuCLfK+fFW0U/eEAsK3rYml2n+gN9k9b6
	JwUIS9lw=; b=BlPW4reykkzhCcTaouJHKL40SI3XmaatmqOQiNPkm5HHY4Og/6j
	Coev/dt5js1torALL33PL9p74RoJCak/BC9ldI2D1C/uZgbatHEZBgm1fOW1Zs31
	M1lRi9pbXffMhH65omXEms5Cb2YGnHY4UWPXLKD9oImOrQw97Tu5kb2hg3F/zaNy
	aRDWgDOB+IK6aH0StpaadQLpuu7AX94i+UVbKuoaNb6YhSxSx5rhWkULKVHZ0t/1
	4IzGwh3rc4/ILMV0SJPAvZDNMtsHzbcpsq1e+Jm/67G8KnSX5FzIzreLa6JIahpj
	GCpeUeYtrzBD8xMF9B5lnPMhsrlkJ0xgkeQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3ghaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 23 Jun 2026 14:17:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97955899so3799701a91.0
        for <ath11k@lists.infradead.org>; Tue, 23 Jun 2026 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782224238; x=1782829038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViNuCLfK+fFW0U/eEAsK3rYml2n+gN9k9b6JwUIS9lw=;
        b=CrfA6t35Lgcw1/Mmi15PB7IP17lUZ74eNazRhUGj5z5TjpPc6UqT0o2cCWUK/XStG8
         +B/JR4tanM7qO/E0D36vnKaBB++LOHq2v0M7luO4ViPjrBzXiIq9rTTM/h/SfsZuj93P
         M6WUbq4yTYI+sHsOvkiMIBXV4ZnIQK8JhDe2XMK54YPpnlBdvm+fKqjSlYmze3j81s9R
         SBXIQEVkMnrTAXWFi8RVLjDEk/i4/oVCKop2COd+dBx+g8rESp6t7A79hxhUtPVqO5IM
         UEqeMkdi6LEO5BjWXLJw9wzYWXO5ZwFJJYKHW/4NMuq69BrQ99/aEhZap2l2qglREpK9
         EThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224238; x=1782829038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViNuCLfK+fFW0U/eEAsK3rYml2n+gN9k9b6JwUIS9lw=;
        b=nf+2zAxluq0am79jgTDx7hjuoWsoIJDa0LOmOws4pTEaREwnr3ijjWa3ELmyzn2HFH
         3DWpa+FrCyNUSqpEx0iQ8hJcY6E5izN/az9aIxkpXkfQUdgtK25V7/mC2dbx+w2pbh61
         B7u+Y7QojJmOtCh0fV8bkWJnzDRjgip9ZfcsNIah4M9I656nn1faH3G0itqEWiU9KVVc
         aMc78Ms8y3sBLFs0usM79QFm+PQo1ldl2jrU3LWPK8UfdS2O+BCIPowQj0zCF+zPrxVz
         TnK3Dp7ySQLI6JMwuPEW4vDVSMVr5FVx0hrF4XuHY9PGYGY6w5lupIvioBqVqGfkTUA3
         yaJA==
X-Forwarded-Encrypted: i=1; AHgh+RrPQmZktaE4Sd2i6LrJSc0jBoGRLrwdrQnPTYCvAPS3F8j9JWT8jc6x0xd4R6eHdu29Nz8tyLI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxlrWzV3u04Yd+1t3YKDfMwBFWeBCzp/IqKs+Xo2gdFEkC5lmV
	UIe7LMBsOVMVTbZQwEPZmol06B/JbYdi/9eKVFAYZLX8ywec3+Jye0Sb7eVgHz4RWD7U0GsuhBz
	SIbaIGpGyRlGTKIPreY0KtWEztrTi+Yo3Z6rC0q7kFWI3IRWfVVvi4TbigL1hzHlFGn+5uyVl
X-Gm-Gg: AfdE7cmcBIgjNQgd+IYjUPKza+UYXDRrZEH/cNLLn0T3IzTGhiSvK+upZAFKE0cnynj
	GSiUpQ82+127T9T/QnWEIlbRLQisWHBeAqR6pK+RfEoXrz3BZ3XirnLFNBgOiTEJiQtR56lIjfd
	zGKVAdSMBrejTEyHA1O6yGmYFUBqPDJwFRTEgIqm4yJWFgsfpQQI62TatDJvFA/tSbBxWr/7/55
	qwYcQUvQFrJ/MF+IgU4zo3/qUM9YihfcQ8KC2wfyNKumANxSYcaLDWk2RcM4LMIWUqDoIncdDfC
	RbM6hvQqwsangWvrlweH1TNpc+gWGtZZtv2ZmObOB5IGsy2F5EX0bLAu33eX7uEMfX8i6zij7Dw
	TIFAOLoogZy91XfGtUsdTZNcr91skKmQoff/jgJu5YauoiNziy3HXP+bWOBWK
X-Received: by 2002:a17:90b:1f91:b0:37c:83ec:1641 with SMTP id 98e67ed59e1d1-37d4d71d7d0mr14541720a91.5.1782224237751;
        Tue, 23 Jun 2026 07:17:17 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:37c:83ec:1641 with SMTP id 98e67ed59e1d1-37d4d71d7d0mr14541655a91.5.1782224237179;
        Tue, 23 Jun 2026 07:17:17 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.199.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f315842sm10094199a91.17.2026.06.23.07.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:17:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Alex Williamson <alex@shazbot.org>
Subject: [PATCH 1/2] wifi: ath11k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
Date: Tue, 23 Jun 2026 16:16:48 +0200
Message-ID: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDExNyBTYWx0ZWRfX3+M+zDqrgIyM
 kkAcIQgJTEu82w0gbNAwVKmEdZGK1miQylVZTU8W90ayksIeAyAwrYuh7hZUFTKs2asRO1hdynJ
 9NRE7Jcs93jCpZXW5yl1L8zIQwWqTcI=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3a956e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Alb0JCXUjTgUeOUvUsHAUA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=b6JBSybIbF9IxaTxWo8A:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-ORIG-GUID: 0vOZqJYHrmRpSiEnI1JXDYZAX3c1DG-8
X-Proofpoint-GUID: 0vOZqJYHrmRpSiEnI1JXDYZAX3c1DG-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDExNyBTYWx0ZWRfX7FeLM8I+6B6+
 bn6+rCKX9kW7uxsfj2JGKnu02Os9qPMo1y+QUL2CAveXIVaNvzybgASiCzJRv20Vl9dSfpC9Bgt
 K+nNo9IDe2mnFc70WCatCGAIETkxnoZA7pLKKRySsdmzsary7i6r7ik27Axoq0rNhDf+FOe1BVF
 QZ/zrrhAVYDjHBO7rCf0oO12MfJjQF4Zcr/KjbZAr0hMlS8/B3MEjEaHQhKLg8q/GBsev7d9ezg
 1QKcAX/F9BihqP5SZLDlN0K8hCVcjGQW0pxUmmI8oy6UlX3ueoUJfDgQMdEK9r7RCPI4k6UHlSf
 JOkWwehpct2i1GuezcXHMLt+CmBDhg+6pd8QkIIbFNee2QDu8sbn7g9wRhUcAi5QQ2uzXkbJkV+
 rrpAmOHDVsI6dSo9J0r+9Z7Fu250KtlI+y6tM7DGledmxytocpJVSJ8Vt1uQDOJoVoaLg5BlPJF
 pYakVrOdPzrlwQ8VhuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_071719_398841_60FF1483 
X-CRM114-Status: GOOD (  14.13  )
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

ath11k_pci_soc_global_reset() tries to reset the device by writing to the
PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
that the write gets flushed to the device before the delay.

This may lead to the delay on the host to be insufficient, if the posted
write doesn't reach the device before the delay.

So add a read-back after writing to the PCIE_SOC_GLOBAL_RESET register and
before the delay.

Compile tested only.

Fixes: f3c603d412b3 ("ath11k: reset MHI during power down and power up")
Reported-by: Alex Williamson <alex@shazbot.org>
Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 35bb9e7a63a2..a163168f3617 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -199,6 +199,8 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 	val |= PCIE_SOC_GLOBAL_RESET_V;
 
 	ath11k_pcic_write32(ab, PCIE_SOC_GLOBAL_RESET, val);
+	/* Flush the posted write to the device */
+	ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
 
 	/* TODO: exact time to sleep is uncertain */
 	delay = 10;
@@ -208,6 +210,8 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 	val &= ~PCIE_SOC_GLOBAL_RESET_V;
 
 	ath11k_pcic_write32(ab, PCIE_SOC_GLOBAL_RESET, val);
+	/* Flush the posted write to the device */
+	ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
 
 	mdelay(delay);
 
-- 
2.43.0


