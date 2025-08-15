Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61CDCA0EDC
	for <ath11k@archiver.kernel.org>; Fri, 15 Aug 2025 01:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxYCF6nACau5/iqJnJgpcLYWSFZCwi7it4PbOasdPHM=; b=w5ftPTKcuyrAQDmmSyxHgcwJWY
	fuBunynSmUj7na8SUEzfht3tfu5d3vQoaC6yNYKlZHPDIwRj0h0ddKirOhpxHswZ8E1wvSeNUh1Y3
	WWsImZYpOPd05ZJav5aW1jEmr1jORRE2Q+Yo/njO3x+uvhQ7Y5B2hAHHlzEKkc/pcujrXsCzIBJrA
	OqzWfHDhhwTsB0T5N11e+c6LJJNs/7e0U5PXlDBNgeLj9MR7vvVgmO/JqZbj8VdtLnFFB08wGQjkB
	VkX4U8t7zaAdIFJAJwvAedX28uDTZrurkdhgwTfev8k3oUpU4srhXaR4N7qB3iB05MJQoOsOrB9+c
	kEMUY7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVV-000000013Un-3yEU;
	Fri, 15 Aug 2025 01:45:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVT-000000013Tq-30v9
	for ath11k@lists.infradead.org;
	Fri, 15 Aug 2025 01:45:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHYKBv002778
	for <ath11k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxYCF6nACau5/iqJnJgpcLYWSFZCwi7it4PbOasdPHM=; b=EgSM5PxS9S52676e
	gr39z/Y+zJqcax4+6Mu1IB5gYTTb30zEpnXeH/97wK9CWV9UrxxC2wNIhtVhHUet
	MReBct0n4WQlCksmNam2iwpdckpnjTH7QN2b9AfyhcTfh1tvE19Z5fYLwuC94rzO
	lBaRSxDcpXDwALplPpCYMcxFKojrTwycsK7tq5iCYuOVtpS0mflrBe33M/+UyL13
	TqOkJjiH3XmxJQp5Pz3l/84Ncl8Lq5sefQSgwN1dR0yu4Tg+HBg46Ln9MAQ7IcrV
	hSN4GnUHqfq6DR8gF8eA6MWUyOxACkeI5RH3OiKy1oPwTasHxDkFHLHGwwsC8tQ6
	R7Tiuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv9n67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32326e6b1deso1551384a91.3
        for <ath11k@lists.infradead.org>; Thu, 14 Aug 2025 18:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755222322; x=1755827122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxYCF6nACau5/iqJnJgpcLYWSFZCwi7it4PbOasdPHM=;
        b=Nj37CucEkJOH9nZLWlxLoaL5ni6E77O+Cdmh+/6M1X6vGTb5sAJZqNTOz51+sHsIvk
         qskvu+ZUMFspOtwcWt1AYmclRj837/mbqdaDdr1qlc9SyrxUDuYLRKQ0HPBYhlyYedGQ
         6DMlmMV82vToDwBb5NVS9tIzDguDMMMnpHdPs02BS1f+/szSnlt6z4LYXR4E3YoTQHXh
         JJrWBKyPiCuGJUssqJH04Alav080SkuBvkHnNup8gs+BmXGD30MSlpic+TpGgkaqsdFN
         a0fAFoz0DA5WpOfMZbPwI5Pt3SdLmWSKSQi0nbW0vRtT2E+bDIfhXMpOV0sRBeyQCOcZ
         jLvg==
X-Forwarded-Encrypted: i=1; AJvYcCWOaaQMxGglfHIoYRIXkszK8aY+6WQSAdMe+qqkzzOrXVlvfa5KY9K0AVc4PlVxPMs4i7wadHQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSgMveULDP18w5fhqk2ixj+oPzZTvi1GmBEbf1PCI4/w8WCOif
	9HJ+H72Sz735olODZVsSyA7TsoeN0trYSz+lgWfnEWGrFhQbz+E1wHNAtWG3vMjyyTAECCYwQJ/
	hYhaMLKGirvAf3lK+EKTF/deF/xW2JdwQRjIHSieloUT8pHdIPmtHQO7YLYwzatSH
X-Gm-Gg: ASbGncsHLVuZ8IcxYjrDkui9TYSKmc99g44rLsTFD9DMFREqLDPAvibWvmJXS3dlloU
	vjwTViAAyfaH18Jy11Urnjq1qgMvcMY3fzPbaefA817CPqlSlMQUnZz6+tK7Z0rEvU5tKf17MH8
	JZHSuIJAMiCmkLXUhHERpDNY8YXKUflW7tZYjKXFkwdTr7S37lDHc2/BUKdpykVZb0ZzJAzBtgB
	md39/WmOvEXiYZ/6lG2C2nJyMyAgQ9sGdJP9WavICZhSfLmk6G5aWnIFwyNJLLZwxXAClgeA8NM
	fkX9yNWmgvloL0JHVRWZplMNdbGGYOanxid42X37eyqdMWCHbkdgWPmeNMdgQ/YB1VV+VL3qrFX
	bsqNOUgweGfrcPdx/
X-Received: by 2002:a17:90b:2542:b0:31f:150:e045 with SMTP id 98e67ed59e1d1-3234224bd01mr480280a91.32.1755222321525;
        Thu, 14 Aug 2025 18:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp4WB24m89Yhcn0ioUDH1nUmYAvdRLnZOaTdAnGSAHnM7xxPbWq3Z6LhNQhmBtmQrugKO+wg==
X-Received: by 2002:a17:90b:2542:b0:31f:150:e045 with SMTP id 98e67ed59e1d1-3234224bd01mr480246a91.32.1755222321004;
        Thu, 14 Aug 2025 18:45:21 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7735f4sm20273a12.48.2025.08.14.18.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:45:20 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 09:44:57 +0800
Subject: [PATCH ath-next 2/3] wifi: ath12k: fix wrong logging ID used for
 CE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-2-f955ddc3ba7a@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689e9132 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=fHvqFdtNKkU2r1BsT3EA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: idPDkxAyvkEu_5J2L7tXgdjb1PHVaO-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX3CE5CebWpuCM
 ewBbgTEhMGxQ//0iT5xAiB5wV0T36fMK8GCVsd5ljROWAHKQ916hlhAOoSOmXRaPv2gZRLfc2PH
 4BFWxdCqwW9jd201oanPeZRu7+sgRHctwrJj/gAxOtYXm436phpgvtmy/IIElabuf0jL5iTRzt8
 7lU8NAufRnX50o0iudMoPvmeukNvtANS1Wi1NDdGkhCbzNQeQowj+PsHVDhP7qZDh8WoC+qmH7K
 jWxBfRk3k6G/WzFs27xOgIrj2hl4WRSMpzESO5jsgLl7GvdluOz3OCY+1nG4ydqA0yzb/1YIh7o
 5w3E3wwgFhijm54O7MTHOzMH5yxRVruKitze0PZeRNP8WSmzulM7PAcsReoC0bJU0/TbAPk0D1N
 yvdfloxv
X-Proofpoint-GUID: idPDkxAyvkEu_5J2L7tXgdjb1PHVaO-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_184523_878321_24377952 
X-CRM114-Status: GOOD (  12.94  )
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

ATH12K_DBG_AHB is used for CE logging which is not proper. Add
ATH12K_DBG_CE and replace ATH12K_DBG_AHB with it.

Compile tested only.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c    | 2 +-
 drivers/net/wireless/ath/ath12k/debug.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index f93a419abf65ec6e9b31e22c78c8c2cdd7bdbc76..c5aadbc6367ce0d18080bb0e15a88d3ddf2e34ff 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -478,7 +478,7 @@ static void ath12k_ce_recv_process_cb(struct ath12k_ce_pipe *pipe)
 	}
 
 	while ((skb = __skb_dequeue(&list))) {
-		ath12k_dbg(ab, ATH12K_DBG_AHB, "rx ce pipe %d len %d\n",
+		ath12k_dbg(ab, ATH12K_DBG_CE, "rx ce pipe %d len %d\n",
 			   pipe->pipe_num, skb->len);
 		pipe->recv_cb(ab, skb);
 	}
diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
index 48916e4e1f6014055bbd56d5c71ef9182c78f3b6..bf254e43a68d08f97171d9baffd0ebc3aabfb3e4 100644
--- a/drivers/net/wireless/ath/ath12k/debug.h
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -26,6 +26,7 @@ enum ath12k_debug_mask {
 	ATH12K_DBG_DP_TX	= 0x00002000,
 	ATH12K_DBG_DP_RX	= 0x00004000,
 	ATH12K_DBG_WOW		= 0x00008000,
+	ATH12K_DBG_CE		= 0x00010000,
 	ATH12K_DBG_ANY		= 0xffffffff,
 };
 

-- 
2.25.1


