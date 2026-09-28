Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC83C9833F
	for <ath11k@archiver.kernel.org>; Mon, 28 Sep 2026 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jTwsyMF5VW6h12cFc72PJnuylDUnWOYRvi8NoTiovMw=; b=T/mDajj+GVz2GE3+NjX6NytHjj
	6b/3tFS2J3S/DOP8iV4YjdzmYv7WxaDvIhWtYdc1/dYgkajCn80YAYnVGW/3xYaUUVwP0u73BKkHC
	Lm1ch65w31BjNXCTcR5ocMXD4d6HDF6ybD4KB5LA5jihkumpjZXwklE1c5SqW0H+VcuaqurxZ9uzt
	LboW1OZzM7Ze6eI+g9SWAHmWh7/CYlKys2E+KGL15qDYaoj2HnasEcssxeRg+qgbCSBe0X2XEJv0Q
	8AGr5ypJwyD1Gt/+/8roa0FDCzJYU7KlGB5fnk0rG8DV3FlmMD4IrMMPQACS2+jogQx0sACyuWrML
	PjNTyZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8s1-00000000NY6-10Zq;
	Mon, 28 Sep 2026 10:46:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8ry-00000000NWk-1o0b
	for ath11k@lists.infradead.org;
	Mon, 28 Sep 2026 10:46:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MAV51446126
	for <ath11k@lists.infradead.org>; Mon, 28 Sep 2026 10:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jTwsyMF5VW6h12cFc72PJn
	uylDUnWOYRvi8NoTiovMw=; b=hMo33KeHx8cN6j+n1VHJg3y4PELhemgRhgVeW9
	qM4ViP7SyFJy5oFLQi4ea18VWamrIVf/pOApjGJVEfXYXAKxNww0saO1bT67kpOL
	xPOjshcM/8V4W2uS1WfXDMKl5BWgxZnbHNFxiY8On18gBfibLofgzh0gfPJnROdY
	+znlXI3K6Jo/CeOLWdHnZVR6UeumjjxAZZCA3wcCrTrQGFuSmglIYIsGv7I/MlAA
	1BOH+N+5AUYARGwG57V15HU9A3bbxmbQ6NROuLFaldupVRuOkqx9rCj7EzgshsyL
	D0cSipdEmRIydS7hS9epITeng4Hj/29Sl/ZxJXax6sOSPdnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkrab5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 28 Sep 2026 10:46:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d55d8cd938so48530315ad.1
        for <ath11k@lists.infradead.org>; Mon, 28 Sep 2026 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790592360; x=1791197160; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jTwsyMF5VW6h12cFc72PJnuylDUnWOYRvi8NoTiovMw=;
        b=cfDFMZO6BQYg8j08kCSTUglu24LMpZ5Rw3mUpyuTTKghUD3LQp0ZfbIr/n8pPNW3Sq
         xxL9Nyuv4sYBKIG+lObjmhjmftJA+tu7cf5aRJtYycxMqGFOuqWFbRbnPTDOBGPD381T
         wXUqRoDuIxptabByb8SrCstMwovM9n+MuSo0GFeNFdgVhyMfyaYVJyHFhYpViYXEjqwj
         Lcjt34PuvcqbFBHxdqZWB+Fsxp40DXdp/3SLrwtxMI14p4VeiKzuU0NC+/4i9ob/DwWz
         Ej5Va3AhnvQM4J8x4nwUsNoolcdapOLzW8bNenoFZErhp1cdBGsui46p/rgIjwZdkdfn
         Y8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592360; x=1791197160;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jTwsyMF5VW6h12cFc72PJnuylDUnWOYRvi8NoTiovMw=;
        b=mXWohG7vTI2QJegGddtSzThbSdUYi4QPGXMjk+fCo6fo5NPW04gmSEYYGQ8A6iwZgK
         9SykQO5lr+UjvyFvqo8F6F9z8r8idRfw+vdzi0lihWUwFQAsf3IJlMVsbLlT6bwF5v+f
         4PiRduLxJEaSOe4KBHg7KL+fsgUR7+O9DROLYgIU7hGkt1cRGiR5cCzoMno9VCsKgtgG
         xulUW2d/y5I0uwSPsirWyr3QutMi2bhOkSwPP/XQPhNQblKv8ePIoGssaYNqcScJIcjz
         fQWG3CY8Lw21DRUKZB4kCX4iyyYxjgP3lTtIldlgc6gzxSkl+UITepe0lx863LKbkm2l
         XpGg==
X-Forwarded-Encrypted: i=1; AKwUvBy7SmqcRSaH3MBp8CLAHlg8Z3b8asOpdQhRmBk4VEej4V8bfJhU3PKWEfeLq1hZZ/dilB8CRrQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYJH3vWfBJRShjzNhE6sQjenHuR4HpMXKaabjnGIx+0NVwfZcp1m
	yOB89UZSDmJy1T41MzV03ZB693nC1QmQx0FYRCdMVm8MVYZhwD64M9fufpgxSH/EMav7AELxz2S
	Pg/YTHy0dAL8wue2q+X3xF8BH3CgX20sv35z93DCePBssatSxxqTerYbdOCsDp47Z
X-Gm-Gg: AYBFou0CIa5jWaLv+4qHN74Wt6t3pmZ72gvwlY3tyB0P+zw6hG20ozWU2Ra9JtRuYcO
	FPC48hni9x1YcWR6uq92Qu0QKmrX/tPajxkK7XAbdnYeCFB9S3f26AXNb7yTn3h54D/fthFHGlA
	34KdgJANEjBceWbPFE0i7iLC1W7WhP7/pgvAMD+D72mxE0elKmPcnPs5z6WzeEm4sz4uCvUWWLX
	nZnN/nQm1EyE6HAKUq92B6lr668lpEqH2rSQ7oPnVOFzsQLBBaxL+YghVHFwA3lZoTOPX8s/AKs
	3I1X3K4f0aQSQJF7Mkd8UviHbejgq8MhVk0hU7vo46NjQpXwJMlTTS/h9yxSdYtORBEKR51+tK1
	oGdQKK7/zNHwrAYb5CRozqDW1GqGlTRBYOUQ2F0iLx+nfH2zL33eN
X-Received: by 2002:a17:902:ebd1:b0:2dd:c100:9434 with SMTP id d9443c01a7336-2df94c1bc03mr78579875ad.50.1790592360111;
        Mon, 28 Sep 2026 03:46:00 -0700 (PDT)
X-Received: by 2002:a17:902:ebd1:b0:2dd:c100:9434 with SMTP id d9443c01a7336-2df94c1bc03mr78579805ad.50.1790592359631;
        Mon, 28 Sep 2026 03:45:59 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm39619315ad.52.2026.09.28.03.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:45:59 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:45:25 +0800
Subject: [PATCH ath-current] wifi: ath11k: fix unbalanced IRQ
 enable/disable during suspend/resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-ath11k-unbalanced-irq-enable-disable-v1-1-75166f534763@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEVFumoC/52Oyw7CIBBFf6Vh7TRAHxFX/odxMaVTS6xgoSWap
 v8uYe1GNzO5uZNzZmOBvKHATsXGPEUTjLMpiEPB9Ij2RmD6lJnksuVKCsBlFOIOq+1wQqupB+N
 nIIvdRNCbkHfdEXYKq4rzgSXU09NgXllzYYkAevWe7MKuqRxNWJx/5xeiyCe/2aIAAUo3LUkti
 PB4diGU84qTdo9HmUb2RPkPWyY2561qeFOjqoYv7H3fP4vQQcNIAQAA
X-Change-ID: 20260921-ath11k-unbalanced-irq-enable-disable-4beab9a3300f
To: Jeff Johnson <jjohnson@kernel.org>,
        Julius Bairaktaris <julius@bairaktaris.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX2BDE5bNfpbRo
 I9gXnJlRsJtWkygLta7Nh1n/IS1DLJwq7MENWmg2pQK+b11QFI/QaI5SguIv0kC7KgwBGTJFIQc
 l4qqFz32DLJBQFSX8wyO/AnnNcjKIBbanMpR7hL6S+denMmE7yu6F9QJvy3H4ORWjz5RROnwc93
 3tYUr0fkbHOtrNbv1c4kQAvN2FsN55rfrfaG9ehql8Bum7wER9bs0y7PLzk3hzO1toikjdD3hXa
 Z+ZxJAI2hlgYiir7GpZSCe6uPdMe3cXQlrRvspBDFqWT1RAgG/+KswBDizpQllYQra7H8KvtxFg
 OuG5JgHPenCidHUcpVvWQwemccxRH2LQ1g4JD/XdNgHG9SxDlnhgmMqP+o+ZTV9w+ZdUHS5dhbD
 lusFKzXyMIC5VmatdIMywwwojOtT7p6l9akhc3gXQdBGmBwtmF+C1L9KTRX0WMb1tJHagC/Fn/y
 JhGX35ys8YscgWXAqgg==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba4569 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=KAfsIobKxm3l_v_usUoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 3PW1l1knS__ufONfDTSPVliIq9rg3xw5
X-Proofpoint-ORIG-GUID: 3PW1l1knS__ufONfDTSPVliIq9rg3xw5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX/sf1Slfdn0wU
 ns86IWbg4WDZyE4TJHhO1UzA47QBj0OUmIaIKXksZ2JsLlQ6OSSO8Cn9izaUUXbWJg9rgdR0W0J
 K+dut1HqqM//bMDuD7UkiItmKFDehEc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_034602_599745_4291E9AC 
X-CRM114-Status: GOOD (  14.22  )
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

Commit f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware
crash recovery") added an unconditional ath11k_hif_irq_disable()/
ath11k_hif_ce_irq_disable() pair inside
ath11k_core_reconfigure_on_crash(), guarded by "if (!ab->is_reset)", to
stop the DP NAPI from touching rings that have just been torn down. That
fixes AHB device recovery, but breaks PCI device suspend/resume. During
suspend, IRQs are disabled once in ath11k_core_suspend_late(). Then during
resume, ath11k_core_reconfigure_on_crash() sees ab->is_reset clear and
disables them a second time. Those IRQs are enabled only once during
the following reinitialization, leaving the IRQ lines masked. As a result,
HTC control responses never arrive, and resume fails:

  failed to receive control response completion, polling..
  failed to connect to HTT: -110
  failed to reconfigure driver on crash recovery
  failed to resume core: -110

Fix this by disabling the IRQs unconditionally at the top of
ath11k_core_reconfigure_on_crash(), and instead drop the disable
calls from the two places that already disable IRQs before this
function can run: ath11k_core_suspend_late() and ath11k_core_reset().
This keeps a single disable per recovery/suspend cycle regardless of
which path (recovery or suspend) triggers it, so the refcount on
PCI parts stays balanced while AHB parts keep getting the disable
that the original commit needed.

Fixes: f7a74e131d3f ("wifi: ath11k: disable interrupts during firmware crash recovery")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/linux-wireless/a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com/
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Julius Bairaktaris <julius@bairaktaris.de>
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index d2ed6a0ea7e3..1ad0a47653de 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1275,9 +1275,6 @@ int ath11k_core_suspend_late(struct ath11k_base *ab)
 	if (ab->actual_pm_policy == ATH11K_PM_WOW)
 		return 0;
 
-	ath11k_hif_irq_disable(ab);
-	ath11k_hif_ce_irq_disable(ab);
-
 	ath11k_hif_power_down(ab, true);
 
 	return 0;
@@ -2333,17 +2330,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	int ret;
 
 	mutex_lock(&ab->core_lock);
+	ath11k_hif_irq_disable(ab);
+	ath11k_hif_ce_irq_disable(ab);
 	ath11k_thermal_unregister(ab);
-
-	/*
-	 * ath11k_core_reset() already disabled the interrupts on the reset
-	 * path; only the firmware crash path reaches here with them live.
-	 */
-	if (!ab->is_reset) {
-		ath11k_hif_irq_disable(ab);
-		ath11k_hif_ce_irq_disable(ab);
-	}
-
 	ath11k_dp_pdev_free(ab);
 	ath11k_cfr_deinit(ab);
 	ath11k_spectral_deinit(ab);
@@ -2605,9 +2594,6 @@ static void ath11k_core_reset(struct work_struct *work)
 	time_left = wait_for_completion_timeout(&ab->recovery_start,
 						ATH11K_RECOVER_START_TIMEOUT_HZ);
 
-	ath11k_hif_irq_disable(ab);
-	ath11k_hif_ce_irq_disable(ab);
-
 	ath11k_hif_power_down(ab, false);
 	ath11k_hif_power_up(ab);
 

---
base-commit: 03dee8921448c661b06116d14967a57fbecaee6d
change-id: 20260921-ath11k-unbalanced-irq-enable-disable-4beab9a3300f

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


