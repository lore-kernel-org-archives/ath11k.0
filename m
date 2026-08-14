Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACDDC5CFC1
	for <ath11k@archiver.kernel.org>; Fri, 14 Aug 2026 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZPQOGeETtND76wXlTALy1Tl7jMtH10MFsj5iXkLt3c=; b=F8qIXdOKrOcga6PlMcNH+CXPza
	Ih8Ke1u91QdnmbZgatw+sQUG3pCrcQjAxy/ozHlNYi4DVrzOA5GQ/GQVW22luDtUHh02avYoYGHI5
	GQGttz7plbrKbUmsnw5qwJZ28I/LalgIWWfymx+ofXdTxKf6BwHyhCLcsVdyxXYq9+7G2d/ZEQxye
	JRvzXrZElMlCV3TN8c0sd/Lf9LhMFx9/ENsl5RfFsCEeW9Bx7bQfp24lvk1b927at7b41jea66pAW
	01cNj4Scvcen/o3Suq+ZJJgbh5Ti4RBSXr91r8rCdIoryeJLR5OEv4dctoE3MjgfE7RbRwf7MGj8o
	8myOxFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusyz-00000002nd2-43KH;
	Fri, 14 Aug 2026 14:34:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusyx-00000002nch-3FBA
	for ath11k@lists.infradead.org;
	Fri, 14 Aug 2026 14:34:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDxSKG1564782
	for <ath11k@lists.infradead.org>; Fri, 14 Aug 2026 14:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZPQOGeETtND76wXlTALy1Tl7jMtH10MFsj5iXkLt3c=; b=TocuYtvGkRg2kZyd
	4EkpC8lbdaSB9iK86BZ1IiNUq5ReDiOwdcYgIjI9oGTV0S7nfriO+hiOkmFac/DT
	9NcYxMc0owaafQbF4mAWSUX+LdiGG2Dv4trfykZpMvtEug/TY5G8C/S9gVpX36U/
	9ukvYymxwfHHdv0sxLMD1109vWQJWKUINcrKxiaD6lEp4NVfo4uVdqr2KSn0w9Yf
	dX0uGM36vgOvCyNs4Z5PG0+QBZ7sXGzI/9m/lQvAET+7VX3RvRrUjIQntVpq9b/l
	KWIPhecd42+pW/TfcU0YQW7/1jQnuEd5f4v8d/X9wqvbNgUHBEY73Rbqz0qtIS/8
	vt49cg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f4nn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 14 Aug 2026 14:34:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso1194912a91.0
        for <ath11k@lists.infradead.org>; Fri, 14 Aug 2026 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786718041; x=1787322841; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZPQOGeETtND76wXlTALy1Tl7jMtH10MFsj5iXkLt3c=;
        b=f8Ek8SWJ1loH/O6a4S2hLcsLGhIUtlF/A5x3NAkdsLk23OnWYjzbHLA60tx7rPqpkB
         1JBfcqvZHQPxsmLYmgZKW5nfxOyNhofk4VUzs02hOav7adznMPQz9Tkmuw/fN2YASf39
         99FND0jxYYYh/JPEM0QKzgbWXnBtG237QYeYOvGbN2Ojg1jYX86tgcrZ8rDmzrfwQonH
         5kagn0vQrI4BVj0jnqVI4LhBdwZxScY9SroQKftZ2/9SIwlhGOZSSqPZK+Gm4IBLXx4N
         zM/6NTNaQUoB3Aht+HHtH2SXTigpjGe2Vwn/SwXouadkmkngG4/RufSXEBm1T6C6HwXv
         0xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786718041; x=1787322841;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZPQOGeETtND76wXlTALy1Tl7jMtH10MFsj5iXkLt3c=;
        b=FdZSArLDRHnXBDWNIvDtgaX7Y3f4mrJ9TZN3dTRUrkuvnyNSQ2NNA2+rQLtXD7frDO
         wsqWSpCEuGRPB3/znib4Y6bQzzXV4o74PbqCaPIIClsKCqB3VmCHAKas+aMqV7mGNIKy
         TZ8BZQBFPFW8t0DZK3ufx/bmjfi4IrL7LrVLjDrzXUzshBiuvt2gEDPxttjUZUU2tdd+
         2uXO2LPcektE3I4kJig67uLkJCeo3k+3crqHJDJMJPKNnjHcXgMs3xHXKFNi7zsx0i7X
         7y9C9dToiqi5431uG9a0m+df17YyZJkBL8Qfrh3lYsBfxK1v7IJHOxEm+vtAVPtdoIp3
         jB6g==
X-Forwarded-Encrypted: i=1; AHgh+RrBvffzmq/TPqxHyPXae+2JmZZqcoMlWNp2pdvq66Lx8Mfb7d85hKme3Bi+sE2MV1LK56fJhTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmuzNKZlLCVG85X05pgjtRaH0gxIa793sG7Nc+Dm/kOC8WTjmW
	tKk0McugykAooBg7/t0PUZ1JDiWNnJlSATYUbrxjoPFZ+TqRB+MX9BmLz9CAQRzy6OJoodHnFOq
	BjduRDGLb3tGDxvNDx0pX8hpdoJxEibpsK00PXVkYk5TA1QEdJY5oaOeDw5H5oWNQ
X-Gm-Gg: AR+sD119jsvHD3B6i7dn2eL84Z7mxMBYxb7cZH1DZfjbdMYxYY+nfB4upGVv+mZbhdp
	6CxGT92CVgr4Si0Zqwvul5AqB5SQ+Y4T5VN+eRvC7HrjDMds5sR9G6DcZ/Umzv2pCkCr3983Vjy
	huiLaw1lLWT8sepJfBMYMmSkOJYggU41JViRulDyagAaNKCMcPxCbxLbbOZdaYilVBtP4onZohS
	WFJOnUKbvfQ6UNauiMUEq7TmfqnnU7fQWJXoWtOOw1MEaBFiHF/ofO3OhFMrcgqquQzFVfXb+jF
	LOGpA9rZT0TcjaW9uihfeRhoqZKQVXy8E0ZyrnWc7fLCQJx88OQFZQmHZ5ElowvofKLFuEhprDT
	3X5eL/ZOBxDW8G8Zpk+RKyqoRlzfMGOtTU1u0xXE8qmrz
X-Received: by 2002:a17:90b:2f86:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3933b84973fmr7159675a91.0.1786718040839;
        Fri, 14 Aug 2026 07:34:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2f86:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3933b84973fmr7159583a91.0.1786718040310;
        Fri, 14 Aug 2026 07:34:00 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ead105a9sm4999350eec.31.2026.08.14.07.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 07:33:59 -0700 (PDT)
Message-ID: <37c6a556-42ff-4f9d-9b95-d7f6b273e93b@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 20:03:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: fix locking problem in
 ath11k_dp_rx_tid_del_func()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260813-ath11k-locking-v2-1-f4113a0bd0f4@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813-ath11k-locking-v2-1-f4113a0bd0f4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7f2759 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=27b5MfB6VpTch7MquCMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: GjZ9yFBqK6_fTEtZbQJfTftElsHunJb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExMSBTYWx0ZWRfX9z8BQy191Xi2
 3+gORlCQ5Hd5x8mqYmIR6UeX2hKA1TG4s4sWddo8nEpi96W97thjJq6kJNXwJ2tZ+Xkb3yfSP+J
 FfJKDY2wL8XrNKRWPcVogjGJqB9wsEe4HYNvy4ljWFnjTcszhTEKsg89RHESRKlUlrte6I8BbQb
 ux69qxTx8LUCoWw/7MjUWNzpeG/iOC4+7oL43F/t2EHKt84EcVXMRf3bJV0HcWXy5LtUMjjaMyZ
 eH8KxQT9FfCoRAmNXW6q0jqIO1QlI0NtBS08kpE/XOCT0/zFpZwxq1ATduXkC9bAH2akvfgYWWg
 +jmMgxEv3kJdjOl3Q2x7XRSGah6XvPyrHeq6W2PuXv1O/OjVLwd2V79JHpTBvo+pSApDl1tXc49
 xQzwOhb8SjKVaMKVy6771WT6C47a6R7s5tujwshB3kcpYE8bZoL25k4hRRs8wmj8tRRvX5O0Z1E
 HfYDsfLuT60Dg505y2g==
X-Proofpoint-ORIG-GUID: GjZ9yFBqK6_fTEtZbQJfTftElsHunJb3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExMSBTYWx0ZWRfX+2wsANp8nBsE
 sVAQMONoafbv4WbN61t88MUf9n8x2hQneZDcZQpx/khbcuAngX7TVAitWbykAQCxPqxRQjmsaVX
 rxI/IC+2WzSCv9VlIqOVXMdIbTFHDfY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_073403_824369_9A2D3EAD 
X-CRM114-Status: GOOD (  15.05  )
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

On 8/13/2026 5:45 PM, Nicolas Escande wrote:
> In this function, we iterate over dp->reo_cmd_cache_flush_list using
> list_for_each_entry_safe(), under dp->reo_cmd_lock for concurrent access,
> and for each expired entries we :
>    - drop the lock
>    - call ath11k_dp_reo_cache_flush()
>    - kfree() the entry
>    - retake the lock to keep on iterating
> 
> list_for_each_entry_safe() protects us from deleting the entry during
> iteration but doesn't protect for concurrent access. So another thread can
> take the lock and modify the list in between and crash like below.
> 
> To fix the issue, move all entries that needs to be freed to a local list
> while under the lock and then iterate over the list to free the entries
> without holding the lock.
> 
> 	BUG: Unable to handle kernel paging request at virtual address 00000010ddbeef8c
> 	Call trace:
> 	ath11k_dp_rx_tid_del_func+0x164/0x3c8
> 	ath11k_dp_process_reo_status+0x1d4/0x2fc
> 	ath11k_dp_service_srng+0x334/0x338
> 	ath11k_pcic_ext_grp_napi_poll+0x30/0xc0
> 	__napi_poll+0x34/0x184
> 	napi_threaded_poll+0xb4/0x1d8
> 	kthread+0xdc/0xe0
> 	ret_from_fork+0x10/0x20
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

