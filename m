Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DA2C25B75
	for <ath11k@archiver.kernel.org>; Mon,  3 Jun 2024 22:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Px4qKugSVxGRibAEece6XmaRLJzAdYMUN0V3+r8mfGI=; b=fP4PUc1fmqpwoX0aGQKJbGfvoS
	ogOqR+hiEYMHmHY5aLz33+Uvr8haeDI87dmgVYGmlTTduxFg2tjTgTcWWEY6a2bSOeDbC5J27fakv
	KNoaHY+7pjnTQY0Pl1vEKApIuLjjKCbbBwIaFkJ2ncivcblAi+2zxk20b6+UQACRHjQtysa+IX8Is
	X6FH0NDOC3Gx2J4O0ZmbE/OlZhkIFcItZbWf4EY8MJPpBH+8+Z9K7O2mFcaUJqEWlVuEkoGm3srRU
	wQjczRQs4O129Z7/VSyw02Zj6nijh0pNki9XoFnccyGu3/JXd56dpJAnpXEIOYQpAYP0YWPrZggnt
	BiXSMpdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGeZ-00000000ZFE-21EG;
	Mon, 03 Jun 2024 22:59:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGeX-00000000ZEr-0UVz
	for ath11k@lists.infradead.org;
	Mon, 03 Jun 2024 22:59:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453KeI92011909;
	Mon, 3 Jun 2024 22:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Px4qKugSVxGRibAEece6XmaRLJzAdYMUN0V3+r8mfGI=; b=ndu32Zz3PGYXyeoz
	Q5VLgKdpSUO6m0O3X5h3Pcm4DkhOtzT10ZiKSXW2uAZHJ+Ejs97HaziBlKrHBkS0
	XCAU1z9mEP+OzWbekV6fgEabyqr9W3HVaSzN7aWRToUB52LdGTFoFb2FSsBJzD2k
	2AhnP/sjsaJeC0QfmBTvkBc15LOAnxkS9ahElbCnPtVzuEPCjMm24N4T/7WQyllN
	DvQdSrFTWeY0CfeIY8zGxmaop52HbSXUSBTd9WI+DUqcElUL8M8bIse0/zBJMbFH
	nd0Y6b42Prh/UcV1lSGG6ERLvQx60y8jT9khwb8TJl0q//E6RZRTLNlsshgB/kEP
	lxC7vA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4bd6ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:59:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453Mxe5b005285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 22:59:40 GMT
Received: from [10.48.241.139] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 15:59:39 -0700
Message-ID: <75f1a3ae-c1ca-46a6-b38f-b0eb1fa3bdb2@quicinc.com>
Date: Mon, 3 Jun 2024 15:59:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Add firmware coredump collection support
Content-Language: en-US
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240531064019.3687581-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240531064019.3687581-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c4qeob8dJAYcFkjVPZ8yALmig6vl2Jl3
X-Proofpoint-GUID: c4qeob8dJAYcFkjVPZ8yALmig6vl2Jl3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=746 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406030185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_155945_413143_0F7C1224 
X-CRM114-Status: UNSURE (   9.55  )
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

On 5/30/2024 11:40 PM, Miaoqing Pan wrote:
> In case of firmware assert snapshot of firmware memory is essential for
> debugging. Add firmware coredump collection support for PCI bus.
> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
> format and also pack various memory shared during QMI phase in separate
> TLVs.  Add necessary header and share the dumps to user space using dev
> coredump framework. Coredump collection is disabled by default and can
> be enabled using menuconfig. Dump collected for a radio is 55 MB
> approximately.
> 
> The changeset is mostly copied from:
> https://lore.kernel.org/all/20240325183414.4016663-1-quic_ssreeela@quicinc.com/.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Kalle, I don't have hardware to validate this, so hope you can do so.

