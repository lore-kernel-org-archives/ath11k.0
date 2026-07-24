Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE03C531CC
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 01:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Hw0owkOH+6wN9DcwjzLX3Ffn+1YguIY8Zhaj18HcfE=; b=E1irsRgiPsJ2j9
	bR0UNPR3HAIJwGSdPxfY6ACODy3ceFOXdav5ttgekjFH8INAy2M8k58PZmXdjNY3exDqIhoczgfKr
	gEljcJbOAutNOlOHiMTq6ynUWtp1hGOGdgCce6qCUdwg7uWCZ4d5I8eJjRlLSEqYIPXZf/VfdLG2M
	zOXepLDdn0M0bBohTJIxEOxUaipOUyA8IQjRXU4jLowxK1DDvClB00kDhy68z/h+zPg5afCPj/NJ5
	4fwViOcDG/30kiP1j4UQ96KRNuScdfw39+lKfeTs0VB3uV8dII0AzNIIR+IIjLkIURxGQKPTKgPPF
	JiydwiJLBYW+1myFaaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lE-0000000FLAS-1rEh;
	Fri, 24 Jul 2026 01:31:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lA-0000000FL8E-0uGC
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 01:31:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeiU71175109
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1Hw0owkOH+6wN9DcwjzLX3
	Ffn+1YguIY8Zhaj18HcfE=; b=KkNLG8k8HmiBUaenP1Mdnd3dCrp88GZ3RtBpht
	o1JOycBlAema3wXCdGSbjF2OEBERyTwcNFCc5QJDUF+3ikCt1Aw9EM3cl5hxKlSr
	S1kfcI1nsMP0OkJiglJpeoxJQF/AUg8Kv0Bcg1zWm2rNc63QCPIT6dbRwiimZQgR
	8HzfQIGuyFTRIbFA0m4CX4tusdP+GNaJOUvG6BQgVWNAEbaKEv8eUS/pBIeaSXbB
	WqvSp/pDT/oNHXFzyaJApGWG06kQYuOLeODfmBybu+tK+2AYPPwvNcJzt/3cREHv
	9GQ7P+0M7oomLPup5nBHLNLLm5UpQz5OGAo7eCoNStrqR9Bg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahrqhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1204885a12.3
        for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 18:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784856690; x=1785461490; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Hw0owkOH+6wN9DcwjzLX3Ffn+1YguIY8Zhaj18HcfE=;
        b=ASXZVuZtgGqU3YEn2/kl6s90LFMAqDLMHu/pt7Y5UcIXuAaT57xwIdtJNQGTI2gvPo
         oCIyTEcY/c8BtsWlLqAA+3JdOgzFeyv5XrC0HheKLcHerTOiIbymXaIrjszbwwur5LWj
         Nh6s+ayGR8exa3wAooUw+zyllT6rF2EfEx3BGHi2VaYONkCE7P0u5kLBtdWpSh/dsWMq
         AcP77R5pK1QfMGtyCJH+2kolBS44mr0taftaeTCKipzU+u5tCC7lHbuvIS3I3N0eXNZe
         7W7wqZR8JR8PMYY5p1GrjqC7t/C6MnmgAmvYcPXWwYgy9XSv03qxqjRigRM3bKWMdypm
         pZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784856690; x=1785461490;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Hw0owkOH+6wN9DcwjzLX3Ffn+1YguIY8Zhaj18HcfE=;
        b=Yx0PSBscqM5OqZJfj9eJwBH5wyvkegkzcmFnDMKAW/TDgMoBVYjSpxMeP3x3hbEJGw
         3EqhqNof4nHsW6ddfmOYr8rbSK4tubQaNgoNaG+rDnTm+Z+t3QXqYxI+49I1c1RpDQal
         RyjG3ae1yH4/J4dehSo78bjmzxQRYfyKlT9qXSrKy1Umhevtv6rryxEGwP6M7du++5jp
         OXOMza+YWnTBMf9+F9M4G7cW/Qb5d6103wMR2cd9NQYvOBjaEdtVDjLmOgA2b0hmnzjj
         rOXYl7Any33iaYDUan7eSFrLgrMG+N73ENSYt/vkB0VXseazjKfa3SLhO5h2mKJUJ3Ye
         bKnA==
X-Forwarded-Encrypted: i=1; AHgh+RrfroaE6yC/iCd27dP84esZ8aAIix8nUv/ghdmEH3j0Zy6fcLvYVTNPF6fr3hoExVWgRxsBYwE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd3MXqco7klolDeEaAKFXlN5p5DHiP01Z7DOOUuAKnDOQCOln+
	xf2o7pwa3THLF4t2qH4sn1o2fFsuZfWNfchbXakAzyqsYNvhgPrU9Kh9OddyyBOfljJVxN6tE/9
	2bXTeQGc73bmv6QErNrkrbx8/IJKy59b3m8b0aVT75N3nuXj4EQPbkv0ml5l5ZnIr
X-Gm-Gg: AR+sD10CEHNdcI1lTcHUJ+mMN0gXcgmNRFvkjGm49b1egcP1CMru2RgWvRRybHw7jS6
	/Z/i24Ip/rfWpr+iqxR3N23r8pEFPLkaGP4jyYCg53dj222RmLHEqP4jyN0M2RxhuetQ6x2BWaF
	UM+aA4h7dVHkZ1gDc9906v6T38g6/IEohIkn82IJjEtneiWy1PuLEkQoXt79Mt+b2rrGwL+exJM
	LzhmpIT4hlHy/XvsZ5uT2FEh1r+bW+pCV9gzz+WlsX9W5V8KiZVPoudmLZeQXyfN0pMMy+jT1ve
	A+uWMN7V5+ytxQs6Hqs3WbCTMi9Qx/Jqhc4oZL9tF2jeCE3o2GesK4uDghqJ5nwJPVS1b5VysgN
	R7IN3kf8x/FWulWW1COSGFL1qpxlx3YBxVdH/EOwFpYReIxixyOIx2OA=
X-Received: by 2002:a05:6a21:a395:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c44b14e867mr6229644637.48.1784856690015;
        Thu, 23 Jul 2026 18:31:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:a395:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c44b14e867mr6229605637.48.1784856689553;
        Thu, 23 Jul 2026 18:31:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0ba0asm22655306eec.18.2026.07.23.18.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:31:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath: Fix buffer overreads in CSA switch
 count event processing
Date: Thu, 23 Jul 2026 18:31:23 -0700
Message-Id: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvAYmoC/6XOQQ7CIBAF0KsY1mIAtVRX3sMYQmFqiS1UhqLG9
 O6Srt11M8nPT/6bL0GIDpCcN18SITt0wZfAtxtiOu3vQJ0tmQgmKiZ5RXXquHio1+DUGIMBRGV
 QK3y5ZDplwuSTggw+UdOD9tNIZdvwE2+klXZPyu4YoXXvxbySMkc9vBO5laZzmEL8LM9kvvQr3
 Mwpo7ZitWFS15XUl4C4e066N2EYduUsaBarIVGg5qBt3cIRBNR/oHmef4bU9HFsAQAA
X-Change-ID: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAxMSBTYWx0ZWRfX6rPhxQuHMfs9
 jWLH+I7BlEQ9gia1G6r308Ada9+cECU+/888/30pVRNdXdjBm0VoE8AtiSVEZPe2G4fyqrj90eL
 2seJKQK0sjOdUb3YOzbbz5QG4jzI0v0=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a62c072 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=0Wn3t2srTQlYvQ7pRnsA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 87NZPtWZ-VcZKmuASoUEIL3zz9ZD9mKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAxMSBTYWx0ZWRfX4lDqQp6NDIr7
 0kuT3rR0r/OJecNdsmbxqIhRTXlnAS5+MrNi6YMu6e5YiY3v+sPF7QjUnXzCJeu4An90AdS9E9m
 GhwA4aCmsqADdMwQLGd5cJ0n1ibzYUHmxYxqO8vX3RjPI8wteZ6KriiST76ae8cGIoEhs9oQX/+
 EM+dE03Y3TbTc0giAbLt/DHEUD8EIhdeUnfRMyJ0rUGTYE59QyXZsiCnRq3l+6P+Fc03CZLnO7v
 LFtK2b7Dx22DMa+HSmTpFDSy4s66CtD+AAm6epFm/bTEV/wFvEw4+PtzhwRITLikrKvhFLsVIoz
 Gl5ztegZK0VnGrdB9HhTRyEZlnEpNhmTmVsnKXJ/2kPNAwOdBN8ZSTYcNr+Gj+zkVV59K6ntA3K
 EkfDalzFshX2U3+CI6AYdQRgGBgGsr1ntvOgP+vQQC7Wcs+mGsx/wCAqqFo/sYZjCp002AF7XRp
 igid8NoMuqm3+U5yhMA==
X-Proofpoint-ORIG-GUID: 87NZPtWZ-VcZKmuASoUEIL3zz9ZD9mKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_183133_290141_B0FF016F 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

Both ath11k and ath12k fail to properly sanitize the CSA switch count
event.

---
Jeff Johnson (2):
      wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
      wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()

 drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.c | 16 ++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: 0ceb105245b5e57f803bdc0e79dc077fc06ff384
change-id: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3


