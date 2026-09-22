Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF730C982FA
	for <ath11k@archiver.kernel.org>; Tue, 22 Sep 2026 11:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=; b=GKzsvRW6cWUsAkrWVbDyFUAas5
	ar1mYh9SA+NO98nptb04WLX0J3T5Pu3dYK7HnfIv0uVQqlqngpkVRNowu9g0r3i7AAp3lL9EH4Yt2
	41feZnvyKTp8Pical/Cte/RIDbUP+NmSme+gC0LpA1AGz5x/da3szIzvqfpB25Ivn3jIllghtLV8C
	Lxu2OoELfUYnIOzsFz0NkNOYV8zAARpFJtG/NUxiggeac/iiKk5+IvQDPx9E1RcJKY1rh7HkAZ29q
	TO6V+Ln/JGQnatvpUEzF9MucHTNuncvsHQUS0YK2b/OJvH9E2Ix4nXwAhzMj7rdCCzEWC6hAIf61l
	N65cHElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yGU-000000058Ij-1eGA;
	Tue, 22 Sep 2026 11:02:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yGR-000000058Hl-3B80
	for ath11k@lists.infradead.org;
	Tue, 22 Sep 2026 11:02:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M70ldl1978632
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 11:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=; b=O/9/FtWxxKdesNdn
	X+jhngUM6a2s+f8cRg9BnTHs2IB1PNnBRiC1xXp4TMMwDFbYjqQ/N3TVfUQJW8sk
	zME2nth6+gxZpgbZ3yvB2MeeqBAD/tYgO2iRPyrrbkFNoGL8sq2Y3s4l5jgI2qX/
	uUHppnv09sG4NdpeT5LckSjZU3vI5z6hwxhRw8QYWBawGSRVF+v6R51JZFtrOV++
	3lByHLhyPB8ufyRl5Eh5sry7IL8HqFOTY19Y1dQHC3g0rKiW2An1/8k+OYB3TLSD
	rrVbvgu1cGLnMQMVey4MDWaNNa42OakQEYZLFaQ5C6rW7crCZ5Y+qfEXn5g95DVY
	8PSBfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jgef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 11:02:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5128470a91.2
        for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 04:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790074938; x=1790679738; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=;
        b=K7KXyLFXz+BukYx17KDuPxybj/eCKwEPyYsXKpI5swh80JfBFmh+/j42ZThsEZ57LI
         mwwKzC1Up3sMSPBbaaMzl/v1Kop8v+3WizNem07ttYFAHuLKwzwCNzXtL89e6h5bheV7
         i+HPJNLUMo5LGSpRTnljD3+0q0v/B20va1JaFmMLIgdlEvCXc2IjlSIdQgspFfCvmwhF
         PvhBAUtFM6a29bTV3m9jIqq98aAQ6evVfFkqx7YZlZawTXbPCOUvuJODgMlJV0/vUmYJ
         conFBvma2LOwOP7c25dGJWHyr74nlevV7XCpe9ufS7NR0NPjrf+i0l3NTDWt+AhvHkyF
         7chQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074938; x=1790679738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=;
        b=1LGf8w3k8ZxVAkhGUwkmeLKlK8+HYizKvrhMHxTloAdyxLRm8XiSb0OVOjCK67X8g4
         OO+ByLgtt2eyQs+LgzUm5U8pCTxJBcnW10XvuUlwuM8Q3Pvz1vEHwKbk9aj58thQ1kYh
         8Qop5etIx8bET36nc2vWJIQl9kXtUkAbBGz++rvNyztrzuLJCgRQmKkmQlsEX8l3+oA3
         OaXk/abg3xqKz/1rq8FItFmPkbcEaEiCZVV46LSWVeg4pHJ2dZpl7MNs761z0S7e1Vuk
         p2XRzxmyJa0CGMudo3GloQh9BHXphoTL6qWO/Z88qKp0A65p9WI5uNgUKemR0J6yhbWe
         nq3w==
X-Forwarded-Encrypted: i=1; AKwUvByJdSkUYMN0q7soXrYe5WNmqlicbHfV+E61cserwnbC4Nr7HdnMns4vUwB96GHAlzY/cBRrvqs=@lists.infradead.org
X-Gm-Message-State: AFuF++kM9FIvaaU33u/rrMzqIeOOLWmL3AjfRUn7OSPv6QHTgg/nKOYB
	PKJUUZv9IOATKc6kiP04x3s95k7kfdeDtdmUuOKmSJ81mOYUUYcpAYzGfZpTxOkAjk/+44GeaJ1
	Ac/vy+IICgGlVebT8eIwnviyo8XdcrMAKFF/5dMvHc0npkZByQXj2gTCGsLyE9qh0
X-Gm-Gg: AYBFou0qXa2o/fsMLpyOP8DUiXH4cmldNYbqqJ9+bNmN9bFGEWoKKpSGCP0XUsfPvYO
	YlmVvSPrs0xLu4Bc0Rj81eBRnafysq0cjE5bMaN13JtkTutnwD4+Kq/FuVVk23mO55jVxHcmble
	2200PC+4n5LmFv43+jhE8Mh+55si8l3AXiqB6ssoiSA85UP+OUBSAWc+SdQ7nPLT/IOgH/CNRYW
	P7XZEL+MK0lKKbavxpYfk2xNKXAxHx9EkkU4X58rBak/5BVX5th0lJ0LqPjXw53JbV5aQocdXwq
	Nal9Kf3dPRcQta3NmRpZjs6Y1iN9t9Xss7uCcbGg2p7cjKr+c0Xb1kj+jvWdkdliEG+h2CchmBV
	YzRAHrId4joWPlTCqwLt3ayXTiJtLQbTkwTzF6Bm15RsM78M=
X-Received: by 2002:a17:90a:fc4c:b0:39e:6c6a:4b65 with SMTP id 98e67ed59e1d1-3a073240acbmr919719a91.47.1790074937956;
        Tue, 22 Sep 2026 04:02:17 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4c:b0:39e:6c6a:4b65 with SMTP id 98e67ed59e1d1-3a073240acbmr919631a91.47.1790074936903;
        Tue, 22 Sep 2026 04:02:16 -0700 (PDT)
Received: from [10.152.209.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f294d894sm7775851c88.2.2026.09.22.04.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:02:15 -0700 (PDT)
Message-ID: <3f31a185-b7ba-4ae4-a3c3-874bac0d66b3@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:32:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] wifi: ath11k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xiQVEEreUhPC8QL4_DPzDt2TT8c5Vyct
X-Proofpoint-GUID: xiQVEEreUhPC8QL4_DPzDt2TT8c5Vyct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1OSBTYWx0ZWRfX80lUyvJPvmmo
 RyXlcX+cE8jJlaRw1LwsbULvZ+ESr6nbHeGwD4lcw5zjnKpnuq0t2IVpk1CEaAHU8ZxLPhF3Hqw
 jd8lA0NToVOWIKSYjJfqORuTiXj2brxk7sUYUZ68hA0e7JR7mRzS7AqiGWR5Uo5jSQUSwwKaMtD
 mNrIDhZ4X6hpj+XvbecE5gZ665O755s1s4drw/xTCtvXvOr6nZ0RmPUjdUn65FEQehqW82bqryL
 i8PiGYQ7ECxcDQ1XIi/Yvd21vngNgP1R9qLJP6dHvFHNE/+ijBRkoy2M1PetUSDVZ0wEEnURvoF
 wjTQ1IQ4wkHViNNTjxrDbhMIcmSyrY3x9PZLKF2VKwyT9gMEQu3fKJ+rxjMWb49Aw5TdovJgc2i
 luzUlQliV3PWETtp1MGaWCzCtXOJpg6C7Ww1EnN7Zsf2PNQKeAkChOUd6j2u9ecgZhPDbYp53sf
 eZj3e79erNhnJVhYx3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1OSBTYWx0ZWRfX3/gY1jZChu5o
 h1k5JC5LvYjPozY19z/I04Zd2mXYSc3pYlwOrTNfn8AHeoaGSxUVR5PP8KkAh51mLK9Lt+7THJn
 sgke4Yl1pF6MhnO4at5FmlhtX/8sgyQ=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab2603a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uJV0Co7Z9vYWId34oq4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_040219_807893_8E63E2A7 
X-CRM114-Status: GOOD (  25.90  )
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



On 9/21/2026 4:53 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath11k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath11k/hif.h |  9 +++++++++
>   drivers/net/wireless/ath/ath11k/pci.c |  9 +++++++++
>   drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
> index 017fed1b4bd1..0da9025c7ed8 100644
> --- a/drivers/net/wireless/ath/ath11k/hif.h
> +++ b/drivers/net/wireless/ath/ath11k/hif.h
> @@ -32,6 +32,7 @@ struct ath11k_hif_ops {
>   	void (*ce_irq_disable)(struct ath11k_base *ab);
>   	void (*get_ce_msi_idx)(struct ath11k_base *ab, u32 ce_id, u32 *msi_idx);
>   	void (*coredump_download)(struct ath11k_base *ab);
> +	int (*get_qrtr_node_id)(struct ath11k_base *ab);
>   };
>   
>   static inline void ath11k_hif_ce_irq_enable(struct ath11k_base *ab)
> @@ -159,4 +160,12 @@ static inline void ath11k_hif_coredump_download(struct ath11k_base *ab)
>   		ab->hif.ops->coredump_download(ab);
>   }
>   
> +static inline int ath11k_hif_get_qrtr_node_id(struct ath11k_base *ab)
> +{
> +	if (!ab->hif.ops->get_qrtr_node_id)
> +		return 0;
> +
> +	return ab->hif.ops->get_qrtr_node_id(ab);
> +}
> +
>   #endif /* _HIF_H_ */
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index a163168f3617..4d327b5cc98a 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -10,6 +10,7 @@
>   #include <linux/of.h>
>   #include <linux/time.h>
>   #include <linux/vmalloc.h>
> +#include <net/qrtr.h>
>   
>   #include "pci.h"
>   #include "core.h"
> @@ -900,6 +901,13 @@ static int ath11k_pci_start(struct ath11k_base *ab)
>   	return 0;
>   }
>   
> +static int ath11k_pci_get_qrtr_node_id(struct ath11k_base *ab)
> +{
> +	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
> +
> +	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);

nit: since qrtr_host_node_id() returns node_id in unsigned int,
may be maintain that in the return type of the callers as well.
Mostly harmless as it is unlikely that node_id is allocated with
an extremely high id. Either way is fine with me. Same applicable
for ath12k patch as well.


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

