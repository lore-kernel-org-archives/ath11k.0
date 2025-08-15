Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E667ACA0EE6
	for <ath11k@archiver.kernel.org>; Fri, 15 Aug 2025 01:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlsOJK5oVN3gW0ovDjkscdY5GxIZWuWXxKFxu34qXhg=; b=gbQ4bGRzOFdBKBFQxmEuZQ033e
	/4Hlx5FVasMpoDywIFh2ZxN+KKqQBHdiVgWLo/3Eq5tvRCzsuHHuzg8HUEI1lzO4mRoDLcil4tWoK
	wjUARisRsij7V/gDBdOG3JXOpMq6gKcSOnhpoCkQGYQuN0K3EqyT1+MellWvbO2EErj5dlhSteu0J
	7z83d/o6Wg0png0LHGx0KhhGfoVDg4CtJjVFCg8jLptqXt0GltKZeMFzbdQgOtmB9EHM/m6RCZ6Na
	2BrjanBqnI4+1Bd7Tsv6slHsls6dZ0kM4yw4RzIK5VJDOpBCmcoJP7kGF5FqDZL+oEoM3ggmO3lbV
	2tPL6Rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVY-000000013Xk-2eSI;
	Fri, 15 Aug 2025 01:45:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVW-000000013Us-17ju
	for ath11k@lists.infradead.org;
	Fri, 15 Aug 2025 01:45:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EIhxML025691
	for <ath11k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlsOJK5oVN3gW0ovDjkscdY5GxIZWuWXxKFxu34qXhg=; b=fd03oLg3y6Izcc+W
	BLyxaO7osrOdVreAQhjHOBb6GhsBuVA4cWyhIk5ocH0aY9b38jRJlIFJkxTuJG6P
	Ee2MKkKfvg2GA0t4Iqkl9/vqJ2K5YvwAOoBzs8WQl7Gl4+i6VPrljH8BXk12iEL5
	xdjBO/ymfts83GSNuHuPILo2TRkSfAzq5+/2s4QjJmxNZ+vIe4qkVhkkgxIE13IA
	KXdh4WxKoHoijmCOME0VmuVRQBhCB2789HTEXBxFZR3X5p8jzSLxJwDlLjXHt5M+
	DSO78aXZBxlYv2pUyuek9y38NV0C2iPJsaKAuOBY4LFbT3QobQruNIJWf8EF+JhL
	bMK+KA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3ghjx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47173ae6easo2085359a12.1
        for <ath11k@lists.infradead.org>; Thu, 14 Aug 2025 18:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755222325; x=1755827125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlsOJK5oVN3gW0ovDjkscdY5GxIZWuWXxKFxu34qXhg=;
        b=i9mDUUSIVTJzelkhGM2aXDYrkAefvQ6ujRk2Nq8XKUZmWVDbZABRuaTlHFb5YcZ58Z
         4RWLnZ9u8SOHKP2d6gzmn8ONxlh6o2cS9yIljpnl0A9qnGpaVejtxe+l+Dspt3c9niPr
         1R4EQSsIY4YOP+fka4zWOvR8i7bnyyYhnk1jKez/EaYZLpmUBtkWJyGKLabpxnCo17Sg
         76IySxiWDHR8YDemlxx8LLO4KsLIjF7XL+cMqBCzSFl4UChE6O3KmqXSNdTuEvj+tL+N
         YkHuSje23UxV/z0qobaWl5Hqqp8H2Z7TcHF9vxyu0gboMG0jCeRA4HjBe5Wu6L4ZqaZq
         UM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7GE19tWLvnZF9sgFfV44v8VymCyUS6dPa6ox1JfH7oTJy/KWAu8lwuzjVWE9WapAXW+T+BlE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4XSVTDhNsQcxf2Mxe2K20sZtvkbCMrLZkbM4ySJ5Pedl8IGE3
	4RoVpyPvgblPLDJqE1Tbrmrhi9TtP6+cjTxoZJkmaP4nlo9naLxbBhcUpNNoA8Z5Fo8kn6KXwO3
	8JHwxLNMoJ6xuUIi39G/x25g6AfqQ41eN0CxY3YnDHtgFmyvuBy9lbbjfkW+T9lyx
X-Gm-Gg: ASbGncvTb134YGL6jMCHgNvCtczB+LtApymgKYLe4hKirOCTYjLCgfnTot6Fsj6WDx/
	MXblrHpTigCI+g9DqoXfjdpqXQstOul5fJ7EaLJLkIm/WTOHslyNkWVesS6uQVObh1qTEuCm0Tp
	xw7TZu+X8d22L8Z4OFVLrWLGfgPUxKNqycxlDvKxehTLhVUBVECe7eUzbhET29iO+pE6mWys6H1
	Ir1FLGW87IT4Dp5fBmMByDDDNmtptRe/NGVHDQ/rMTRPbxpbcuPF5pChNcW7Y8AItl9yLSg8HyG
	A3mZvocKUslNbPWLkHaa4St4vvcGujUpMKrQrJwe4Zvh7hPwiZbjtO7hcGKGqtvjP5CaPf9vyZb
	db8HODgip/rwGVZMy
X-Received: by 2002:a05:6a20:430d:b0:238:351a:6437 with SMTP id adf61e73a8af0-240d2f3f71bmr628323637.43.1755222324984;
        Thu, 14 Aug 2025 18:45:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcAx/TsRQqAm4kbPDgVI2KzEGpjPVvzLo1WQbeY5Z9fq04iIy5aj3QYJ7X0o5DKPHyKP5YAQ==
X-Received: by 2002:a05:6a20:430d:b0:238:351a:6437 with SMTP id adf61e73a8af0-240d2f3f71bmr628291637.43.1755222324516;
        Thu, 14 Aug 2025 18:45:24 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7735f4sm20273a12.48.2025.08.14.18.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:45:24 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 09:44:58 +0800
Subject: [PATCH ath-next 3/3] wifi: ath12k: downgrade log level for CE
 buffer enqueue failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-3-f955ddc3ba7a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689e9135 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=4avV6w9vhD41MOPHW_EA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX6ZA5UQA01wpf
 Y0/jdaz89iLf1aH4u0FP59pYGY/li/w4M8/rn7+1Bq30LzPPCw1YZ6IK8Cua++8RBn2CqS9JXC9
 86rj4ThFwcaDctHN5C2ubaW2uUy9Bz4NJ+NlVAAWykpVLnFwsLxP6LX37RX89+NXAofvYm2XhC/
 +R+mQoKmjhee/58pTQyGvHPHJ4oy8wy/ivXYYK1jFVAjG0JfKTZ8FGN0iBNoUOdKx2yPx1qKQeX
 zVlekONSU/TouyapkkXZd8FnBJH2kNKu6pntdtcqnWqUjjJjPVhAV24C7E0oCLCebdU8XsVipJ4
 Vy3mEbBusv7gY2paZ87M7G3Nk+vlMttJI7g5cBut4vi1fUz0AvMSL8N6CEu96aO4U/35oJEjSsk
 t9DmQlw1
X-Proofpoint-GUID: 5m7whht7xnwLcHSDZoUw0GijC5G42DJO
X-Proofpoint-ORIG-GUID: 5m7whht7xnwLcHSDZoUw0GijC5G42DJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_184526_312881_5AACBBEC 
X-CRM114-Status: GOOD (  12.81  )
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
and a warning is logged.

However even enqueue fails this time, rx_buf_needed still records the
numbers of needed buffers. Later when TP gets updated correctly, the
missing buffer will be eventually replenished. And there is no doubt on
the late update, it always comes (or lots of such warnings should be seen).

Since this won't cause any functional issue, downgrade logging level to
avoid misleading.

Compile tested only.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index c5aadbc6367ce0d18080bb0e15a88d3ddf2e34ff..9a63608838ace31587691dd53c1d4aa8f081cb6f 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -392,7 +392,8 @@ static int ath12k_ce_rx_post_pipe(struct ath12k_ce_pipe *pipe)
 
 		ret = ath12k_ce_rx_buf_enqueue_pipe(pipe, skb, paddr);
 		if (ret) {
-			ath12k_warn(ab, "failed to enqueue rx buf: %d\n", ret);
+			ath12k_dbg(ab, ATH12K_DBG_CE, "failed to enqueue rx buf: %d\n",
+				   ret);
 			dma_unmap_single(ab->dev, paddr,
 					 skb->len + skb_tailroom(skb),
 					 DMA_FROM_DEVICE);

-- 
2.25.1


