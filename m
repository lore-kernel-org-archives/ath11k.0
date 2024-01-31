Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6146C47258
	for <ath11k@archiver.kernel.org>; Wed, 31 Jan 2024 17:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+V1XOC7wNWvASBY3Ytq8zfYk5micrfPTMF3VutHgV4=; b=rQHWYfJYqQN3v1Z0TVmFQcEdmq
	+IGOAaPkaKG+9ynnafLHFXE2POdYecq5XyA21OTKM9XK7Bav7mSn2Yq9F3b89sJGKko55MdLu4XDs
	4cTHzXeRED+Kl88exQleR/yYdMHikY+sT3aAs9CJStOBHn6txjGCiOVePLM9lgJQ+ThD1idAndz7j
	jkry+JpXA6SF37S1dtT8ErIiceqsODBmrTiMgaih9hl4USE4h0mVVZlVfdkwVuMv9jBc3wIBNOpKY
	NxcK6kvNdKQZMGyS7xAehj6p87fpI3d+v/2fZQnOiCS7ie/Fgc4/BjFNQfU5xg023s9+diSSspOSF
	xmLzcS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVEIi-00000004oT2-1pEc;
	Wed, 31 Jan 2024 17:23:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVEIf-00000004oRb-4C8F
	for ath11k@lists.infradead.org;
	Wed, 31 Jan 2024 17:23:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VECmSQ004357;
	Wed, 31 Jan 2024 17:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=N+V1XOC7wNWvASBY3Ytq8zfYk5micrfPTMF3VutHgV4=; b=pI
	OYdF/n9v2XxwK/mYFf1csXp8EGBO0LH2GxYfcV05/GsDe/Co0zBwjtBvU3rnVexM
	lTA5/YetrrnlwlN5itoH0RBTKe2puP/bd5oJfLakTWfubwJj985HFj2v6hLLj5YI
	fkKCD0UJw3OV623U3c8jQ500j1bCvAy0DqHsi3gHAW5W+hNzKi03LqqQ8UlQQEUv
	pIHfirxwcnvgPa7hXZAMbNcAPmL4LBD3+CfbjTYFkWq0WpyVl/sCzJIEqOyrQ0Om
	LA36FKdqeIilHczEsLDqx0hLlfS+wwVA6ThEiom4KuXhsc+VM2r17zhH2+VAcXOo
	VND5nnltKauNlMCH7yGw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyfr31r1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 17:22:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VHMvXd025617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 17:22:57 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 09:22:57 -0800
Message-ID: <1feaa828-f4ee-4acb-85a3-94769546a10c@quicinc.com>
Date: Wed, 31 Jan 2024 09:22:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: change to move WMI_VDEV_PARAM_SET_HEMU_MODE
 before WMI_PEER_ASSOC_CMDID
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240131021832.17298-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240131021832.17298-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 55TkHPW9NvBzumy_lBOKQiV4E1UMK63v
X-Proofpoint-ORIG-GUID: 55TkHPW9NvBzumy_lBOKQiV4E1UMK63v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=922 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401310134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_092302_080136_EF7E29C2 
X-CRM114-Status: GOOD (  12.45  )
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

On 1/30/2024 6:18 PM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently when connecting to an AP with 11AX-HE phy mode, host sends
> WMI_VDEV_PARAM_SET_HEMU_MODE parameter to firmware after
> WMI_PEER_ASSOC_CMDID command. This results in TXBF not working, because
> firmware calculates TXBF values while handling WMI_PEER_ASSOC_CMDID,
> however at that time WMI_VDEV_PARAM_SET_HEMU_MODE has not been sent yet.
> See below log:
> 
> AP sends "VHT/HE/EHT NDP Announcement" to station, and station sends
> "Action no Ack" of category code HE to AP, the "Nc Index" and
> "Codebook Information" are wrong:
> 
> Issued action:
> IEEE 802.11 Action No Ack, Flags: ........
> IEEE 802.11 wireless LAN
>     Fixed parameters
>         Category code: HE (30)
>         HE Action: HE Compressed Beamforming And CQI (0)
>             Total length: 152
>             HE MIMO Control: 0x0004008018
>                 .... .... .... .... .... .... .... .... .... .000 = Nc Index: 1 Column (0)
>                 .... .... .... .... .... .... .... ..0. .... .... = Codebook Information: 0
> 
> Change to send WMI_VDEV_PARAM_SET_HEMU_MODE before WMI_PEER_ASSOC_CMDID,
> then firmware will calculate the TXBF values with valid parameters
> instead of empty values. TXBF works well and throughput performance is
> improved from 80 Mbps to 130 Mbps with this patch.
> 
> Good action after this patch:
> IEEE 802.11 Action No Ack, Flags: ........
> IEEE 802.11 wireless LAN
>     Fixed parameters
>         Category code: HE (30)
>         HE Action: HE Compressed Beamforming And CQI (0)
>             Total length: 409
>             HE MIMO Control: 0x0004008219
>                 .... .... .... .... .... .... .... .... .... .001 = Nc Index: 2 Columns (1)
>                 .... .... .... .... .... .... .... ..1. .... .... = Codebook Information: 1
> 
> This change applies to all chipsets.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Fixes: 38dfe775d0ab ("wifi: ath11k: push MU-MIMO params from hostapd to hardware")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


