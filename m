Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15D4C53200
	for <ath11k@archiver.kernel.org>; Fri, 24 Jul 2026 15:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z2ZfzNUzZr0/QvK+IxoV2ajRXSGo7XNid0+pePDQW7g=; b=k20sv8zvaLt071
	xSaK6XDhnqZaYwlAXP3M3f152j0LvK7tvTLrAMiIiKwOwnmWJ5USeoDCyN6DdHfqiRuea9vuyGGfs
	yfyAzUoAI5ZnvRXoUoQSK/UWp6pRHSj4W0og7SMG1MlcETlK+wIKxqz74djOQ5BR0zGEBabkW5a39
	OKdWJgSF9WGxMtW3fNfx2q88kPZPKK13rIn/7KIbqbSTIbmtwkSL6qHVgnmak1gpb632oEg0HWtht
	b8TbPFc/9IIlkZq+eAUjaX3Vo5k4J7PWFEyf22FwjraVELToXUmYaDMlzcbkBAoXOf+tirHsLfTTn
	oqpKyU+iE1CBW7+D43LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIG7-0000000GleV-0pHB;
	Fri, 24 Jul 2026 15:56:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIG1-0000000Gld9-3ZDP
	for ath11k@lists.infradead.org;
	Fri, 24 Jul 2026 15:56:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbAdb2933471
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z2ZfzNUzZr0/QvK+IxoV2a
	jRXSGo7XNid0+pePDQW7g=; b=E+nh548w1aa9Yx6fOwBRX5CpC9nSStfE/ghM5V
	xjj+lnE0lzvozhgacQIP0PlxpcKxMCeVEw1ZAxYtscpcKWjTs6kd1EGm182DeQvV
	/osCHVW4fD4/jck7Er2mZEbeYGO7ZIATG/YCssnoypHmzSe+EIkzVzbshloNKnN7
	28h0fvjHQ7T7idNvtcN140AUU14ymWfngZ43NqpHqjGNsIOW/uawUi6uwc1C9aDp
	8rXiJSBUNqYA/gDa/MeHJiHQE7SdPJuLyxUg0XW8bLknDc+516VrZCc4GpGsML+j
	H0XwhhgmeW0zofx2dy/QgIf7+I97w1WqvRVyeVnT1B2rRAUQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj8ny1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:17 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb6a8c61deso328189a34.3
        for <ath11k@lists.infradead.org>; Fri, 24 Jul 2026 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784908576; x=1785513376; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z2ZfzNUzZr0/QvK+IxoV2ajRXSGo7XNid0+pePDQW7g=;
        b=cMh2WrwNTk58H9FPu62otdIQuZSx/YqqepG+UMjY/QtYAki++PL0bpP95SJSicG2nu
         QmvhHuod6HTLKsIQMtUzGekkhM3e3DpJEH2HdyAXPmVgcDMuZFvx2pjWLCnvyDBZxHhM
         JLZ0FYfcg0oXZ81FZNdANm0dzjeOzJBNU9WQGHc6ZEn6aXokm242Em/ntAGwIyD7sjT4
         OMyroDi380lWZcPJi3pSx0va+nXEAEO07U/2pSoQbreMb2x3LsWZxRT2fRgSayEg2sQk
         DS0Snh9Xcc82KmNKJLENizfNQ5q9aaNy2gWvdbCcinJLc7GUUh3PfH4ZAO04AF8pCijq
         qVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908576; x=1785513376;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z2ZfzNUzZr0/QvK+IxoV2ajRXSGo7XNid0+pePDQW7g=;
        b=rHDGHUcEXfoG2JgM5d++kpY9qaWT3/mSxcIw+BaFG3tqHodXMQMLZy9giP5VTApj1E
         W++w3R6A2NBFMDIfA/PhtVbWWFGKJb3IkEzubCfLOnkEHigL9Nozyyo5F3cchobrd4Rw
         RpY//xYt8xDYKMa1ELdYzcxod4j5HFkjhmGdvtyiHb4SPehiq+72VVpi2Aq2/b1veNzJ
         uLWElwv7wLaHL4Jahzxe6yWncKRah6498sWn2JJb6t+lkhEjx2s4dQlyaLNrFEO/TSPe
         2Q7ZmrcegyJMeqCwq7SKOoNGfe8pP5xneDbDZNSCNVbwq46z9IfuC5b+SVu39mYYKC7d
         1Yqw==
X-Forwarded-Encrypted: i=1; AHgh+RrVm+VL2dzfvQ6OZoTpXItZtA7BRR5rG6jTXDodOaAWR3jVYZ/qzup/cHgCg2GcvzBmnn5oVlg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxiijs70IEXtPJFePM9lgWRBKrkOBU8g7FAKtE+9uQUvLqAW94d
	VcoS3hFCE2jEQrOR8zxLlgIvEEK+BcauBalZdulKkB2YoBRUfS2h0ASW8ijpQ2OfEdUdBvHZXil
	nyNIiEiOaANx5s2Y/fFUi5AMZZfeQ6R6lCjXGdxBUbSKSWNH9BdQJptcuP7aBxyig
X-Gm-Gg: AR+sD137d99myk8MoIb5UzEmWBiwU1rq+1/sbeiy0TOqfh4JgYDcuLJ3CcUNktriVm7
	aahAag51QniBxOzw+oTfRGU1tgwBt5nOuB+0QAiWdOdhLYUWpvEQ/ZlJiw3Z11PS5KOlv6up23Z
	k7/h2m5KrWnbqkf+ekEFd5QHawCkeQnkEqn48sK5rl6aLKhmUb/6Jqy+4gXw14IiBGwPZKplT6N
	ftZq/SAco/+La07eAYAt/PaRzwwCx3Mobar49D/fAdPh0YiaOi849hlBa3wKVBlO3qGTqM1106F
	ZDVBh9wNP4rfQLOkAb9ftC60zCpqixzoO1/YWBPenaJkBnw5cSCGR1gKqVEB4nQYryOw7I0+C4T
	2YjVsYnGGX0z9+t7TI+waiayIvXTwP9yRRTm8nxjc8NdCLxIfeMepTiY=
X-Received: by 2002:a05:6820:1f10:b0:6a3:8738:4106 with SMTP id 006d021491bc7-6aad3fc8f81mr4302778eaf.26.1784908576484;
        Fri, 24 Jul 2026 08:56:16 -0700 (PDT)
X-Received: by 2002:a05:6820:1f10:b0:6a3:8738:4106 with SMTP id 006d021491bc7-6aad3fc8f81mr4302750eaf.26.1784908576002;
        Fri, 24 Jul 2026 08:56:16 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm134591eaf.7.2026.07.24.08.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:56:15 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath: Fix buffer overreads in CSA
 switch count event processing
Date: Fri, 24 Jul 2026 08:56:12 -0700
Message-Id: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAByLY2oC/6WPwW7DIBBEfyXiXCLALbg59T+iCOFlXaPG4LLYS
 RX530vcY3tqLiONRpo3c2OEOSCxw+7GMi6BQorVqKcdg8HFd+TBV8+UUFoYqbkrg1Qf9jIGO+U
 ESGSBnKVLKDBYSHMsFheMhcMZXZwnbvpOvsrOeOMbVnunjH24bswjq3U84rWwU02GQCXlr23MI
 rf8Ae4iueBeixaEca027i0R7T9nd4Y0jvsq9zU/ANX8FwBCYi9FB9o1vwH3V4t6+ImqoO7Z+bb
 HF1TY/gFa1/UbMHwiKM0BAAA=
X-Change-ID: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a638b21 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jy0UIgyy91Gj8lWLAW8A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfXxhprsOVGN+L/
 oX2BcEuR/IPmBM3TnWvK3LsntHHJYRUWAwfUSMNTT53dt1bkYPVaChaIHIWNkSd5LvBweL+unDX
 LTGM3y/L83FTfndCyqmN9s0GGQiD2ytLHYHco7ydWA+wRtOE71kZi76B7ht/gufouAXRA6oFwUK
 /STL9IfbQYY7FRqYCcsb9vN3VI87dKU5cv6RZgX6xwcmKqkHejSP394kiDQwhK6CIPkQf+Pfklj
 ZAKeZsNg7LmE208wcS2zOcbXlU0RlCCW0xW7/Kwxv0Q28QT96SsT3On3GRYwb+stq6ZOOzB3VbV
 Y9CEBEtI7hNWgOFU3p2b1zEaYef+YZsMS3kS1C4mj5D6Lm1BYUDzAhT8BRgtPlg7wZqAxFBW2/p
 Za5TZd0PaD82IPYttrqkkJ7rOX36Vzn6m42bGj8L6D6JUrrvC4W8kGBr3f8ZxN6cUnP9AvoVaro
 Uxb1jWQYwf6XOqOmJnQ==
X-Proofpoint-ORIG-GUID: 5NtUEirKGZYTIxQubl4q4QFueCV4DTWG
X-Proofpoint-GUID: 5NtUEirKGZYTIxQubl4q4QFueCV4DTWG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MiBTYWx0ZWRfX08aPTGGhWKEC
 EKpl5A1enxw/IqUq3pDztHoa5HCeUS+Z2O474sznOiEAJPu/gWDWH2xnLY4ePiSiyaIZ2STHwj4
 K29MMGj/XMutCisQNwLSlxiqvzLnQIg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_085620_211800_8BBEED5D 
X-CRM114-Status: UNSURE (   8.47  )
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
Changes in v2:
- Add Fixes: tags to both patches
- Carry forward the Reviewed-by: tags
- Link to v1: https://patch.msgid.link/20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com

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


