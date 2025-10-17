Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFD5CCD19E
	for <ath11k@archiver.kernel.org>; Fri, 17 Oct 2025 04:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vOd1s0xzTmHuz/VFeRFh8thGs7i2iDojrILESN1HW4=; b=BDd7WfJBdrCYdANx9KciqZa6TZ
	+UgdCi+VvPFL/yoH6UAla8RPQsi8wo+lJeP3gzaQS/YxSLOxFOGoxYhix6LU8y+I3XAWULoq5AcE/
	ukT+PdcXdUnOKrXfTsPlnNjDln45AAR29g3x2fdkmtcP0KIyBY0oItWhumDwSFSwB1WyjSK7sgfVF
	2U+g5U6b2dRtuztnFiZH6Y2w8xDSI6w/CTQpgmHaw4IZylEe0VTAF73IduIoAsmyctCrTEHlwAtgU
	FHzZnakW3YvO8lAPhuuoRrzCW1m0zzICIOgOQ/eneq9Zb8M644pUP9RBhFv3P5NraLtg4azdDfgk6
	4xm8TvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blO-00000006Uy8-0kUj;
	Fri, 17 Oct 2025 04:08:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9blL-00000006UwN-2mXU
	for ath11k@lists.infradead.org;
	Fri, 17 Oct 2025 04:08:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLR8q016181
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vOd1s0xzTmHuz/VFeRFh8thGs7i2iDojrILESN1HW4=; b=PNZ7fYCZUyFWvIxC
	G+9AwbYhG9fNjJFSTCkmYOyOxxWjniebFiC+APR6v3mtRJa3UddeKu5ufax3Kv/j
	ycuAOgOm53445tUY84FH+pSVMsWSMYgXiN36MhOzcuUgxUexII19ya4eAhKJF1WU
	0yBoW8PvYCo/ZM8FKs8hAHhqfw3mWEDn1xxRTIHdRDrcQis2j9gm/QqGKloUyrWx
	n9M4otOxgTXoUh+fDQg1ueTe406MevikMw8a4Lokg7C2tIQf5U7lvQy9Sggz7cYo
	GJC4dTsJFJdCWzBug62BuCG5xHsMUpIs4CReULPbqk/7KsHow8+f2r1t5cxzTXjj
	iwJ1RA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5tx55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 04:08:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269880a7bd9so19284735ad.3
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 21:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760674097; x=1761278897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vOd1s0xzTmHuz/VFeRFh8thGs7i2iDojrILESN1HW4=;
        b=b4E8Ie1WZrL7xcS0m5OsCTnL07JeSTETTkQ3vMYv/1qlQYoZv9TcERTRqp3hij+75V
         QwNyCTzKbq6IBCV6SFObN/Fjbuuth0PB14mgY5MmXVJutHSgJcc7gL2mOLhEL3HdglOD
         BBI/EsPCr/auYMrhylkQO6ehWXUYnCqWuTxkRyGgYZy/cPsc4GFT0N8O7PNpPoJO7kuv
         z0Hfr4Lwe2o82vLD4G6ylxf6saoOAL6WievnfeV0l77cqGGtWXA8SyaiT0ZOSjUMozn0
         7Oon04OsRQqnCqjZdK42ILoojhBg9IZzzIToqI0Q4k2BOML1NcG97IHskFMWWq9gl+z3
         VwIw==
X-Forwarded-Encrypted: i=1; AJvYcCXdjxMjOo0S6QBd8D2IbkvcFeotgTDNx5KgL7cJxO5KlrpCHfy67pAAvFcsyo6wdE6H73thNo8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHH6MAq05C9+/BomKgb2Vjhj5h4NpJls7ObO5hUOZeTuxfy+Ez
	hXneocvPkE7B9d2oLbQxKkYTPay22rOhMt0U5UeyQx3RWTTP2b0M6uFIWD7jbLZ7/EFe3Wm98ur
	3UR1uGtY/ilZZMDSo6SDPnGoND69xtiiD31qSeFZ/lKedZ3cld7QFLpkhS9b84o30
X-Gm-Gg: ASbGnctY79ImWPS33ihm/uzLAw1WanDWB0873zrGt708IoaVZwwze8FO0gTVOF4YltC
	N9ddr7Jb25WVkXWN0GC4qlnhAvk3J/Iw8ODSpwpqbt9XEROmEt3rS4+PWr3iBOx5brnlBEJWnw+
	2sD/RzfsdB+0SuxrxJcwt73LRHFN974iML9fGSAGBG6knMIXtSI32pX1NfNTh3aizZV3LbYfiXz
	9rkJ2SYGcVbtIewz0uUhzwXCrRi1miMSuGm125vSpst5PrO+LXSf6WPE9wPOUbd67Bheorq5fAP
	Qn4dcmQrsepNz0byBbGJXagkGnJpiXvvrwslO4x7GZxQoNaoeR/VW6O5DahXdst32zsD7Yn3rui
	86j4VhWG0lez/B7/D/t4f6v2YpuMvB7mitk7Qouu7SUu6Jt2/HcQTq1WeAPxhJAgmf/P0uBi2A3
	Q8QnK7Xu3egs2nmma5ZoxKKXM=
X-Received: by 2002:a17:903:244f:b0:261:e1c0:1c44 with SMTP id d9443c01a7336-290cc2f83a5mr28436105ad.40.1760674097423;
        Thu, 16 Oct 2025 21:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiN7L2yUjdFr/LpdDmY+/QiQ3okGiPKE7r38tveBTIAwYhGCdTLa2YZJcf7W5up77l+rmgIQ==
X-Received: by 2002:a17:903:244f:b0:261:e1c0:1c44 with SMTP id d9443c01a7336-290cc2f83a5mr28435885ad.40.1760674096991;
        Thu, 16 Oct 2025 21:08:16 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7afcbsm47635345ad.76.2025.10.16.21.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:08:16 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 09:38:00 +0530
Subject: [PATCH ath-next 4/4] wifi: ath11k: advertise
 NL80211_FEATURE_TX_POWER_INSERTION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-add_tx_power_insertion_support-v1-4-f08feacfca93@oss.qualcomm.com>
References: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
In-Reply-To: <20251017-add_tx_power_insertion_support-v1-0-f08feacfca93@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: OKRItoxSl8KwmNvixhmUjGH208Hz0cg7
X-Proofpoint-ORIG-GUID: OKRItoxSl8KwmNvixhmUjGH208Hz0cg7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXzBY51MOwusGU
 POjiL5X3xY1EXvvAvx0Y+52rQ8CzJ/6Y4UF5cj9/H30TqfCRl+PFYgu3YV1WTF7wRTCoU3/ksUk
 YfWwcepChUBby035qOM0JETEM+/ZSAACNRgnPOQFT4RRlR4OQwwWNiZrJknDsFTzX55oETYyZW6
 bbWLrILen2K547CNrkubKfqnACaJ2pkPfvd+VScO0VwzlYh8xZNaCIPrzRqNVNYi7tNnJxlBT36
 /aahiF7qmvTwPmvq3D+sNYnmeIJrEDdwpv4hJzkYOOwUD5zSy8XnNv0TNIXaKSjZagSr7GY3VAg
 qUNtPuX4w6gzUQIjlS4MctJKN9lRE/V8nimTa16kBrR59Ab+iXHv/iXkhtL4DAi1BCTFUXfqscA
 jrqOtzG7MtuOppWHQzzIWA060EvsWA==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f1c132 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Q_Yd3DzVMxYqS39AGnIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_210819_824225_EAE2512B 
X-CRM114-Status: GOOD (  10.73  )
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

Now that driver is capable of inserting Tx power, advertise the support
for the same to upper layers.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 773ea1d4b358..23b02e505099 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10543,6 +10543,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE |
 				   NL80211_FEATURE_AP_SCAN;
 
+	ar->hw->wiphy->features |= NL80211_FEATURE_TX_POWER_INSERTION;
+
 	ar->max_num_stations = TARGET_NUM_STATIONS(ab);
 	ar->max_num_peers = TARGET_NUM_PEERS_PDEV(ab);
 

-- 
2.34.1


