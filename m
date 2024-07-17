Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5A8C3DA60
	for <ath11k@archiver.kernel.org>; Wed, 17 Jul 2024 20:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvMOdXxPx7FQVfR+b1ORo9g1/OmWkFB/985dirZ0xhw=; b=Pkw/jXJHo3jkN2QwZy5RIv2f7m
	6gov3YHOIHWLJK9svbBc9+C/CCV05ecccHfLC/1pGRBWIrUC+cWKUY62pTMkScfnT0y4dhSDWyGeu
	FPIG+J+nA8l8fecb2j0qxciwUMRtAxpBAuXeUT8DVQrxkN7pdfBYCUO0eEIIST8dJyDudSMltFQGb
	pSFxmJUF6B1dZ6l5yilwhVzZy94+ANyqkOM2XkGUn2He2AwtIwanymptK3+EYis6uVj2atb6j/086
	QRixOs3mM0poBTJLpsUDSninPzT8463p82GZqEWXSpHlSS1QJ7XHKXhLEnvjUifvu89jh1KeMMSt6
	PwoR33Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUBHL-0000000Eqfa-2E3J;
	Wed, 17 Jul 2024 20:29:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUBHI-0000000Eqdz-3rbu
	for ath11k@lists.infradead.org;
	Wed, 17 Jul 2024 20:29:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HFq1rK028343;
	Wed, 17 Jul 2024 20:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvMOdXxPx7FQVfR+b1ORo9g1/OmWkFB/985dirZ0xhw=; b=GBsuSi1+USXJT3fI
	eQOQkWFVvvrwzJg+Iqi6pi0uCToyYJYHe2VDVW3qcxSQFqkdL//NljIPlBezh30j
	N2+5EKQeuGZi/sWFQz/8l8NnU6teSsdZJJ1IDXoO3tkwPCjuP+FF/RpmtZ3D/70k
	6lkDuh46v6KLQTi7cLAK1NOvzWJtXnj70qt/lwN9WTQ113sAfYheV6IPv+4PRs6s
	hxgwYf0t7R8jAb5eQvbvVzKtleC+Wo30UfnXDJZJiH4s+Ngi6qsXgDNb171Cbqhq
	hFRE5HYRitUyrY5CGqh9DaiiZPEadVCwdKRsTf2SDuIPdvFLHdbhyu1ZU+VOmciC
	O4ZikQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpkn33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 20:29:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HKTSiJ022091
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 20:29:28 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 13:29:27 -0700
Message-ID: <89c39516-38b5-4085-9aa0-42b9dd0c0d89@quicinc.com>
Date: Wed, 17 Jul 2024 13:29:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Add firmware coredump collection support
Content-Language: en-US
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240605034639.3942219-1-quic_miaoqing@quicinc.com>
 <874j8xb4m5.fsf@kernel.org>
 <870d1749-6f6c-4ca9-b852-7a511e70103e@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <870d1749-6f6c-4ca9-b852-7a511e70103e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: l993qM9sCa9qbK9el2OnnVlutYhDjVTW
X-Proofpoint-GUID: l993qM9sCa9qbK9el2OnnVlutYhDjVTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_15,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=963
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_132933_250121_C7D61D69 
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

On 7/12/2024 2:38 AM, Miaoqing Pan wrote:
> On 7/11/2024 12:20 AM, Kalle Valo wrote:
>> Miaoqing Pan <quic_miaoqing@quicinc.com> writes:
>> I feel that the QMI changes should be in a separat patch and explaining
>> in detail what they are about. Didn't review those now as there's no
>> explanation.
> 
> Minor changes for updating 'iaddr' definition. IMO, don't need a 
> separate patch.
> struct target_mem_chunk {
>          u32 prev_size;
>          u32 prev_type;
>          dma_addr_t paddr;
> -       u32 *vaddr;
> -       void __iomem *iaddr;
> +       union {
> +               u32 *vaddr;
> +               void __iomem *iaddr;
> +       } v;
>   };

Putting something into a union isn't minor.
You should justify the reason for doing it and defend why it is safe to do it.

And note that if you make it an anonymous union then most, if not all, of the
code changes are unnecessary.

/jeff


