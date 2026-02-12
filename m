Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1991BEE3691
	for <ath11k@archiver.kernel.org>; Thu, 12 Feb 2026 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MBgjDmZh+H3sq7sNeAtoBFhewZCG+YCTubP3p9PnOD0=; b=UXj585rFuKDvHLQkwaKnW44m1a
	e+uN8EiZNKbffaIvUGFBjqwYILg583P3pePfGo8/0/HVJqI1HMOeJyAG/wvtsBortAo7lG0/6qmv2
	CThTvJn5Qxs5PPNYdAWC4GdMyJIGzO14vc3LPOOtemzO8jir+s3gPllm4gnpLyTZs+Ng6k5xoUaTv
	WFcfsYwIjxgGGQM8L57pYjsD5LHycI5cO3l/LpEsnaJQMz1oBmsJgMIzUZxx3IvmnaLdoturzwSnB
	2euhYSHYAjvk5ifJlCsbVdRZkrpryy3JW9la84dAP15HUErnjWlx7q+w9nRsnVGrdJXAdgQIEVNtd
	p0A5v7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqY3v-00000002E1M-0aW8;
	Thu, 12 Feb 2026 14:52:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqY3s-00000002E0m-2zjG
	for ath11k@lists.infradead.org;
	Thu, 12 Feb 2026 14:52:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRhF13844142
	for <ath11k@lists.infradead.org>; Thu, 12 Feb 2026 14:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MBgjDmZh+H3sq7sNeAtoBF
	hewZCG+YCTubP3p9PnOD0=; b=FWe1v2JkXX+O1J/mQiEiCcC++BI2v1m5Er32DR
	Qs4y/34uTg+a+w36YRCMaByWWXAZS5XIeJKkzx5NZkEKadf7sEV4Ju5ZUn7l5I3W
	ZPojMR8a6tDFeqJXLkXlG1Z2mdMp9u2uKpYbzDOEh0JbFxDnWSoMluBvZth0iQnR
	kBjBcVOfbKmCiuui1rBUEHjwNixWRXo+5yq4qRfaxV43HgqyT1Ws1WjE62SSnigR
	HJeFhn9xNKWUu1/Mmaff9QvNzIasmInFsoLaFgoKhRgPnPPE29ox4EyCh3G1pbvx
	k8/wqdc4sk8+WoOx1EFiwN8eSwtD3BGHNlnXcikLqr4iJ8fg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpkpdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 12 Feb 2026 14:52:54 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7cfd69f74e2so20506047a34.1
        for <ath11k@lists.infradead.org>; Thu, 12 Feb 2026 06:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770907974; x=1771512774; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MBgjDmZh+H3sq7sNeAtoBFhewZCG+YCTubP3p9PnOD0=;
        b=S93f7gTM1p5horgaT/SAy2G9J4AoABHcFt4qTVSrK1RCcco8BXrTcoe9D0oPLMRWa6
         o4KtOwsBvxTEwnbbwlN+8o4f2Ywgr5gqCCSAr75eCnnhuHO2jlUO5SyXlJJJHKtMzP4S
         7VSW3TSfJBvO1c04X8/6K0EKJtLv4i8qIl1EB+TbUz93wkK5TaFVf3BTVIobH3Oh+Dg7
         16mqLVP0wmabBFV02vAq08cpD+6ialOo9U7+ckShYRBEzRcRNI8V58z0LeaAK856CaUz
         zqWX/SzRR2TlXglNqI2i5trmhi/LidmHREruZTApg/r1fAl5Gz3z4lKLbECQuovqjWET
         2XzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907974; x=1771512774;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBgjDmZh+H3sq7sNeAtoBFhewZCG+YCTubP3p9PnOD0=;
        b=lCBpGJDm+x5OK2fFmcRvx/1BacSqM5/zTr71lyJDesldGg1GoZgLVSo3NRov6V2+qK
         5I/tTlwJMKDPLhhNPycrJozrFbHL7uuvC3Te+aNwp57mt3r8bTLbUobkGWm+GwPbQXbf
         3SIb01OXEfvw+8UFyFteTq07/BelXEnBgsIXG/NoYGpkXP0547Y6SHP8lmctJPwYRcxH
         QaV366TykfIfiI6d7CZBRxXXEvK6U8FjRNHMWm7JexEedAs0Isi2cFhDDclhmDWsNoZj
         xuST78t0Q1TZmZXV4PQdLqtoSe6en+9WZLtxhXj4cTuGSrjLXmBWlz+MLr9Ln3KpD4fP
         sd6A==
X-Forwarded-Encrypted: i=1; AJvYcCXv0hSb5DibDQGlD9e4AV33hjnAnj3rfOQqLCzqfT0uy9wzdhGFXsMEYDGW4rJ5FM1wZ3+WsCM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrN/z0A1nAAZRTGD7SIBGMjiJQx6k0+iomEiA2aNv/ByDk1Wn5
	sGqu5xAG7GN279HmWZMtGc4cnuMx9pUgWPBYXhYr6yIBfIk3GOGPO8UI+owGVXE9Vw0i5czeHON
	FqeeP545kxOEX7Y41FPqv6SBlCBB7bP+zpblUWvRqSghotM79BHnKfdIjlsUuBjKa
X-Gm-Gg: AZuq6aIR0CdykQHx5XA7V/M/GUU6OkIFsz/gszK2UWCcl97gr0z4fvx339JJJF7OfkA
	e/6NwY6FYFHYfhj6i+DaYECxTlenhwBaIEMUCyES69JdqDSlbSSGBvrGcNgvtCb1JegrSnBOSQj
	8KGZ7yFY+9kRLRbRBR4q9qMxqnZYlFZrCwUgqwn/XwmbQbQ1yQzzXa4/PQgsOx/dM+FQs5X0G6z
	WpigarDt5UedkQYDG6vkihbj3EgRYmdH1ca2twFrDVyz+LMlwbvwi9Eyfp+mIV/xWTWAiTsZyn4
	LuA8Gzm5nBJ0dFt33bt54wsuammYpnn349ZIDL8eSzlwi6Po+V5pigbYUaZ3lhBZzA6KTt1u1MP
	xA6BKcLcnvkfSC/h7XeJ48OcUKH3dhpwzHXjn9xmBN/iwITe95OjqU85u9GU1nyz863AJNdag+p
	Te7N13SuHQNaAshakdTd+T
X-Received: by 2002:a05:6820:6ae6:b0:65f:7470:38bd with SMTP id 006d021491bc7-6759b9b5adfmr1154798eaf.58.1770907973918;
        Thu, 12 Feb 2026 06:52:53 -0800 (PST)
X-Received: by 2002:a05:6820:6ae6:b0:65f:7470:38bd with SMTP id 006d021491bc7-6759b9b5adfmr1154790eaf.58.1770907973566;
        Thu, 12 Feb 2026 06:52:53 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm3972026fac.1.2026.02.12.06.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:52:52 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 08:52:52 -0600
Subject: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEPpjWkC/x3MQQqDQAwF0KtI1g2YSIv0KqULzXxrsIySKaUg3
 t2hy7d5OxWEo9C92Snw9eJrrpBLQzYP+QX2VE3a6q1VUR4+s8jCxd/IBt5iHcEJEyJYe9Nrp6O
 ZJKrDFpj8998fz+M4AWwbtQNtAAAA
X-Change-ID: 20260212-ath11k-silence-probe-deferr-28c2532bcc1d
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=YH0qLB//qQ7m/horvPIK27mISPuge4JVMkCyR+WpoSo=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpjelEIncAHdd+PJNineoJBlT0bNSaEOVScRXPC
 pe7AzA9t+uJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaY3pRBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVUOhAAtOzj7Ka31JGpJKXMb23IuzgITB63HmmhUV/df4i
 hHd5XW4OeWU99vZaNY4Tzw1tOBKXeNu4RKwT+HzK9w7gTmlPzBbNzOTXlRHp+rKnk76Lb5lCXdE
 DO9B4zKEaMXa+hzmM17uolcIKM/J6VBW4rt6N0Ti0dwCpaQRPSwH7R0MBafJGA92+Q1km8h6Mk0
 CVk95IwjCJG+Nc+obZcKJsdT5JUl5MgYO7Bqiak2b1apfgi9bQZ+cavyJFi+FKOKW10m96METy8
 dqPghuDQJDQxyRrbuh4wMPXHiRZKNo3lzlZUidhJEilWQdN7yD6jc488YyRN9f7FsyUGRhm0jGL
 CKpODLovGU/x6C7fFHphnNg7GGDVFRpeLEieMuzjZ+aVtnqZqMfnRUIo5o9/k7lZr/gLp+7pW+0
 mm4UzHV7N2nDecMSRvkzzvKJjFFOfCs9K7frrpaEb87v5GXk1brR8j1PFKZEmFpfL6PNE5giAys
 fXb0JWBhx2rTU6o9vvE7JJwrp7X7xoQ7ZOgsj0jBDFq4l4P0fPr8h8pu5ydDNDLHyZ3p17nXYj9
 b1t7rjbTQUT2TSwLU3iR7E4IyorHPPr0swdQyxJ+/czpoNALWdPHNN6V2eeJRnyIcN9xBT4682l
 hpsQHwQ4HOskkay1+kco7PK+uZ99u8AZE76h5RH2HjWY=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698de946 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=12A6hGN33XcstJ_aBzoA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: kF9xmhHasBiyaoARPpR06TLdrqu9_Rli
X-Proofpoint-ORIG-GUID: kF9xmhHasBiyaoARPpR06TLdrqu9_Rli
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExMyBTYWx0ZWRfX8boz+2Cq/V9/
 3YGjlDUg3EJmxjEln0C/XcJpB4bkPB7JKl6TwgMkvHBDvl00CsAYwkG0uFK35cH2JWznHkLYD7u
 yQ76Ztdj268OtGwvZVBVZL8XS1/YODfWl2PLyxFpoP+OGVF224TOkUxd00S7cmal+G8QBnjwuTD
 0U7xx0RBONOfmSrXcvNOM04KIKc9Jui6P3QLjJBd6DRoDMN7ox4La5fHBbSZCm555JuNnZBYbEk
 Dhcmd7E18Gy96EKaROVfottkPLT010FnYVIIvnTexiY9lnrVkdxkYV0sqBUc++BLx1X5O8mPkl5
 iSPXAT/DQys8lax8ars6VmBhzV0kSgJ8VyhfXV7vbxS7isINRDyYoutOWWlOLETni9C4indb6bP
 6ae6r0JYSoWO4HHYcxBheGBb4n2x8K6T+2G6fxBUeNJq6M0kBzpqgo4sq4RxVWbA0KZAbnyWiwF
 PdF5RxOBuv+srmHA7LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_065256_888186_08EF6AC0 
X-CRM114-Status: GOOD (  13.41  )
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

Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
ath11k_err() is used to tell the user about the (presumably) temporary
failure.

Reduce the log spam by removing the duplicate print and switching to
dev_err_probe(), in line with how ath12k handles this error.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 8dfe9b40c12626649639fc1dd9da0e5e0c2dcaf1..08d3a0c8f105b26b1548c5d6006f6ea162fe58ff 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -807,10 +807,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
 	}
 
 	prproc = rproc_get_by_phandle(rproc_phandle);
-	if (!prproc) {
-		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
-		return -EPROBE_DEFER;
-	}
+	if (!prproc)
+		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER, "failed to get rproc\n");
 	ab_ahb->tgt_rproc = prproc;
 
 	return 0;
@@ -1190,10 +1188,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	ath11k_ahb_init_qmi_ce_config(ab);
 
 	ret = ath11k_core_get_rproc(ab);
-	if (ret) {
-		ath11k_err(ab, "failed to get rproc: %d\n", ret);
+	if (ret)
 		goto err_ce_free;
-	}
 
 	ret = ath11k_core_init(ab);
 	if (ret) {

---
base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
change-id: 20260212-ath11k-silence-probe-deferr-28c2532bcc1d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


