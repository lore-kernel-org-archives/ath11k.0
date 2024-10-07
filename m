Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38E6CED241
	for <ath11k@archiver.kernel.org>; Mon,  7 Oct 2024 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nN16czptbzzE5T0RkO5rLxyCaq820a6QscDHDunJlMo=; b=OnuSuhL8ys9gcSQd5HDBvK8w4V
	mEuC6MlyedG8yACVA+Nnp28RgUTsJspL/iorEfLMV6h5hqE0NR8KpIT/y3RDeSbImyjLrYTLUreSW
	49u/sw0UvHtPJleytkhsLXok4bevd4n3m/XF92hjW8/CWvkGxMO3T6229mPjt74YvFKvXmUJRKvHm
	ieb72BPwk2J5VHYXOx3NDekkZc0K+tU3SioXak8A3S9MJOd/vQfJftsnCjQ1BsAOoUyfJIDh4siHF
	Wdi8Ro22lnMU5krCXeIbtknxAmQrrFTf0VRIwGVM5WshF5C8/yunHc7uLE1hOKHQBLLfiU7PdQQcj
	QcR7x0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxvVe-00000003rHf-1fCn;
	Mon, 07 Oct 2024 21:43:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxvVb-00000003rGY-0FfV
	for ath11k@lists.infradead.org;
	Mon, 07 Oct 2024 21:43:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497F0qu5015082;
	Mon, 7 Oct 2024 21:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nN16czptbzzE5T0RkO5rLxyCaq820a6QscDHDunJlMo=; b=EGFblTP19Zvs3UkT
	+5UMHvNEIcOQBQjBRlPiMkTvzSpCna87UVlJ8iZbTGLERH7XbF3WC2vCF5JTXOp1
	S91tsV/bS6ejqCXCQv0XDeyu2UX7XuMWD7UKvU9/nyyfLnj5TKrzGupc8kH8f67t
	yfqbtC9KvDcigPvb+QYPb0JNZt+OXUWzvJ2pxCcOeaRqN1Df88+6MEjlQYlNC7JL
	d7pMCxID9SxfPNw7h8/M3dRaR4sv9TP+pXgGcZRydYr1TZiX2r6CZsaoRwJMDgVq
	hzwMIvaUH6a+uZEu3svhyFlxbYW1e9ugsCgQILHg3mkOTshDuehZl7U7FhDrD/QE
	hlX8nQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs75cdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 21:43:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497LhDfw002801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 21:43:13 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 14:43:13 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath11k@lists.infradead.org>,
        Balaji Pothunoori
	<quic_bpothuno@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20240927095825.22317-1-quic_bpothuno@quicinc.com>
References: <20240927095825.22317-1-quic_bpothuno@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: Fix CE offset address calculation for
 WCN6750 in SSR
Message-ID: <172833739320.2581613.1348010188927412742.b4-ty@quicinc.com>
Date: Mon, 7 Oct 2024 14:43:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AEBVoYnSXSk_8J0rN1l4r-zaoBuzwWLH
X-Proofpoint-GUID: AEBVoYnSXSk_8J0rN1l4r-zaoBuzwWLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=976
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_144315_212710_84C77690 
X-CRM114-Status: UNSURE (   9.96  )
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


On Fri, 27 Sep 2024 15:28:25 +0530, Balaji Pothunoori wrote:
> Currently, mem_ce and mem iomem addresses are used to calculate the
> CE offset address. mem_ce is initialized with mem address, and for
> targets where ce_remap is needed, mem_ce is remapped to a new address
> space during AHB probe.
> 
> For targets such as WCN6750 in which CE address space is same as WCSS
> address space (i.e. "ce_remap" hw_param is set to false), mem_ce and
> mem iomem addresses are same. In the initial SRNG setup for such targets,
> the CE offset address and hence CE register base addresses are
> calculated correctly in ath11k_hal_srng_init() as both mem and mem_ce
> are initialized with same iomem address.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Fix CE offset address calculation for WCN6750 in SSR
      commit: b037edd0c3304908bcddbb9765ba266b6b803ff9

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


