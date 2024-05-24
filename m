Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED96C25B74
	for <ath11k@archiver.kernel.org>; Fri, 24 May 2024 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRZUb0LNGsVkw193dO+orMMhKDRa1njIH0iDD8XFj5E=; b=VCFvf06ESkrR/3HIUfVpv+bt19
	2FvQLkgajRB45gCD2xWCQyMFo50KS1+B0QtwhAXW+FBW5UGG6xiLCokfkhB/pxwP/U7PBDG13H6jt
	T+11gFWyi+PcYTvXpVoVWi5JKgtEtfu6SDlDtHdqv+b5qbnPw50rT8T18saE4P7Iw8DsudiKA8SIj
	QErGQq6CEn5A/q1EiGYMT6LIkk1sUDdbZ7fK4HQA8FpuCBmVLopmt4goNls3CF+DHxyyRdk3xJASS
	4pfMYMo3tAZ+1rjK6qxq8zc2L1Hp9iOkMIkVKzr7u7yM7QHQtE+yfnh/CMZ2+kwKh/gKabN3o7CNs
	UM990gvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAX7H-00000009HqA-1MK9;
	Fri, 24 May 2024 15:45:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAX7D-00000009Hpc-1LUj
	for ath11k@lists.infradead.org;
	Fri, 24 May 2024 15:45:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9bZ6l004810;
	Fri, 24 May 2024 15:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRZUb0LNGsVkw193dO+orMMhKDRa1njIH0iDD8XFj5E=; b=cq/Gx+/+6MZe3IOG
	t70DOg2O6rJq/z2Nq/OyOVM2UnLp0XvG4RLZmLHG0WWmAtAU2XpgcYSNYax7qDjg
	GivN73Jf1sFe9OeupFMCjjUbi01i8fqaV1kByA/rv7ZnDbMVpRqVvMt51hgbKKyO
	U/VdYA6cQD4lve7SmpnEYu92wR4U8hVqnHTdf9LbEg0+2E9eRWc1KxDGGpZvy8du
	qq5ixClgCxBJning8JBprE488vi6jzfrZVXryIpvof9JtnWlTV8F0QYQHbP8fSgD
	KceryerA2ecUyT1Tlxjo3c6uzFKTjGYXI8kTo3Bie5qfsGG6iyjlz1bEMrnIPjV6
	vvgd9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa96jwjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 15:45:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44OFjonf026573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 15:45:50 GMT
Received: from [10.110.127.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 May
 2024 08:45:49 -0700
Message-ID: <1501fbb9-7be3-4b6f-8d9a-177805d91e9d@quicinc.com>
Date: Fri, 24 May 2024 08:45:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix wrong definition of CE ring's base
 address
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240524021558.34452-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240524021558.34452-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oEqEnN1qnUZHM2nLX6hpz6bJJNxnd5Np
X-Proofpoint-ORIG-GUID: oEqEnN1qnUZHM2nLX6hpz6bJJNxnd5Np
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=729 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_084555_536579_47271D4B 
X-CRM114-Status: UNSURE (   9.56  )
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

On 5/23/2024 7:15 PM, Baochen Qiang wrote:
> Base address of CE ring is defined as u32, currently this works
> because coherent DMA mask configured as 32 bit:
> 
> 	#define ATH11K_PCI_COHERENT_DMA_MASK	32
> 
> However this mask could be changed once firmware bugs are fixed
> to fully support 36 bit DMA addressing. So to protect against any
> future changes to the DMA mask, change the type of the fields that
> are dependent upon it.
> 
> This is found during code review. Compile tested only.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


