Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E63CCA471
	for <ath11k@archiver.kernel.org>; Fri,  3 Oct 2025 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eAemtbgiKnGZ8kMpTp3zhWsl1b5CeySwvky0wCZURIk=; b=ewX8eJCy0Zan4Mle6iiFB1blQQ
	lH/ntUtu7wQsoZWxzw6wiKz9WRhbJMxub0Rx1KnEj/+GL+6NSx0hTEUy+4zo6Lh7bhi/jyQb995Eh
	bx290BfOiVOmXn0T6H6NwUT5/YviEuI+beVlGjEl3yc0NLQo6Fafk9eOE3MqJi5aamKL5OQcvC9df
	AhiMcHUBftrmYCXu2sY+Ds/MdGZ+xorNE6DFl/ky696LguBk2tkBffMpSv8yAWbi5UngY9vQtBEZx
	6veI3UI7JQaDNdSL6PvPNoa4t8A0jzHVBO5KHYZxcay7GUtt3jJYsGfnGCJb32yRtnSAwVhYTp7nM
	zUXWEhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4bza-0000000BxS2-0BTK;
	Fri, 03 Oct 2025 09:22:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4bzX-0000000BxRh-1wgy
	for ath11k@lists.infradead.org;
	Fri, 03 Oct 2025 09:22:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592MXvjk025234
	for <ath11k@lists.infradead.org>; Fri, 3 Oct 2025 09:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eAemtbgiKnGZ8kMpTp3zhWsl1b5CeySwvky
	0wCZURIk=; b=ZvfZLa39vF/bJpbWqfXHX53h6ceW5hT9L6NWVt69/CoellsPpKb
	C6Fsq8boezKZ2nzJu0d/nYyf5MHS5Yqh4V7AubziwGPl6HoTyb7TQhWuk51YZNJh
	eW4Kp6nIuePqWXbG7zE4SX21Exfj3WQKR2fDBuvRxtdSrjBhwWT60ENwymZ+2los
	fa5iZNTe8XV8uy+eSwgp3D63iHYepOfj+ZyXdCA7tm4IXFf3AWxI6y+yXnP5UzcS
	csfzgB8+BxXSqD/BCwwVxT82NOQymoUp2LiKnXKYa6wpWZwhFDBvyh6dJ30IT3Ah
	hC8zlCvjT2wcelXlqnyl/+0XEB0Y29TOHEQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e97826at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 03 Oct 2025 09:22:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33826e101ecso3456668a91.1
        for <ath11k@lists.infradead.org>; Fri, 03 Oct 2025 02:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759483336; x=1760088136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAemtbgiKnGZ8kMpTp3zhWsl1b5CeySwvky0wCZURIk=;
        b=Vv2idaLg/UnvOjtO9VTYvBWydzU3KRie/rQhjcEkTtvBA8V2WKLWcf2Xknt0e540Ys
         cU/zQ2As2wUGIeAGCk5aIY3nzk8fFnVzVJewPnx77z4tjkgmUso6hXafQNC+1agyUVEN
         Q83RtoxtHV71twMl8rmgMfqCpaxsCMJ9cBZODfnFw952cUx2DGINnukLui/AAAG0jA9o
         rYJ9uQmcdeept+igI41rGD8niPiQmBolF9SO07Zzc6Ef9CzEysmxJAIeNxI2tTj+MsIP
         DT1RGOsO23Po+mNmKesI7wNy7lMUGxUNrwHM+plEOFobtm53SXzRtWpTeS1LgqwKcTzJ
         IlPQ==
X-Gm-Message-State: AOJu0YxbzdBDot5dbVnK7x+vAp8ZEJiJ8LSrh2REPgSBfHGlcH1NhKvo
	Wfd2MnvGfzxHCZj/bkWqOA6ozA5oqLqxbzOT3k0u6dsvVcM/psn2Li/4kCM6a+5GiC5mEk/oJ7b
	F3jfU89TEZHlb8mP1pn3slUS7sIW0XFU+i4Hkn1qpNs/oe6FvYyiDgmTMt4/W2kXxnBgp7IJN
X-Gm-Gg: ASbGncuiLdYXDk3lTwTq/SElydde9f/vFMk027MiRiX5+nEfFY5XqDohvmX1lKseXw2
	j4Nlb7Ygz/neFvQmIzpmSMWVEpPmvAI7ySGE6UbMKVpIMaWUnobUxp9I/HSGVO5/+jieTJzxv+I
	ZWo6FEZIusjLG+29da0La4q92ThYbcgEJIha9+gt8Cj6VEiptqqz0nvkq+ArI8myF7z7/8w/gqt
	iHdxhOyWz48dpDqUu8YotyPhbf3krPneTyt2VVkJc0CtrC+VgNpJ5wyMqw/NUcP8eUWMO15zj3A
	3B53ZusZGSiHeQLPXos37YfMrS1aML973p87kg0FDSqNGtCeMXpFEYomBKj6eSlbnA4GgEuc6Nl
	IfMXZFER1fdHyrbqpyTf6WW/HnV1OfhOD4zkggeIEcgIBIdn5CVRgwPtsk5YWaoYtGPW/I0334A
	==
X-Received: by 2002:a17:90b:53c8:b0:335:29a7:70c9 with SMTP id 98e67ed59e1d1-339b5103bbemr7557123a91.15.1759483336443;
        Fri, 03 Oct 2025 02:22:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE++fOzCHYyl3Hq3nGoJf/XYgJr8ljpAJ/rqIW893Q954dGzczcWn5dM8qIOHAliUi13gB3Qw==
X-Received: by 2002:a17:90b:53c8:b0:335:29a7:70c9 with SMTP id 98e67ed59e1d1-339b5103bbemr7557095a91.15.1759483335912;
        Fri, 03 Oct 2025 02:22:15 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701bf31sm7443042a91.19.2025.10.03.02.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 02:22:15 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH ath-current] wifi: ath11k: avoid bit operation on key flags
Date: Fri,  3 Oct 2025 14:51:58 +0530
Message-Id: <20251003092158.1080637-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eQqvTXuGSdh0yYwfXuk2pQvyb6Xr5sb7
X-Proofpoint-ORIG-GUID: eQqvTXuGSdh0yYwfXuk2pQvyb6Xr5sb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX5EPoLR6J264c
 ZHsoiqlxZmaprXUGxB+meXfSce8R3YJ5aW9x34mtZA4ecQ0Pp7OJJfO331Puvmi+vHMAeLCdAYq
 mQCt3qYXjWJHhmu7K8r9tfOdLtnfumQ7QYjub1D8EGAV7Wl2cxxOLQ5WtYLq6ty1yPoFlJf/tQC
 Rgj1tJPQWu2lhlxzdKpv8ejPInz0o0FhD38wWslmp+FD5EJJUHFhlMW3AsYNevZKVTTIh2FtKQS
 Ki2zRvSRAaCF994qrCpE5qRiKb8jWQgj57IFjZTFRtIwKIMI7G7tZEeIgwNvWLHDxmjjnAFgtZl
 L4f4IjWEpYMWY35QmjrtAP4bcEcMoAUPDtvP81wIQ4nByBLUC6GOqjK9tWLAhIdwP7Iiah7mU+L
 T/rURBJ+V7sLbqJgXAnDHMiaLg+XYA==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68df95c9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=oTA4yqJY_0P6YRJvVYcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_022219_563139_3510865F 
X-CRM114-Status: GOOD (  12.69  )
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

Bitwise operations with WMI_KEY_PAIRWISE (defined as 0) are ineffective
and misleading. This results in pairwise key validations added in
commit 97acb0259cc9 ("wifi: ath11k: fix group data packet drops
during rekey") to always evaluate false and clear key commands for
pairwise keys are not honored.

Since firmware supports overwriting the new key without explicitly
clearing the previous one, there is no visible impact currently.
However, to restore consistency with the previous behavior and improve
clarity, replace bitwise operations with direct assignments and
comparisons for key flags.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-wireless/aLlaetkalDvWcB7b@stanley.mountain
Fixes: 97acb0259cc9 ("wifi: ath11k: fix group data packet drops during rekey")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 106e2530b64e..b022e1403c0a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4417,9 +4417,9 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE)
-		flags |= WMI_KEY_PAIRWISE;
+		flags = WMI_KEY_PAIRWISE;
 	else
-		flags |= WMI_KEY_GROUP;
+		flags = WMI_KEY_GROUP;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
 		   "%s for peer %pM on vdev %d flags 0x%X, type = %d, num_sta %d\n",
@@ -4456,7 +4456,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
-	if ((flags & WMI_KEY_PAIRWISE) || cmd == SET_KEY || is_ap_with_no_sta) {
+	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
@@ -4470,7 +4470,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			goto exit;
 		}
 
-		if ((flags & WMI_KEY_GROUP) && cmd == SET_KEY && is_ap_with_no_sta)
+		if (flags == WMI_KEY_GROUP && cmd == SET_KEY && is_ap_with_no_sta)
 			arvif->reinstall_group_keys = true;
 	}
 

base-commit: 58a0a7a45feaf4538841afe8e251737bf7c56607
-- 
2.34.1


