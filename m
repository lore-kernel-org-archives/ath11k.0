Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DEBCCD183
	for <ath11k@archiver.kernel.org>; Fri, 17 Oct 2025 01:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qZkYWus1hBgnRXxe7sUTOT1Ci6cLrIVkU47kAR9L4g=; b=iTOtwmXezKw3fg6MQDauNOD+1V
	zhanQcyN4k4Dz1CFx1A7+y6f7S3D5YqvYyR1V/YlwNsfO+Rfd7xIiLMUhHTPxKUQG5k0cGkGUFvBL
	2bx0s7PL45EFDh1JSbSsD6GzgOEffj8pv47H3dosN85pi4Ri47s3blGdN2gWI53zvnN9ARbcQ0YEH
	ZO1sdoUD+Qzm7OWATshWu0KLVv9xe3gnNxDm+GqvEyE63Vg+U4n0PjQPbLaVe6LfA7fR92lt9jVlP
	enUUpuWyL3Ehdsq9xHv3DaEDOrAEP1pfzSq3c+sIshf6yWZhsQ98TJtxAGW88dtS3tCyxe4m7QUle
	45kHy82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Zb7-00000006MR2-1UgA;
	Fri, 17 Oct 2025 01:49:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Zb6-00000006MQT-0P0S
	for ath11k@bombadil.infradead.org;
	Fri, 17 Oct 2025 01:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/qZkYWus1hBgnRXxe7sUTOT1Ci6cLrIVkU47kAR9L4g=; b=HIciw51zA/ZbpN00VegD7E3+Xd
	jzzwdUAbz+uly+MrBRvye+q21HrtuazO/p3+30Km8qAMk7ggRuPWnsPIppxUqWBX2eFKWYbEKWNwq
	mEm5+fr1Z5SiLQNWtsBOphZCTUB3p5IbZ3qd5NaG+75/ms8S1vb9AL8257zLbKgp0LUxr/8cDR7D/
	zfGXs1AHuNg7bR3p5iFC2dMUbw/sUJxzmdNm6/gNsWIhm/NJyVRB7s47x8pXkl4gPHEin1fJSsg0f
	oq5e5CQrI1jtTI69hUL+TN4ttGsVFbYYjelOsu9JBl9MIpFf6vy7Y9GH9Tcskb9zRpl5hQiRJoyWH
	ajfWgqWA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Zay-00000007CMa-0vkv
	for ath11k@lists.infradead.org;
	Fri, 17 Oct 2025 01:49:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLLeL006091
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 01:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qZkYWus1hBgnRXxe7sUTOT1Ci6cLrIVkU47kAR9L4g=; b=pkqAS4wOs/PqN103
	I0matSH2fDRvjsPhRx4ykn7P9Ip3ImKvmmgN85lYumB1Q/yhiFbvn+0WmGQ67uFR
	sbZChYzK+cto9xyj3bpW5z/YQFGCGsdoww+jNAwqw7f9QMr5Wgo3FROm0HktBw7z
	1Bz2QKAAuRxBIw0Kao9N2nGuk00pYyB+26xZhHM4oDfMgAbEkiBm4ipDDJ9JnlT+
	2Z9GKp8g63r0XqlJpk3DBlvDG/dy8Wuk5ePfU5OFDmfGqwvX9nxiJKCOihYbSFOo
	UTxSTo6FVoQghyBGyI/JdS7tbCaNQ4/tjPDD8+u1GacB1v5E4H+m1uJSGGUWOlFw
	aKrx7g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwvrah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 01:49:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33bb4d11f5eso1162741a91.3
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 18:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760665761; x=1761270561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qZkYWus1hBgnRXxe7sUTOT1Ci6cLrIVkU47kAR9L4g=;
        b=jMOmj8bbQxjBD0kzqwDXQVJYM+BGQisISCMl0YCTR8xcK3DvTiiJoeYh7IPehgM0HQ
         WbUYCYLeO3igaxx7z9HtHSm2rKDTgTWNiWUSZY598rycSpcerQjAFaOZjN4cJdL1FDHA
         kEUWPv/j73zAZej43DNdb7+WcdDPB/mAIUnL+VU97hns3jl0/i8efnp/BCwYrZMbbME6
         AgUWsKwZW+KJixmNSucdWgFhYJEW924PT+1nHMEsqFU6qNN5ITAqWizTU9B3yc1eIb/K
         Wl52iwl2RANmgcetHGevIHlBbl2jo+wIWO1bSo24UNH1xzVMONJFlYFGvzTSjs5JL3P6
         PxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ3TV3xFz/VjhsLyCxPFcLln7Yd4W00DWz+lDu+Ig9Yb53wMIPUCXuf0DHp1TBQVOEhBZULtw=@lists.infradead.org
X-Gm-Message-State: AOJu0YywDh9u/CevdaIllV5gC9BqxhqjUMjTBMpRucr/vlj3Jp4Ix/Hg
	jWV8xOKtnphjkXdWs8FeStl767b80e7B1OKsqmTzwfnHSu4JGgAUYpqppaTQuauMTv9DfY1daXu
	H8aYNJFSlu1qLAY/Lv6gFxoCFWun6RxYY2ySftcZB094FBxruXetrTpBhr9V40thf
X-Gm-Gg: ASbGncsNqC1KbISpSyth8SWpqAhZ+svdddf88rABCgQUeWUTxqAVrLovpbq7OEInciT
	QXjtLR2QLGBs0vOcTakVKAMOefOdjbvlU/e2SiNdEep8miqEUnINs3a/JlvEsZxsFqrG/LB7nM9
	xHO5jxwX5Y97NBue2haDqY14kGbrL5IE13V8FT9TGBPWqZdsQ7jHDa789k2Ih7wIZ+vLMGN7uvJ
	FYz5yoNAGGRiRkILcp84QYfzwd4yJKt4ZMumH+Mw0EhjMx8dwzOO8oGMce9XpqRA8B4RVw9XQck
	+GAVuJSpWbyyMMRGob3UjhdZOQzWvf/I842NNGFVrb5Inlons8pV1QYHXvm5ZECPCXTqiBroyK7
	ELcRyeFqr7FDS6wyDNAKzBF1Mo02IVOEoqxhpjTAWcU4Z14xAmq6I
X-Received: by 2002:a17:902:d484:b0:290:a8fe:24e5 with SMTP id d9443c01a7336-290cb65c662mr24678525ad.55.1760665760798;
        Thu, 16 Oct 2025 18:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVljgwflsJFVVL0ZtQZpZAiOSaHCuz836bjQkgB4ja85VP0SrXV4EDkYLO9VWJjBCWrSpbkg==
X-Received: by 2002:a17:902:d484:b0:290:a8fe:24e5 with SMTP id d9443c01a7336-290cb65c662mr24678275ad.55.1760665760312;
        Thu, 16 Oct 2025 18:49:20 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bbe7a0sm4181475a12.38.2025.10.16.18.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 18:49:20 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 09:49:00 +0800
Subject: [PATCH ath-next 2/2] wifi: ath11k: fix peer HE MCS assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-ath11k-mcs-assignment-v1-2-da40825c1783@oss.qualcomm.com>
References: <20251017-ath11k-mcs-assignment-v1-0-da40825c1783@oss.qualcomm.com>
In-Reply-To: <20251017-ath11k-mcs-assignment-v1-0-da40825c1783@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXx25M7mcbBLEz
 PvcdoqpkeLO343GIJw63D1wcyLYr/y+h6cx9RzFSpU/3oaFWsk3xmzYcRbsmKc6yradkIKMQRyl
 LHboH4dzp6bzQkS88VYs8r73FZ9YATq/R0YophAC1BU5z7Kh/fwaMMgoIz0jZPvQhmIeLN9n+jg
 s+waiOyPwTzc36AOo1MM8SE5FPKgNielvADPhf49oZ6PnkSQsu5KET+hcjtek+d8s7UthiwVZyH
 qzKHHBWDhohVK0Sb/wBmgFhUX4eTP/sx/rfrA9KS/1O5xUMkRR6VU9htsM1D55JcKJqNVniZJhh
 b8m/fLiQ5LOW/K6aecMacmduzlfzPO/RnUQbXenINemA0SkEfPh7cmo43wpKV2eQSW86ApEizhd
 Tf9o9cShVQynRJqXQkLRkj17ec0ubA==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68f1a0a1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7iRMhdnMhBDbN3xG2bEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: DYz0cx8Mwlvyf2KkS0ZAESTWw5XsaYpE
X-Proofpoint-ORIG-GUID: DYz0cx8Mwlvyf2KkS0ZAESTWw5XsaYpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_024929_913740_5303BB9B 
X-CRM114-Status: GOOD (  12.42  )
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

In ath11k_wmi_send_peer_assoc_cmd(), peer's transmit MCS is sent to
firmware as receive MCS while peer's receive MCS sent as transmit MCS,
which goes against firmwire's definition.

While connecting to a misbehaved AP that advertises 0xffff (meaning not
supported) for 160 MHz transmit MCS map, firmware crashes due to 0xffff
is assigned to he_mcs->rx_mcs_set field.

	Ext Tag: HE Capabilities
	    [...]
	    Supported HE-MCS and NSS Set
		[...]
	        Rx and Tx MCS Maps 160 MHz
		    [...]
	            Tx HE-MCS Map 160 MHz: 0xffff

Swap the assignment to fix this issue.

As the HE rate control mask is meant to limit our own transmit MCS, it
needs to go via he_mcs->rx_mcs_set field. With the aforementioned swapping
done, change is needed as well to apply it to the peer's receive MCS.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: 61fe43e7216d ("ath11k: add support for setting fixed HE rate/gi/ltf")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 drivers/net/wireless/ath/ath11k/wmi.c | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 49c639d73d58d46f869aec40f6439268526ea1bb..f142c17aa9aa7483b7d077d51b24aa7b5fd4c48d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2522,10 +2522,10 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 			he_tx_mcs = v;
 		}
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_160);
+		v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
 		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
 
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_160);
-		v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
 		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
 
 		arg->peer_he_mcs_count++;
@@ -2535,10 +2535,10 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 
 	default:
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
+		v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
 		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
 
 		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_80);
-		v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
 		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
 
 		arg->peer_he_mcs_count++;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 942dfeb8b1af8553d1c872ac1444bfacf11f44cd..edff6fb613449c96edd049b8531d46e5f680cfea 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2091,8 +2091,11 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 				     FIELD_PREP(WMI_TLV_LEN,
 						sizeof(*he_mcs) - TLV_HDR_SIZE);
 
-		he_mcs->rx_mcs_set = param->peer_he_tx_mcs_set[i];
-		he_mcs->tx_mcs_set = param->peer_he_rx_mcs_set[i];
+		/* firmware interprets mcs->rx_mcs_set field as peer's
+		 * RX capability
+		 */
+		he_mcs->rx_mcs_set = param->peer_he_rx_mcs_set[i];
+		he_mcs->tx_mcs_set = param->peer_he_tx_mcs_set[i];
 		ptr += sizeof(*he_mcs);
 	}
 

-- 
2.25.1


