Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABB3C25B75
	for <ath11k@archiver.kernel.org>; Mon,  3 Jun 2024 22:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vdz46IEtkWmC/nMGa3fMyLH+j2ZKNwQMSiUifjrCXe4=; b=2vfbJIQOBO/02Yx/dTuIN2K715
	scCyrIa1x5qiGkk7fTfnOvsNLpe1t/U+HebpUIRwpYXE0WWNI7YNYsckT6RlM9iAMlwGJso85Rw0i
	MloZwaAKjHVkrKy/PxoZcBEr6Z4oFdGgkPfp8baIhVJY9bQPEWl3hK7zkU0RXqsYl1k7oFyFe3EDa
	q5BeoanKk0DmGSaeHdlJhCatZSSLVmG+vHP1wYLtUx0sV62fT58QHmpQxBgZJsiqnKjJpWiauKtMP
	LapRydW5rZdZgU9Qp6QVbVFhiG9iYyV/I9sE3ZMrLvIhWfElcWux/hhtgh6LwZ4R63FVznIhpxbJN
	kwJ9+jWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGNK-00000000WUr-2dVU;
	Mon, 03 Jun 2024 22:41:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGNG-00000000WSM-40VN
	for ath11k@lists.infradead.org;
	Mon, 03 Jun 2024 22:41:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453C1HKM014253;
	Mon, 3 Jun 2024 22:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vdz46IEtkWmC/nMGa3fMyLH+j2ZKNwQMSiUifjrCXe4=; b=hGbGvyi39TLeO8iD
	Sl0kHH6XtnnB+KwFzj4OjPjNU+oUqDM3nFiXk0ZcJyTNNHrRLcMpkd4TbaXhGeh8
	tZRl1ATn/b8mglb9aevZpNKdnq4fxcP3dTgQfTd016qj1JqM7V8X4sPI81HGd0Y0
	9UcU6+qsBOCFHtMiIVlIvfRglB2gJsV0IVgwAbSEm0XEjzaotouvaLA3Dx6PWkKa
	RLX9+K1cM0Tg0xjPvFRgZtuUURyovyG5OsaZFO08EsgmYxYd7gcjBC/6d8cLlOqT
	pY6sRY/agegu4vR8tS5gQFnBlni80QJiRaVvIENUpIMjq7Qt0Dl7HVIQ89zaEBsO
	vBWUIw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4d5b2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:41:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453Mfqpi008544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 22:41:52 GMT
Received: from [10.48.241.139] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 15:41:51 -0700
Message-ID: <0ab4a069-d728-4035-ace8-946a419da971@quicinc.com>
Date: Mon, 3 Jun 2024 15:41:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix wrong handling of CCMP256 and GCMP
 ciphers
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240531021228.2846-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240531021228.2846-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qjf91cpRFyQKz4sMbm2L5eOUy7pH3ZyU
X-Proofpoint-GUID: qjf91cpRFyQKz4sMbm2L5eOUy7pH3ZyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=944 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_154155_165258_48EBF498 
X-CRM114-Status: GOOD (  10.21  )
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

On 5/30/2024 7:12 PM, Baochen Qiang wrote:
> Currently for CCMP256, GCMP128 and GCMP256 ciphers, in ath11k_install_key()
> IEEE80211_KEY_FLAG_GENERATE_IV_MGMT is not set. And in ath11k_mac_mgmt_tx_wmi()
> a length of IEEE80211_CCMP_MIC_LEN is reserved for all ciphers.
> 
> This results in unexpected management frame drop in case either of above 3 ciphers
> is used. The reason is, without IEEE80211_KEY_FLAG_GENERATE_IV_MGMT set, mac80211
> will not generate CCMP/GCMP headers in frame for ath11k. Also MIC length reserved
> is wrong. Such frame is dropped later by hardware:
> 
> ath11k_pci 0000:5a:00.0: mac tx mgmt frame, buf id 0
> ath11k_pci 0000:5a:00.0: mgmt tx compl ev pdev_id 1, desc_id 0, status 1
> 
> From user point of view, we have observed very low throughput due to this issue:
> action frames are all dropped so ADDBA response from DUT never reaches AP. AP
> can not use aggregation thus throughput is low.
> 
> Fix this by setting IEEE80211_KEY_FLAG_GENERATE_IV_MGMT flag and by reserving proper
> MIC length for those ciphers.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


