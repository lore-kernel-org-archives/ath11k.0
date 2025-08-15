Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6967ECA0EE8
	for <ath11k@archiver.kernel.org>; Fri, 15 Aug 2025 01:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2JJpNn1stvDlteeqX4h1Cq06+aEkFey/378SB+Go3s=; b=AP65DaddlJ6whx9cyHWN5laJ76
	EI4GZEV2U8p0nLVQoKeigYzPATBpw3EYGC6Vd9Q/bYZ9aOt8EOjWenS/ebEisI1U90fnwM2eIzodP
	y9TiC55qtnNXE129aYhiH5e+1nOh9KGskAF8vbhk3yOh/OE1ve/JswNPqS7B8hxYn5MRsdbZuRK8g
	10LVV/dbBDSTGdnKaLCH286kLgF8Vbt4p76cEA0eQ6xp5QAkgWc0KlVr1lAyXontex7sQY/+u0ksp
	cJRNJpKdztoEFaXgIF07Fx/dZVSk5xAfAsF5D/bPqsgeK9tLvdOQ2Y3rK8A8i2x7ta2uPBto5xkRy
	YGGI5iNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVV-000000013Uj-2IIE;
	Fri, 15 Aug 2025 01:45:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVR-000000013Si-2OmY
	for ath11k@lists.infradead.org;
	Fri, 15 Aug 2025 01:45:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHW3O3026997
	for <ath11k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f2JJpNn1stvDlteeqX4h1Cq06+aEkFey/378SB+Go3s=; b=M93puMouYWldia7v
	EGGfEOnkU6CZm+O1LhdzImwJn4mzZXeXy4wdHj64ihFoeVzxkLcISt/fmFFnKoUM
	o96Nr1JYaVHXX3glaEpkJ0U3WZnvioThOyLjoyn15F1/XoRFmRasElUdYqLlLm+9
	ZQQaBKsM3lyB9HjQJgNC5EFae/qBbfdXIL24RIMsLNzip97RH94XiZshcquLqxRH
	aiSGoxFRqcp9802s0pNkKHFbpGHuVQDXWAMAhpaj/JfohpCmGDIAqgPHJjzXud0s
	7w0ioKn0iVPZfGi+DKslCpwYvv5bmsnKGgE1CK4fOKqF/sBt/ssj9vPJvqu4FO7i
	7mAEMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjwfkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-323267bcee2so1514705a91.1
        for <ath11k@lists.infradead.org>; Thu, 14 Aug 2025 18:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755222318; x=1755827118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2JJpNn1stvDlteeqX4h1Cq06+aEkFey/378SB+Go3s=;
        b=Cgc1nDOprARfeese1jYi2vRbdZ1QvnvcTwtdgBRpTNc/DlI3tfOQWO7vpgftSN+FW7
         0A2TPeNVSlEimpNXjaK5LzyqfnQCkf0JaLRn4419SEYV+qnMszCNji9y+j1h4y0PVbsF
         ETCl6UBVS4zSQQ6v6kbEQkjeaTfLVS9Xd+aP7EKk59YuIDC4IgC2WNjZVsKBZg/UNq9u
         2jsLPyyUv4gkvDXRlvnyLsN/L5348E9iDnS3bxsDcSy7KE3CY3AZMQvIXwGmZPC3MWw7
         0G21VcBjUbutILhGR+S8le3pBrfp/G9BIiZ/j/g/gtzEopI4Z54SyQQ0CO4aGdZ/jL8Z
         Ik5w==
X-Forwarded-Encrypted: i=1; AJvYcCXIplndcpAz4iS4N07O4mtspes4kkgswEHEBja8yIx2wMJ2U8C2qt3CmX0Bj7AMILnLNJJmRSY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwnK6Jmg5+jLBXe0ex44BT8wo6crOqNwwEFclKAXWZ7no9FFEe
	KpPDA6e9ZlxnS2pWfNx2dUuImVknyZwiNjdRigPfj1H8Z73VRH2d3+zKNHcWwaexkNu/GneMCZh
	ResGFtY68F/nmhqMXC4BTGNYE55ULo/UjrFZ2rWQK8YpVcVe9pNU286lUQqPcNmjt
X-Gm-Gg: ASbGncsfRqpfNxO8xmoLZ2pWzguoUnlhj33V08i1rILC/TQdprjL4C3y4hAKbfndXt3
	BLCJEwxRfRx1TZOSNrW2BD8jK2wnEgYE5mCbFwqkOKd5w66UTZTyVR82HH8KEtUAJ/Nnj02cmP3
	R3NeTmAVeH6vX/guNt+aeWJIg65gz/NFhuwVqAvv7Qqt/zXWSwgdf5kW9TUkI/wBJe9qpENIaJJ
	7Bbl9TtPzLV87KZ5/KmQgN/GOr7OjE0DZoLo2c5ORSgJfekl9md5VA/fBirCOU0gyzcIE8/PxLG
	jwxusqaOEwB5URAn49OdYHQxu/GuVFSK74aKE1+4OyoKFL8MgbScimFa3x6Zp55qJR8OfB99GEL
	zaApFRyd7JcuiyE8f
X-Received: by 2002:a17:90b:180d:b0:321:7a2f:985d with SMTP id 98e67ed59e1d1-3234216190bmr588164a91.25.1755222318019;
        Thu, 14 Aug 2025 18:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTATHglsejKDU1aURWUA2qjKt/Z9C08Zt0r1OWZF/vn9I1mLXPEpEoSQOPZtYki1JSB3Pf3w==
X-Received: by 2002:a17:90b:180d:b0:321:7a2f:985d with SMTP id 98e67ed59e1d1-3234216190bmr588123a91.25.1755222317407;
        Thu, 14 Aug 2025 18:45:17 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7735f4sm20273a12.48.2025.08.14.18.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:45:17 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 09:44:56 +0800
Subject: [PATCH ath-next 1/3] wifi: ath11k: downgrade log level for CE
 buffer enqueue failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-1-f955ddc3ba7a@oss.qualcomm.com>
References: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
In-Reply-To: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfXwpcq7h1dBEr/
 WzDBqoGfZBhQJXlM2WiOdQJ4jlIxqvH7stEka9yk/bx9Lw+/SOKCKEHp/+S0vwFNZtHpjVH+itj
 FwVX7inax0uqxnTTLB/KFNSIVvBLAQmVzifC9nWGmI/CvHeLGlMoZYIwgWbkpLN6VIHSIjQ1TZD
 fxPzNiA1Hc1mdpv2D+SzCX4fZTFznWskUX7SXnTN1Q1YpxvpSYvXz3saVFxTXG/wiHhN418GZzn
 GCMB8YmN6OOeFYgigzr1LXT/N5mP4wtNv/VgGKuYbp1tJjEMmu9rxGhNMAuVMWEyKf7/2sRYo5B
 9livhS49rPmH5FLQjPEGgDCyvpwxoatK39ae3NVKYkM3ywDyF0Jy7Crqqa9oCU+Ehq1M4ipMC2b
 4+9GaKNI
X-Proofpoint-GUID: UF7gEEWAwpMTHSa42IOmHVDIMlK8P8ps
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689e912f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4avV6w9vhD41MOPHW_EA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: UF7gEEWAwpMTHSa42IOmHVDIMlK8P8ps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_184521_720691_10B27DFB 
X-CRM114-Status: GOOD (  13.30  )
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

There are two rings involved in the Copy Engine (CE) receive path
handling, the CE status (STS) ring and the CE destination (DST) ring.
Each time CE hardware needs to send an event (e.g. WMI event) to host,
CE hardware finds a buffer (to which the tail pointer (TP) points) in
DST ring and fills it with payload, then hardware fills meta data in
STS ring and fires interrupt to host. Please note the TP of DST ring is
expected to be advanced by CE hardware before interrupting host. While
handling the interrupt, host finds that DST ring buffers are used hence
increases rx_buf_needed to record the number of buffers to be replenished.
Note before that, host compares TP and head pointer (HP) of DST ring to
see if there is available space. Normally rx_buf_needed simply equals
available space. But sometimes CE hardware doesn't (for whatever reason)
update TP timely, making the comparison fails, then enqueue is cancelled
and a warning is logged:

	ath11k_pci 0000:02:00.0: failed to enqueue rx buf: -28

However even enqueue fails this time, rx_buf_needed still records the
numbers of needed buffers. Later when TP gets updated correctly, the
missing buffer will be eventually replenished. And there is no doubt on
the late update, it always comes (or lots of such warnings should be seen).

Since this won't cause any functional issue, downgrade logging level to
avoid misleading.

Compile tested only.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220269
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ce.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index c65fc9fb539ef10ba44f1c1d5571462b40fa098d..a7a163621b21067ba5a4f96131aafdccfbda3d03 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -354,7 +354,8 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 		ret = ath11k_ce_rx_buf_enqueue_pipe(pipe, skb, paddr);
 
 		if (ret) {
-			ath11k_warn(ab, "failed to enqueue rx buf: %d\n", ret);
+			ath11k_dbg(ab, ATH11K_DBG_CE, "failed to enqueue rx buf: %d\n",
+				   ret);
 			dma_unmap_single(ab->dev, paddr,
 					 skb->len + skb_tailroom(skb),
 					 DMA_FROM_DEVICE);

-- 
2.25.1


