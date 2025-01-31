Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A199BC02192
	for <ath11k@archiver.kernel.org>; Fri, 31 Jan 2025 04:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BFaSoKZoPTfpeYhhCeO+VxxOxOPyhcf1ByIJUCOaD8=; b=zhpqEHvdlxPPZU6V/jiTUw5QzQ
	lx2E+dIjfJYVieQdpsYsxSOhBH43uODnFWuw3UnJAnOnICnGKrn+/AvniyGGyGrR5qsS/XKlLJdC+
	Ae0priq9BUHz4taENK8auv49io+RQlsJyKrTUlHYYoAoT8oSm+NJNxwr9lq4o30iFpEvdeqZ2/cGw
	vmmTNZKUtDBZNRFDZLyI+velOJPsmB1xH8CM351ebOTFE8LVQTsXo7yRDqcGjxriUW+EcBwo8yyDY
	pUsF0H4ZhYNVX9AXQmnBmq3Fj/JwcM5dnlsFn03yf7RoNBweGWWVkRXWYf9+U09JHQgtZ3pNvIbfn
	psBx8niA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdiSZ-00000009zIt-3oql;
	Fri, 31 Jan 2025 04:16:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdiSX-00000009zIZ-02vM
	for ath11k@lists.infradead.org;
	Fri, 31 Jan 2025 04:16:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1oi9003754;
	Fri, 31 Jan 2025 04:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BFaSoKZoPTfpeYhhCeO+VxxOxOPyhcf1ByIJUCOaD8=; b=SmztI7gQmwAvKpbP
	1GEB3y/bHxmKyhkhoiYG1YeG1zp1CfIoxmuTqqsu6iNfCs4Vfy97s24DgX4J9mOa
	UxYzbDcxYVdwaFdFqFH2Yb2gke/528Uv8Dxvsn5cs6vbcTGf2ZhICPhxRkKuobSD
	OxgGp1KRAshhN3EP8C9b1leoMAs51pm39xrGbTB68zLfMifS7/lRLPoA6cKN+HF+
	ijBsEgiu3pMmvtZwZRDK81YgN9XXvUlF0V7PgbDXBtjiZvAuuHTEs37eRvu0YGxw
	bPX1irhV2D7bJtbu0h5pTd95IRWAENwHgQaedoJdOupXxqssyYIyeoKpDyP0jO2+
	jPYJFA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7m8vyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 04:16:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50V4Gk4o029606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 04:16:46 GMT
Received: from [10.216.32.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 Jan
 2025 20:16:44 -0800
Message-ID: <de5b442b-200f-dc4c-e8a1-43e2f56f70b7@quicinc.com>
Date: Fri, 31 Jan 2025 09:46:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath11k: add support for MU EDCA
Content-Language: en-US
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250124061343.2263467-1-quic_yuzha@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250124061343.2263467-1-quic_yuzha@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s4CLS3cRc_XWeerhje1D92bAQN0qGAYe
X-Proofpoint-ORIG-GUID: s4CLS3cRc_XWeerhje1D92bAQN0qGAYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_01,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=770 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_201649_239182_0F06E4E4 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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



On 1/24/2025 11:43 AM, Yu Zhang(Yuriy) wrote:
> The current code does not have the MU EDCA feature, so it cannot support
> the use of EDCA by STA in specific UL MU HE TB PPDU transmissions. Refer
> to IEEE Std 802.11ax-2021 "9.4.2.251 MU EDCA Parameter Set element",
> "26.2.7 EDCA operation using MU EDCA parameters".
> 
> Add ath11k_mac_op_conf_tx_mu_edca() to construct the MU EDCA parameters
> received from mac80211 into WMI WMM parameters，and send to the firmware
> according to the different WMM type flags.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04523-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

