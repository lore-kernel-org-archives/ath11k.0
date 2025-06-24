Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF88C77B7C
	for <ath11k@archiver.kernel.org>; Tue, 24 Jun 2025 18:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WROZRR9mmLK2PFxiaEc1SQNzlb0RAKYImQh60GijuC0=; b=q5RJEEdFink1vq0K4U3o9As2Se
	1sH/XsJgMPuGWIF807/SVYXgiLgag6k7uar5witva54GTt9YVr88Ckm7ntH40zeyDWDpXFRT3+FbG
	q/nnHuYpqoMYbvoVV4t96fQkJZdR6XZOmGwAV67VkyYz/f28QtNgOrlKuaiYuFHEavKypRHK+OWKt
	pMfWe8pXmnWC9XZUvoZ5Pq9TqYItv9fIyn8DtnBNHo80twqjzpxrD7m++1uiaOuxGqcYkFVp9i6gu
	h0aFvCmnZ4xxBTWloAFY2w9HcSGpmHPa9PGMSYUiPBqk3fHH4dfFy435cxhLvuMOXImSJSeFT3fKV
	KEUC5cjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8bD-00000006X8v-1RmJ;
	Tue, 24 Jun 2025 18:42:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5JG-0000000638M-2qJG
	for ath11k@lists.infradead.org;
	Tue, 24 Jun 2025 15:11:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OESOuH002957
	for <ath11k@lists.infradead.org>; Tue, 24 Jun 2025 15:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WROZRR9mmLK2PFxiaEc1SQNzlb0RAKYImQh60GijuC0=; b=SUnzGllzQe7mBZZr
	hyZgmrSuT1yzy+JMUqTlQX7iVh8DggcO9UlfTVvrnZR2HtiEAj74fPxEmWa+LEmK
	90SDxIHo5u4P6gqKkRhYI0ae9Q/ROs7BPuXXK6jfj2blftnAaQ3/roWgNW6P6iyu
	22mDwxX8hXL/vJvmeaXqGeQAoLNuyFDz3FM5mEhrvT7GT13RD5LMm0MZSnoi+GS0
	6un3BjI5QGfkoXTSOz/jbziJ/mGIbPPUxJ3nGPTrc8q+BSL6t27xl4hkTkW9H8X/
	98hvXCXzXvRUV9Uv6LOoxsUGB6EXxVXg3Tgd4gUaVTo3wKOo/DpCj7ogBee7fUen
	EFTb1A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec266ug9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 24 Jun 2025 15:11:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so4128090a12.2
        for <ath11k@lists.infradead.org>; Tue, 24 Jun 2025 08:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750777900; x=1751382700;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WROZRR9mmLK2PFxiaEc1SQNzlb0RAKYImQh60GijuC0=;
        b=Ah9nsA/itqfReSF8jj9V58PlXlv4h0prIiBkpJd8kBhmlYC5LTATTeu/vQUgORAvwe
         8rQhACNgObPduUKBvAg4aAAt5fW8DmhWjUVUaR2F9XyfQEd9Vsrj936MafEZcUkgiFqY
         u/SrCKmmyXSRLZbXl6Mhp24JCrEZ8oNqyI1dOJDtTWB4zObx4OBONYG6M5K7Ei1IF/yU
         MnvCkoyr9B5B7i+3EcUjuIBTvnQ/5k8HZddtkcjtHo3clVgfvep/DmdAfIcoqyUG38zU
         3ZN924y37P6TTn8BJFMbpGc7SQO/QFKcxtM9BK8CnYSpOVGyYRMFwX0GOitNLUfLcS3L
         LZBA==
X-Forwarded-Encrypted: i=1; AJvYcCXNWo/8IW1hn5ZIRnepyFv4sLst6i18peDRmqBFyH3DETzMqIzZZAiNjBFl5UXHWwmkZ3ykuK4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwP0UrTXBvT1jkBebqsLSGLXi6JmW96fv0scMr9A/YBSkWoYsU0
	NHnZOJ0fNNWMJQWXaAlXXQsyupn8zhSN/mLSJdK6vWEhoE3EQqb4ehOWtpNbN+AHbb9J8kb4rX1
	uiMPcjcnzPdkHvUeCwZsR4aeYdkRNij27EqaJTjahyEYpGMnbaZXDshGln2LCUCyM
X-Gm-Gg: ASbGncsVkyYuTBGksDL4SJ5Vu6WQJl8bSbEtaljX1y6iF02yg5wBwJhRbYVI8u/HpPM
	Ewa1kIa4Z6DGs8Z/HKrTLF+gf+E8k0xRGY+yc5MurGuAdUm3KgycwiGOTVsNWM23+iy0a8VjUQ6
	P9V2V4SiKpDxeoO6aBvJI0QLgg6UNAjgfr//BYixBasMkDApp2srnz4XQ7d8keeA3+kC6MXTJtU
	yptp7he8LZdsy43drejM1zan3GCcIDppbcllE2xESxs/6APfXTonSZp9vSYNhvXKYAmOp282ASO
	eh2rCIl857oT2Hd1c6nD5tHMvGtbBMF/36BoXHUT2pTOx05RSLDHBpjK/4S0th9Pfp39bhEtxyd
	pqIxAsxni2nVqdNQ=
X-Received: by 2002:a05:6a00:4b4e:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-7490d7927edmr23738578b3a.16.1750777898479;
        Tue, 24 Jun 2025 08:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiedZO03xFRwWBJi+2VpVp76Xjs34tS60jMZH2JYRycd/Sa/hfrCCXMDiZ0p2GGGyen2az8g==
X-Received: by 2002:a05:6a00:4b4e:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-7490d7927edmr23738523b3a.16.1750777897936;
        Tue, 24 Jun 2025 08:11:37 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e0978bsm2003208b3a.21.2025.06.24.08.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:11:37 -0700 (PDT)
Message-ID: <43b978a5-c1c3-450d-8340-dc1a6dddc884@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 08:11:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix suspend use-after-free after probe
 failure
To: Johan Hovold <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <20250624082022.15469-1-johan+linaro@kernel.org>
 <aFpingRwP3foaKJ9@hovoldconsulting.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aFpingRwP3foaKJ9@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyNyBTYWx0ZWRfXy0ZSRrkjOPqa
 0iuXPaemml6jCHkljDqyIcaDvkWKP3eefQSA0d1dVh1LFE7YwfPmU4UG/RwkPPN2eJ8cOme5jbI
 X+bs+54HflEP1GEhb8QH1vIGdXRxiZ56uEUm5AKVaHw+STja7QWtj0bfdhVzycE1EWgJybWeo8w
 gRh/BHmlLGTV7hdnDaflx8x8k42GBsck1DPH3xO0JawwjKrUPIVQpz//7HA4PgkLVATWLRb03B3
 GsCOyH9UNw+FL+3I24lNHVQHiKEfX4B4DrNMB2OMa4hyI6TGBms0pcdy3lPEWZPVu3Zmtd/HRQx
 n/9HCLOtpGkMCQc3TvlWpEExNCdo1SPvQm1gvEkmalqBylPc/dSWF3oJCZ3520uoMLubm54k2A7
 qUW6CmkKUvz4B7N8O0niRVcn4GE0syfIssEhRy54nLZK79eBBg2xSLNYFy49LZgnDCc1vPqZ
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ac02c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=oKBW_v6FYzd1ttqmKkgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7g1Y7PBa5xkg6F0O-HtEvyN6JdwhpMSC
X-Proofpoint-ORIG-GUID: 7g1Y7PBa5xkg6F0O-HtEvyN6JdwhpMSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_081142_722888_41854415 
X-CRM114-Status: GOOD (  12.22  )
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

On 6/24/2025 1:32 AM, Johan Hovold wrote:
> On Tue, Jun 24, 2025 at 10:20:22AM +0200, Johan Hovold wrote:
>> Make sure to deregister the PM notifier to avoid a use-after-free on
>> suspend in case core initialisation fails (e.g. due to missing
>> firmware).
> 
> Not sure it matters in this case, but forgot to include:
> 
> Tested-on: WCN6855 hw2.0 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

I'll add that.
I'll also change the Link: to Closes: per checkpatch:

WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report

> 
>> Fixes: 32d93b51bc7e ("wifi: ath11k: choose default PM policy for hibernation")
>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Link: https://lore.kernel.org/all/d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com/
>> Cc: Baochen Qiang <quic_bqiang@quicinc.com>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan


