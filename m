Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E66C44507
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2FVNtgJupCOGgrImLEh9tbVWBpZqEe14ORG5Bzq4qE=; b=oT/CRxaFOJ5uU4Pztx0YLuPEeb
	pMZlNa53zsFgII6jx4XKmXfm6AYt48lgTyh9ktlORLckolPRlyQUQKx3+rWewGZpMqABD+TqXYupB
	nEhuBUWFANM4PwDCssxpSPpA4E98fN1WWw1RSi2L/LPsTXLLs4eOVOiYn7BuApq6WrRJvIxLqA3J2
	F9Bjo+i5BBg53k4UKGITglSCS5QzPK6t+GGMSy78CxS0SMReyVeKhAyOCSYUdYkdTXvXsRyo5uNBS
	3cJWvefb83xmnUGAPVOH1ElPSzWrXCKdEStwMrE91vVm/jRsLumzFp3j6oPTmE5TuBBAkmeaOws1c
	BZP54FzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJKA-00000009vbO-3aNw;
	Mon, 13 Jul 2026 16:16:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJK8-00000009vYE-1k7n
	for ath11k@bombadil.infradead.org;
	Mon, 13 Jul 2026 16:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q2FVNtgJupCOGgrImLEh9tbVWBpZqEe14ORG5Bzq4qE=; b=mq/WGO5qe10AthC6dBPg6lUHLe
	56ETFvVm2QaA8ew91V0HOK/vdFc/LDdcVnfJW40ulW2SRvAA1JOGI+ltXB/NravG4pWZ3IlO8EH+4
	chj9/yziX2aP0vFF+/7RqkALEn1Bpr02FvU/+IGZy+HpR+bo4mcLP2Y8EyKUUGguaJV33TLF2n/Ni
	MXmiJXg0um9IP1TjN20br4kHlw5RTF/jikT/lkkDn41eV0V1iRbUygRK9FEeZd421v9yRaAJVBh5D
	wSM9TotrxIO81B2NBEUDVvWb1ZhXUdLIiOiPARxsPw4y9SwWsA5ddJSI9W/eZ+4wqSn6GPEwzYupS
	zE41W7RQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjJK4-0000000BpGU-3iZX
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 16:16:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF862n1734672
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 16:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2FVNtgJupCOGgrImLEh9tbVWBpZqEe14ORG5Bzq4qE=; b=hcLhYbqLG6LCHeiT
	DYDuabS7eA22M1iSy//7y5P2G9tnNh2FTXn1GFXHyRy3/7v/2NP+27bTYoi5fmzU
	r6w6iD31zeE8/CvuE2ie4ZRYTs2HObr8itnhWLk8L6tDnoFeWOIh89I//mDErJhY
	AfNGVOzITzjXfOEI4AZoTDOKNnss/nm18q1/3L/IULO51IHTUc8cmlUzPRFRd1F3
	eMj1Auc+jULhlRAOFsc92WCDBttS1oJhExj/NPcU8g70j9uZWMj39SsoPMAWZ5vR
	vEYgidHVKZ1g9wfUSYYrLY2n+tOCJ938S2BsdCNKI3yvM1IKH21V7orC/iYo9SLb
	bufq1A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8jf8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 16:15:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84877b362f6so5401472b3a.2
        for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783959358; x=1784564158; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2FVNtgJupCOGgrImLEh9tbVWBpZqEe14ORG5Bzq4qE=;
        b=HWLgzM+ZDMQrFDS8vMerN8Y8pgWxjTwG5mbFL9biucShnrB4Mey4Tc0pg7kyIuoSei
         f1rAxu70UdrUBCdU4Ts0MMJ3q3Yv4G9FLt/C3CnbQBhNigAH3xbEEDAOQtx7VV3mFbiH
         Gc1toGz6IdDzGpSJARPOHk/c8IoJNp63w0ttuBcxYxfx8mjJtu5d3ljMFw9oKtEdt3af
         Hi17dJLYfIPnbxEkyWuwP6BVYoDhCgvBJPoR/PPrcPWdpQ7ZghmKrYDp72uv9JpS+jt3
         OlwpnEoSVPYRxJXhLoHevbNiVfvmoHov0P0IDSgoxjvBMqxcH0yFDuXfZBETsjsmXAt8
         +hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959358; x=1784564158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2FVNtgJupCOGgrImLEh9tbVWBpZqEe14ORG5Bzq4qE=;
        b=WfT/ufupuBHLSg9xgLruvDUiVf5eZNnYBv8Nk+WqLqQGtcD4FiUDUn8qExCyBRGZXM
         QzmXD7nBcVizv7UnFVT1RZM0EOr0idiHcCQmj0gfJzW/W9CUxf9SnS7P1M9TThd42lre
         jS/vb7+op5VMz1C6BWxRr9RC1anUBcfRaNCiRWOiZjL0+MD5gUgJnlWHNDKNLN8AXV+h
         jpD4zCvrSx9bVmNTlA/6fSaHF0KyalXpJNUegaoHHxM9p39UdENoPlmXfCiUqVyP8l5l
         8SNuvw+30YuJBUIiiFaTlAGtVpXD1oiuvitlAMbEAfO1LCxZ7yZ6uQVM5aM3Z/u4k5KN
         J3aw==
X-Forwarded-Encrypted: i=1; AHgh+RoKudUnbIGTZ2kDT1iKNmppZmLNvQ7K0MtPbqhQmPvFcFy+b36wUpeILDHQ18wLukVq7BECgTE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWQIF10iW5vZIW60T+vciivEPd0j5qUZICarOMS8HVuALy55Vt
	nohjpu7JkORogsURzdpFnjpifp4oh7dYylTHTgTZbeDnxO2FjI3MP689FSY+uzQujm9P8zrsRME
	H37c5rH3AXOummuzMu/my3ONy2OuwCzB/RDQ9ai4x+OY86ec2/qqLgnZiqHKp9VO8SMKVLkmh
X-Gm-Gg: AfdE7cnMEN3+da+JSF18keu4s7ktXr7RkYMvt7jFWHtuBQDRgRvy9k5xMKSGLW5Wn5j
	/N2XXcpGZ1T/OpdKxKU25PzRGUP3fVVUzvUIwXX82Grx3iBQa+YW+OaLzHrLVzHF6uceeKT4kAg
	Lb+jexEfo5zlOb3kwF99WMBoVw8VCVWiaBOdcvny3FnEF3abYvyRTNepCx0ZwCURHU139Vm/S3/
	6ioVuSWT6DERRZuv5jZFM8aMP/j2fRDkPFsNNVKTCj0YLBz/eRQAyjJaBvpLu8kGX6bd+3H80eL
	xQOe6WykPbLXEbA10vyGFagWFR5StsL0kKBdlWRiOQAUPJLeuj+1CxM2okPNdYUGYZ17R+4Paar
	cGUQ096AL2HLFIhvPmypNNY9FSMM7fUsWqwO+C27HpMWkxRuCw5qYGoJjMptbU48hAg==
X-Received: by 2002:a05:6a20:9190:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3c10fd60400mr10508136637.0.1783959358305;
        Mon, 13 Jul 2026 09:15:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:9190:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3c10fd60400mr10508101637.0.1783959357882;
        Mon, 13 Jul 2026 09:15:57 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm60877039eec.20.2026.07.13.09.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:15:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:15:50 -0700
Subject: [PATCH ath-next 2/2] wifi: ath11k: Correctly copy the hint BSSID
 in WMI scan request
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-2-4ffc4a472992@oss.qualcomm.com>
References: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: gGP06GRLOkmsnw0xUKNQ_s_DKqvsSmqF
X-Proofpoint-ORIG-GUID: gGP06GRLOkmsnw0xUKNQ_s_DKqvsSmqF
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a550f3f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RxwCyRMQgNksxjula40A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX5/1ze07E/q1M
 6LHNQQlloo0hz2/wCcA4SGf3a0FOuUu+Dsu9JmVPdAGPzXmdnpaHdCLRrYpsA7kW732oCsWSFE1
 Hjf9qX6JLz/+fSOlGgsTy03mFRLNaaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX2qcSTyUgzBwr
 R9I4f0Ex4u3xATV30EwRxHxa0qdaRyhSGmPvlcZS3vPhIuw3GZ+Wj7f70npupeUvZNRzU9Te4+A
 jFgEmoeFsh5/FJixNgpF4xURc0aN7mgxWHaxN0Xe3snIlz/DFMeEEdTIUqsJDb/ci0gzDRvFx6A
 hPKTPHD9qimi7HClq1mPCj1oI607bxJJ4JwtV93rpF+A5uaNOEbScmcnaceWYROXhbUH7h+jWzi
 DUcDK4R3CO/bSUct5rfLjQGG0DAydPOMhzKPvmKwE0JWi7LSvJNKF0E+cG5+12SuxJjf/azLfLC
 mvYbAEoC65yV97EAC4mpdgnuFVqagTOwNAxeClsh8bZq/BtWrfYuKo99gVokX3G5e8qHjBTfuX6
 Av3J9lhLhdRbLe5my8DhYeEPOeGJ2qlEEsW8nL2cHXuaLfNDf5d6+Iq380rqAwiqsKSCahqpg4z
 Oa6m0tB1QdnoR7lCH6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_171601_290362_7C0CBC1C 
X-CRM114-Status: GOOD (  14.48  )
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

Currently, in ath11k_wmi_send_scan_start_cmd(), the logic to populate
the hint_bssid copies the BSSID in the wrong direction, from the
firmware message to the argument buffer. Swap the parameters so that
the BSSID is correctly populated in the firmware message from the
argument buffer.

This issue was reported on ath12k, but exists in ath11k as well.

Compile tested only.

Reported-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-wireless/afbff608-a005-43c4-af76-968a58bf0cc3@oss.qualcomm.com/
Fixes: 74601ecfef6e ("ath11k: Add support for 6g scan hint")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index dca6e011cc40..c54f50b98a13 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2423,8 +2423,8 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 		for (i = 0; i < params->num_hint_bssid; ++i) {
 			hint_bssid->freq_flags =
 				params->hint_bssid[i].freq_flags;
-			ether_addr_copy(&params->hint_bssid[i].bssid.addr[0],
-					&hint_bssid->bssid.addr[0]);
+			ether_addr_copy(&hint_bssid->bssid.addr[0],
+					&params->hint_bssid[i].bssid.addr[0]);
 			hint_bssid++;
 		}
 	}

-- 
2.43.0


