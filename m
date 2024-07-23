Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9235CC3DA5D
	for <ath11k@archiver.kernel.org>; Tue, 23 Jul 2024 00:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xc/7c8EyA7NuKLSZkl8JnxYlf9iDnVc1uk3+MRq8y+I=; b=vQFC2VN2E3zjCwTEsUKFiZYWGv
	NYH6JHaa2YHCudmp9/drMTbbx3LGEDCs9wglr247shdz1y8ESPaM41VyltXiukA/VKrqT9G1TOWx7
	pzeoA24iixSnBr7xNzjr9tZrJHZY3qRMkf2GHEb5czjgrO+5fv/x2xdsclUoqrcnsy0g2MBbNeVLf
	W4vZ879yJKs5ks1vyHPTZF4Z688MewvPFlihKs8Ek/clRvEsXNtj3DII63v/ud+BzgafsMYG96uKm
	TlhnvOCDDSCenc7qBQY9yYVwTvePCWqIW1zynCczcNDTknifLvI4BzAnj4sp/zxU7enRVOYBLxRJA
	pkXIRePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW37P-0000000AvpO-0YE3;
	Tue, 23 Jul 2024 00:11:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW37M-0000000Avou-14tX
	for ath11k@lists.infradead.org;
	Tue, 23 Jul 2024 00:11:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MAn9Xd003255;
	Tue, 23 Jul 2024 00:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xc/7c8EyA7NuKLSZkl8JnxYlf9iDnVc1uk3+MRq8y+I=; b=G3BrmQYFihRgqY4g
	jF3xyP/BZVHC+GHIwCoz6vSHvZOxyBuKqtvCWQeZ7yf7PveybPwdn0qvSlQ1Fhg4
	qkObnfZ8Mn6dIzqfm+2N1Hkl4dKJiGJh9y2vEukf76iLX7cbvDxF0r4QNEjbRIcK
	c9OSFL/XcXoc/Od1r9QvmjIldUlJG+mIFY37ihf8d6zgUY8vKmMgu6oMRJFjkvCq
	vHUkERYjwo6vqkBnaFRz/uE0XOHKmE7ouqDEfB0B5MI5TblcJxq+nOywBbrAGbDe
	xisjaW43357ghY/XYto9n/34vhxoj5Fv2cKTP5KgK1LK6ESC4Y1MuaJkuckidbKx
	dQ8VLQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g6h8w0re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 00:10:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46N0Auep008278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 00:10:56 GMT
Received: from [10.111.176.36] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 17:10:56 -0700
Message-ID: <a1ed48fb-8b90-4cfb-81b9-dc2c5cc49cde@quicinc.com>
Date: Mon, 22 Jul 2024 17:10:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: Add firmware coredump collection support
Content-Language: en-US
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240712100442.1790499-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240712100442.1790499-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JTaYKtg2sEg5Bqa1UpTrFS591zcvPtRM
X-Proofpoint-GUID: JTaYKtg2sEg5Bqa1UpTrFS591zcvPtRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_17,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407220180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_171100_338300_CF6B7731 
X-CRM114-Status: GOOD (  18.73  )
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

On 7/12/2024 3:04 AM, Miaoqing Pan wrote:
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
> ---
> v2: fix implicit declaration of function 'vzalloc'.
> v3: fix vmalloc-out-of-bounds and remove CONFIG_ATH11K_COREDUMP.
...
> @@ -102,8 +102,10 @@ struct target_mem_chunk {
>  	u32 prev_size;
>  	u32 prev_type;
>  	dma_addr_t paddr;
> -	u32 *vaddr;
> -	void __iomem *iaddr;
> +	union {
> +		u32 *vaddr;
> +		void __iomem *iaddr;
> +	} v;
>  };

replicating late-arriving v2 comments here:

On 7/12/2024 2:38 AM, Miaoqing Pan wrote:
> On 7/11/2024 12:20 AM, Kalle Valo wrote:
>> Miaoqing Pan <quic_miaoqing@quicinc.com> writes:
>> I feel that the QMI changes should be in a separat patch and explaining
>> in detail what they are about. Didn't review those now as there's no
>> explanation.
>
> Minor changes for updating 'iaddr' definition. IMO, don't need a
> separate patch.

Putting something into a union isn't minor.
You should justify the reason for doing it and defend why it is safe to do it.

And note that if you make it an anonymous union then most, if not all, of the
code changes are unnecessary.

/jeff





