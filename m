Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D91ACCD184
	for <ath11k@archiver.kernel.org>; Fri, 17 Oct 2025 04:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eIh6QDrVuJ/d1GJLBquAFX9AU/PpEXWmpulGYO5uhxw=; b=vwhcKjhJ1rgCJ8
	ZxF27qqQgGSmESy5M0IqK01o1npnoKSOq1MrIuVGJUIdP4IVyDMl1UKiJ6kczt/HU8hcmmNjykojP
	6n4qqwwwDyo1iTHZ+Jym4z342l4krT/mH6BswIz8pnH8MmQPn8mnMdemG7CZEv3/JPFx1rfdK8ZlW
	H1Uh4JFDLxMZ+rHbEHFB8Z+94qAJCIoQfe44f+tgF2KqG639/bW0wplL3R/lCIOVoFANmiSkyg/Fw
	GnKtHTKK07P0WYBbgAxIaSYPpu+T2RYIWLmGlt4QZhTBcpupeioqOLYkQQLU/3cgepah/x/JPeuDi
	pX/HhomlqvdO/I0rlbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blG-00000006Ute-3Vmf;
	Fri, 17 Oct 2025 04:08:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blE-00000006Usd-0Zya
	for ath11k@lists.infradead.org;
	Fri, 17 Oct 2025 04:08:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLTks025396
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eIh6QDrVuJ/d1GJLBquAFX
	9AU/PpEXWmpulGYO5uhxw=; b=fx0eexYeTDSLElR2Q5M6s2tDrfIUJtt05nzPJJ
	xedsYcY5dgiNRoH9TSncQ2vQQlUnB6EopAVry0fnOvect9rqBjhmJ6vdjsK2N8nt
	Eb10uhaGTvKZsVIqYvV30X9f0g3oc4cFgjEPQy7DdKIUMhFM8A2rfPTFLssJpUBk
	I5BKRPhVW4TKeHRGH/DCeWjLEv9DNOIMhZmrZPRUe2XTlgywKIy+U+sFVVJHgUWr
	uYZ49msIxbR46jATSj4ODo8JqKamnJZGCcE1G/buxxM7C4SKSSzOzO/LGpunAx6B
	CdXig5w2uSc9w0PQKvO06xzfoqUJq58ZhqteBRGwEeisqw+w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkjrg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28e538b5f23so17629235ad.3
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 21:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760674089; x=1761278889;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIh6QDrVuJ/d1GJLBquAFX9AU/PpEXWmpulGYO5uhxw=;
        b=Ao4/v9+xuj2ZHZCT9DrhBpCOKYaU0IG4GyHNpb1sQ/OGnRm5LKAWyIdRRsdx/FdhgY
         WSUlRAXauW8s9NvyGINu2BKqAEVtqCecQCh9EkfeECATXaktqfzlUKcWfcL+Lq+CnUT8
         D/tMToxjbLMN+od4Ed6OO69lnQotHaYIRCEKJircT8YvU7SSeUxUn81NHuVuh5LP3zzD
         j5OEFjsrmsMYB2gzvr061eUhKBSnfCTm1coccnZWUcNck5MJRTR1sNHruZzYi1qlwDm6
         2/SrOdJxu6hxb67eZ03sUFBej2zeHbtxnbN3SSa+WvEfpV3ewxhLEv/0Or56c/dVjSIa
         p1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVaBkoyvkrDfIG582BXbcbJZ7M81VqLFVL5JPtge+dHzxWTORSeh3yhNQ9mqln5km2iYegD3qk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuY1iwn6FS1bja80XdoHS+vx9VL/50hXJH+SNtdWAbi2VtDkN9
	qg3raQsncxlA/eVh/agAiMkhm09BxxzHOASIGHSi1vcCfwzmz1e78ITmvyqLwCY5/Cjrj/VbJUv
	lay0579gn3Gb48perG2vmHo/fRVcJZw/XLOy7jLFlnLaodQjYi0lK3YPtEyO1BWcn
X-Gm-Gg: ASbGncuiIIZS/fgEGajkkktnBaAvYeaDZK3Ep5CZnsExUk9Ef1dvS3U12hu+BjWzQc0
	zC8ZS+NVZ+neSS1lCA8HVqGJ6sKr9mA7EsOeYuV26Nxikp0JZ0ZqF5kN8uwQFkhKFAtMdF4Dwxy
	gNaTykxv/UhnKcqO2dw4LPJbwXmNdE/lnwc9QUOMnTB83Nw9oWvtsFuRpVTC19lrj7kP37HsfeY
	iOnuJ4VcCGi/EUkyrft83YEVt7mGKjN7R7o/2lVj3DVbJKUQcjXz7cVnHmY0C1yDETjzbU0t6Qq
	HlMC4Abd8pjUkXqfdzBAucaBNfUDK9prC9+5ZWONJXa5Wy++DVXhGi3c+Q/7dWg1nS0o5Pn3Bgz
	ZcqSwxQhTd9Peqr8iVJtU+qikaXjywXhyerlJownH+on4xgcKrNzWFXZcuuXnQs27ymvW/8ud2E
	ob5TU3u8jOzc5f9aQkWQ9Sv+Q=
X-Received: by 2002:a17:902:e543:b0:267:99bf:6724 with SMTP id d9443c01a7336-290caf830f9mr30438625ad.31.1760674088659;
        Thu, 16 Oct 2025 21:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyYc6twQnPndhA3cfepRvywyPP4rwvgYtifdeLoXuii2ItyGwjzdw2RWmU5anA7cCujXlqdQ==
X-Received: by 2002:a17:902:e543:b0:267:99bf:6724 with SMTP id d9443c01a7336-290caf830f9mr30438275ad.31.1760674088123;
        Thu, 16 Oct 2025 21:08:08 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7afcbsm47635345ad.76.2025.10.16.21.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:08:07 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 0/4] wifi: ath11k: add support for Tx Power
 insertion
Date: Fri, 17 Oct 2025 09:37:56 +0530
Message-Id: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzB8WgC/5XNTQrCMBAF4KtI1qYkkwZ/Vt5DpDTJ1Aa0qUmsF
 endHbpyoaibgcfwvvdgCaPHxLaLB4s4+ORDR0EuF8y2dXdE7h1lBgK0FGLNa+eqPFZ9uGGsfEf
 1TJUqXfs+xMxRA2jcQGkaxwjpIzZ+nAf2rM4t73DM7ECf1qcc4n1eHuT8/3VkkFxwraST2FiDD
 nchpeJyrU82nM8FnXlhgBdViq8qkCpMo6BUaoVoPqjqP1WR6oyyCq1AWOs36jRNTyTI2bSJAQA
 A
X-Change-ID: 20251008-add_tx_power_insertion_support-e5225e924bfd
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Mruics8M2NpdW0tIZi4jQYd210ZD8cmW
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f1c129 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Tb0W7XID7D5ug3WCqewA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Mruics8M2NpdW0tIZi4jQYd210ZD8cmW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX3YauqAwIAnuZ
 HtiOQT6W0RULYaglQ4MYQvlBRjfCjyjrU0pPj0Z/r8WoLyAtvzEW/TUi8PXBFQseKSs87p7AAHw
 iC2IKcHqwH7UzCJ81rt6siHN+IV2skBrin37UkUl3BVO3hrBTGVXlu1B8CoG/pl07jOnzyr+DPA
 m68oUAIK+gYOo+YkBceyFqAR3qMTCLcc/+g2XhaxRwZGrBEWOIDIa+m8wzjSdJr6nPj58CaXJvu
 PNT0CAXHWX55VUniWoR1XHr8b3rRVEAwvFYxlSmOuXVIr1WidZqb1V2O5vAlKLV6OBl9NtTBaTw
 RhKh1bSIytUs5u/5AMdrO3xXsfAucAsZJ2Fen6k+ou/Zpe3ejIM7vILvtzumHVDtZcr9n7faqds
 /01lBBScpMV9pmU0ENCOlxNfb5QXUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_210812_299371_59B7473B 
X-CRM114-Status: GOOD (  11.47  )
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

For certain action frames like the TPC Report IE in the spectrum management
TPC Report action frame, and in the Radio Measurement Link Measurement
Report action frame there is a requirement to fill in the current
and max Tx power of the device in the packet.

Add support to populate these fields in the relevant packets. Advertise
this capability from the driver using the feature flag
NL80211_FEATURE_TX_POWER_INSERTION.

In software-encrypted cases such as PMF, skip insertion since the packets
are already encrypted and cannot be modified.

Patch Overview:
Patches 1 and 2 serve as preparatory groundwork.
Patches 3 and 4 implement the core changes described.

For context, this ath11k implementation is adapted from prior ath12k work [1].

Reference:
[1] https://lore.kernel.org/linux-wireless/20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com/

---
Aditya Kumar Singh (4):
      wifi: ath11k: relocate some Tx power related functions in mac.c
      wifi: ath11k: wrap ath11k_mac_op_get_txpower() with lock-aware internal helper
      wifi: ath11k: add support for Tx Power insertion in RRM action frame
      wifi: ath11k: advertise NL80211_FEATURE_TX_POWER_INSERTION

 drivers/net/wireless/ath/ath11k/mac.c | 447 ++++++++++++++++++++++++----------
 1 file changed, 312 insertions(+), 135 deletions(-)
---
base-commit: d5ce93f136fbee2b7afbe221f34ca881036f8de3
change-id: 20251008-add_tx_power_insertion_support-e5225e924bfd


