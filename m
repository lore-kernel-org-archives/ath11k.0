Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C9BD767D8
	for <ath11k@archiver.kernel.org>; Thu, 31 Oct 2024 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ub/JWH13NrOvk/2P9lnbjjU3DTjmfkl31DbRGAiNyYM=; b=p11r1ehVUwmrHyCLg0a2fPdn0G
	2WSZ5ErM77GCua+SVllaCN5zNdlt4qhC9pe3B7FlAvNdS2gHkPJ3TMHeTTF/dSpvQ253vis+bZJ61
	8XTCqbPKl/+kr0RaheSpnP5KphYRl6vOgn0diqfb6Ld4odNK12OjGn+N013X2vCWFXyVgKiRvK/jn
	F2F2lu2gwKHsZFeZgoCJ0aJCFHd/EA/wQRvd4/2hNUM3eINUCHmndhoncDEtPTwuoFzmaqwc1b7uA
	0NXy+0cjGvDj0lKKHA4OoCQYsr0hmKLGQ0dXSMgfYUWbwKvsXuKr52SOIuo1DPP8C3RSM5tN8ARQ3
	S9yJsCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Xkd-000000048mC-3fj2;
	Thu, 31 Oct 2024 16:10:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6X8w-000000040Be-41zi
	for ath11k@lists.infradead.org;
	Thu, 31 Oct 2024 15:31:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VBwSE6002694;
	Thu, 31 Oct 2024 15:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ub/JWH13NrOvk/2P9lnbjjU3DTjmfkl31DbRGAiNyYM=; b=B9pNY0VGzcgMhXhb
	30FWzsIaVtgvDgXPmQGd1vaWZctqSPdmzr8jCwiQIPEkAdhQkAeOF+0aYoZgoeQg
	0jVz3ptX+LSgitmNtPkod2JJw+pTmTjQKJaBqobpFdgD2wb5qZ68GQTI6Mnt1e1U
	2c1AJ5VdZovAfxDRCr5oH3thT7LxSFEh3ewi0wdv1QAV2ngXG/xrFpVtNh2fKwZg
	tkVWOUjKCcBBxx/zp4FCDtWDWkaEiFoPK2ow9oJpIlEyfm9NRwTzFtu2cphyDM7t
	9laW1D+jjV0qirN2G7U4eq6drBAgIt5qsirykS97CzF+NfsPoeJCceqn+bo+7Fql
	TJhPyA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5c3wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 15:31:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VFVMRb003181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 15:31:22 GMT
Received: from [10.48.242.225] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 08:31:21 -0700
Message-ID: <73ccf2a5-f08f-49ce-b810-6282f9a35f6e@quicinc.com>
Date: Thu, 31 Oct 2024 08:31:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: add support for QCA6698AQ
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241031000541.3331606-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241031000541.3331606-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: M8v_aAnhj6vHUCcXg8Wtyv10U1yYtUGa
X-Proofpoint-GUID: M8v_aAnhj6vHUCcXg8Wtyv10U1yYtUGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=759
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_083127_162498_FDB6163C 
X-CRM114-Status: UNSURE (   9.11  )
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

On 10/30/2024 5:05 PM, Miaoqing Pan wrote:
> QCA6698AQ IP core is the same as WCN6855 hw2.1, they share the same
> PCI device ID, the same major and minor version numbers, the same
> register address, and same HAL descriptors, etc. The most significant
> difference is that QCA6698AQ has different RF, IPA, thermal, etc.
> 
> Follow the approach done in commit 5dc9d1a55e95 ("wifi: ath11k: add
> support for QCA2066"), enumerate the subversion number to identify the
> specific card.
> 
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


