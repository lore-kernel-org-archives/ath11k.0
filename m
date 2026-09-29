Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9175BCA5FB1
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=; b=kJxwunnowILyWR5obZRHSZ97Fl
	qY7YvmPaBx4ncnButFN58wcSMvznPvXZR83a6CN/wwAdPAPDZcA+jQMUIMTH4fCMK/4TNhS9FjEbb
	RT2//cMW1imB6pix4G+H0XkxLlULgCDTAObPLnRUArj/WwEwkyiJKZuxY0XFVmlqUDAhB93Bduty+
	pycgVBSZKc6rHK/bYXrRo68RE2Jh4ej/sAYsEwq+jLUqtyuUQDvpCtvIXdKsdUlO/S2HK0ByjwtMS
	okJvekQ77f8j4c8MfNSgiUHPsuYKzsZ0CcNktfU2Apf6LgzR6oCJKRfsWkau/8JR6QPbCaA9u4ZSl
	BBMEBDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBay9-0000000465V-1v1C;
	Tue, 29 Sep 2026 16:46:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBay6-0000000464e-2DVz
	for ath11k@lists.infradead.org;
	Tue, 29 Sep 2026 16:46:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFUd3a708398
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 16:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=; b=dEBN0i2tek0zDky6
	2xI8SRkTy6muUz4dBIrz5fe7jg4NsDeBcPu1fmFwmFPism/3Mve1tUgchm9vVWiy
	rbGvcFEEKFcZj7H+hBGqfrNwUVs0WLk17xz4pfc/afWR25wAD6QjogN1PTTGx4zw
	qeD7XSMnBp328oah9kwACp33yA6E075kQbHQPfJlHPBLA5JD9V2yTLZ/+QlDGCCv
	g1GygBe2FclhSsPSm7KcP6DP/Yy584l0vcAVGOXzvdreTAF7Eado4xpA9w+2QJXH
	/m8beGrThSCMXvlWsajxYKXc2ig1azBaBspMBFo7EgC+CbiLC61r5+ZhMM1aQtjs
	yc1JSw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0g1krbv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 16:46:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso4045837a91.0
        for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790700372; x=1791305172; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=;
        b=hMmUpasRy0WNN4CWbTB2Ln5I1+LxWw4nlh5IDCfkPlO0BMHS0MEplBI6/BjgIVOmpE
         RQMFIZtgR86XqxVrK7VJf2dSJjqJWRfo58SAnoWvPv3cmgL7lyLT+DDRWpop8+umypOL
         Sa9bEo32gvfBQb4fG2yA49reIGE0ikgIIdkeiKUA5muOZy5l9dyWIG8tighqKASGnTza
         twKAnwCvfu3TMuWOpOFz20BRmwJjQEgf7XIdy8ox8pTSeAmXxCsOTQ4a//voFNIe2F9w
         kYyXw4ygN+4F5VY0N7U+220X/rL1EWgVpbxZbF4/KfnBAwfEZKW6OANDFrUZ3T9vDPn1
         QgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700372; x=1791305172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=;
        b=qZnuvvU+m4rWcvI143x6Fuh6aZLBD1yFCOAs7ZkxzzdwkjlrJj4LRLKy68MgcH3EKk
         ev0pbLfKHiW3BOcAyBwnlTW+m5I2TFFbCRtYP+VibIB02RnIFrLfybXh78avMhlRhdkK
         WBsDOMiTEU9aEYCXxa6Z0TJJMrhfjvufgh43/uvp/S1vfFWllyCykUfxE4JPlYt0UppJ
         JKhjxwjOcXn6e6w8u5//WFTVqgBh2endvjUddc8w8wSIwALu4wXLG3eTHogX3o7+m3oF
         aMJB2aZ2Z8+y0cRmakonIDDIUkTddYAteWY9NOrXxCDs4DrDdwWajdQiyWw6mLd8/yKU
         fyow==
X-Forwarded-Encrypted: i=1; AKwUvBzpra+nDxSv6nEFXbJmXRnXvU2hWHJMzeqjDpbue14wPN3y+QowYTJGkkLmCRuaHerziyFD0PY=@lists.infradead.org
X-Gm-Message-State: AFq9FYLLoGiv4VbJSofBVijo2rrbBWQe1bsWCYhh88LP1ftsbcy/jBDV
	OVwTc6N2dRn1yMm9BQh7p24Vrc0qVDXTvMRgT32qs2xU7xqj/XycORhaBVVWkuqzOknpfLDlv4B
	gKaQU01FOvUE9ddpjMNDLyDJ0fhN9HWcDdyzW1/y5co4rZvqjBRLBrBlb9Bk9ZgV/
X-Gm-Gg: AYBFou2fliTyhj71QfjCC4fbug6lTFVi8FxnvrwY8zjvDCq33KHDbOYATeSPt4r8wMR
	NVKbRYlWBkjkki1g0w4JtZalZoRhkQ7rzVgLhOKlub6ocqK5w0DPO3MjKzEdHYizhDMvbkn+d8O
	sgmhIfkxwM+sQwnQd8/N9W5RuiSzY9jw4BluWTKE56078B/zk1YY/7X3xIJ/e8eSPO6dN4MeWcc
	ufRBx08eZzkm3hwyvvb+HndcMn1rXc+sdAsvZ1To3LIuHux74EnvIYEMrezLeLQgMSi+BsveX6X
	n2PGY/KQBNeKnOfDbiaQxcQ16IvbUyRrsFoo/x4ytlf8gGDkPHWoffuCx0FTIgcK4De70dyskng
	kpaiJO5pcLgdqQUVK
X-Received: by 2002:a17:90b:384d:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-3a0986eb55amr14369936a91.2.1790700372111;
        Tue, 29 Sep 2026 09:46:12 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-3a0986eb55amr14369900a91.2.1790700371572;
        Tue, 29 Sep 2026 09:46:11 -0700 (PDT)
Received: from [10.216.29.115] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858bf27sm6367683a91.4.2026.09.29.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:46:10 -0700 (PDT)
Message-ID: <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 22:15:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
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
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
Content-Language: en-US
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o1d0RoWTuyiHF93pBYhlyHoimZEwGLbj
X-Proofpoint-ORIG-GUID: o1d0RoWTuyiHF93pBYhlyHoimZEwGLbj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX5SYsrmPPplEu
 8kbNBGvYNwnUtIcMjUBwl1OPR9jYb/BfyRHQLfLSPQ06QKop4jJIXyIeMajIfI5koPOcT+K75eX
 QIwYFmQVtJgpk3u+IYmgadH37Gk8HSs=
X-Authority-Analysis: v=2.4 cv=Ysia1IYX c=1 sm=1 tr=0 ts=6abbeb55 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4CdhTua64AM6UaT4niYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX5nnc8yKw8ScO
 sIJSMEqLxvh45B7XG9rb4aTsqPxgRs4kxfYZWija0rDlRu/JnCmB5Pbu9cUA3f7kWJQShpiJd78
 jItdCxMKHZWQxyQTz4pE4LeWhK6yNjpB1Sfm/lQUumQafwih6j7skAcQHVqOMfP2ADfs+QOzBWk
 oXTkfZHh8UMpTvvVW7WOxF5xkjqzXBiPUsQtJHFpBCDPKUT1ArTooWUZrxPQ7Ksvy+XcnlyDaY8
 FtaZ7WLekV7ANNBZ8nVZEKBv++ZOBUsOhSzJj6BYppYLRgTH8fli7G95ed6CGfROLl6huKSWiUv
 5qSG95gUGnFKPQPDG0lo/Olw/FWRlP/OsUzJ+Bws5kYxJZeGKeJAds+VOK2JSj7E7PIKBJx9QGq
 PajTRiYUPUS2281s3ZzYeCezau8HfnrVb+1tWBL9aR/Rp8zv+YXX6ufH9YHRb51Uz/ITG31hhk2
 3gLo57oaLt+UwX7hNsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_094614_677878_DAC3EBC6 
X-CRM114-Status: GOOD (  28.86  )
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


On 9/22/2026 7:11 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Now that the QRTR driver allows using the unique node id for each device,
> which is different from the node id received from the remote node, compute
> a unique node id using a new API, qrtr_host_node_id().
>
> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE,
> whose value is outside of the node id range used by the remote nodes (0 to
> 0xffff).
>
> Finally, call the new API from MHI endpoint driver by passing the MHI
> controller index as the parameter. The MHI controller index is unique for
> each controller, thereby for each MHI endpoint device.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   MAINTAINERS        |  1 +
>   include/net/qrtr.h | 21 +++++++++++++++++++++
>   net/qrtr/mhi.c     |  4 +++-
>   3 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df8ab9b82402..9c8bb086be28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22511,6 +22511,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
>   M:	Manivannan Sadhasivam <mani@kernel.org>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
> +F:	include/net/qrtr.h
>   F:	include/trace/events/qrtr.h
>   F:	include/uapi/linux/qrtr.h
>   F:	net/qrtr/
> diff --git a/include/net/qrtr.h b/include/net/qrtr.h
> new file mode 100644
> index 000000000000..745d51b4a6ba
> --- /dev/null
> +++ b/include/net/qrtr.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _NET_QRTR_H
> +#define _NET_QRTR_H
> +
> +#include <linux/types.h>
> +
> +/* The offset is chosen carefully to not collide with the node ids allocated by
> + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
> + */
> +#define QRTR_NODE_HOST_BASE 0x10000u

Can it be exposed with include/uapi/linux/qrtr.h also. There are user space clients like modem manager
which need to calculate modified node id to distinguish same service from multi modem over mhi.
This is same as wlan use case.

- Deepak

> +
> +/* Compute host node id from a per-device index. The index must be unique
> + * among the host assigned endpoints and smaller than QRTR_NODE_HOST_BASE.
> + */
> +static inline unsigned int qrtr_host_node_id(unsigned int index)
> +{
> +	return QRTR_NODE_HOST_BASE + index;
> +}
> +
> +#endif /* _NET_QRTR_H */
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 3990da1a65dc..c920ab61f848 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -6,6 +6,7 @@
>   #include <linux/mhi.h>
>   #include <linux/module.h>
>   #include <linux/skbuff.h>
> +#include <net/qrtr.h>
>   #include <net/sock.h>
>   
>   #include "qrtr.h"
> @@ -127,7 +128,8 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>   	if (rc)
>   		return rc;
>   
> -	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> +	rc = qrtr_endpoint_register(&qdev->ep,
> +				    qrtr_host_node_id(mhi_dev->mhi_cntrl->index));
>   	if (rc)
>   		goto err_unprepare;
>   
>

