Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1845C83F27
	for <ath11k@archiver.kernel.org>; Tue, 22 Jul 2025 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1CPlPbwtTVjIc8HWeOwVxWexCvpUqlAqvq7jTFTfSM=; b=jn1xXOaVF4ohaH3KVGbFNBpVF3
	uHu75NKuoBtdyH+MVqt3CRVgbOiK3clZiHDINejPt3W10w+5P18ZO0dzpAyFaiQ0UTppWb0i40kSW
	xdNlz9bjhea1OJrcteE3FvwDu90SEKqkc4vm60QR4eDfUjiLAdrtTZwcfwxFSnU1kNqyGmLxHlbXY
	gyvY2q2qTE9nsAHJiPp24wdbNJNM1cDOCA8M5YIGeWIUzQP6O1EsmEjpyI830N62llfJ5a9ljFjnn
	dlgrdgzYd5tj8QhVz9JEULOlU7/ZV1CE7Woa9QuATmz2R1xVbYD1IB2wkn9KaxpS62UhlxRH8+/sp
	gejZArjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8VO-00000001r1N-0Lkq;
	Tue, 22 Jul 2025 08:37:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8Tb-00000001qlH-33ti
	for ath11k@lists.infradead.org;
	Tue, 22 Jul 2025 08:35:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7GIf5003943
	for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 08:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1CPlPbwtTVjIc8HWeOwVxWexCvpUqlAqvq7jTFTfSM=; b=Q1lI7noRzvDFvPCU
	3M4pyUqyo1Z5L85dZNCwP2tRgZ6Ll7/0wsZObSzkJRJkYfPx8ot0nWCk5nZelo4p
	DjqwhWvqJPJGTxgy9USzzfvGnZh6HVCnvXJODTdwJy04RlOINBsym3ih2itgH/AT
	r8+1CTwFQkyV8GY8zDRNr+fF2jQt9u9qkXHGMaj4dp4EkJ7b8ewo9DhIvhuq640a
	P3cLJuTnmWC6BsEbfU2zGEfhmyFQGCZYc8Wrf9xe71fiBc0ezq31KnLIH/f2gMl6
	HXRy68e9hiGcHKXXWkCVBh38jy28J4dX6MXv+OO9o36TiZHWDqR999IcXvbr9rQ+
	amBX9g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v72rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 08:35:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3ba7659210so3858234a12.2
        for <ath11k@lists.infradead.org>; Tue, 22 Jul 2025 01:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753173353; x=1753778153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1CPlPbwtTVjIc8HWeOwVxWexCvpUqlAqvq7jTFTfSM=;
        b=J+6UupYeMxshIBiMhJebEC/+FBTumfdo+x05XPkLVoHeBiMzidLq2hVxrOPiIw8YpA
         sHFIWHEkVYD2PV0CMSbTBcVc36bQ8xYwm1Hawtbs3g9HFF1MOa/MVgTWCS3SzYsVkzp9
         pbpDtANE/rxLExIanvgKPt+FI28g92lq8wAiYKW9oda52XUOMHZrYzVlVt/4kndGavK9
         KSXBf0WSE2XhypM3Edlh9hULCLS0z8eXN39FF8Oivq46KOCORoZhyAUbW50ZhzRGijvN
         FeuQniBca745iibCiDX5Z1cnrWZfIriK9qj7th+AHxVahM/FRGcF+FHILR+5bl1yxp2z
         NgIQ==
X-Gm-Message-State: AOJu0Yx3fQ85VvxdOIfi/1e491f8rC7wlEHkNHmKD0gZwxGQVEPvrD0J
	JFqkrue+/+P2uE6K4vrJBE/yZMnwUSE//GJaOYjCoZX1oOAQIRofecVD8lr8NhzzmVKnKNuxHz9
	iXC1uNZYCW+IDBtRqotZ6n7UOtvLgRode8mzFas4udSATkExTCORhy3nx/OrsJpZj
X-Gm-Gg: ASbGncuqLgSz4/YB3lugScdKP0Gw5VLDuT0HVO0127shWEGi0pgcuCBH93q45y7tPxj
	zkvn6xOHtPS6OO5Y+QsOIuCPvb/7NC7ffslb/0Eq2tenUdWlX1AKfmj1MrclzmX1zl4RAI3Py/W
	+rL/vWLb2ZugmO3ym4Qi+1TOdyH3QyJX+k5pGsQp6VyQ8dboySJ0zp/tyJrcI2vKG8GKyGibhz2
	Miy7M9KsbtACXXyKjMldr7rGQcVzIZ2cYbkL9rK/S2RU3y3SjC4OtyMYKb82Yrmr8BJtRWmmrTE
	R64Ipz53t8qdA55w4km+w0ncRlQ47maabTskR37qUVbUgQHh37lUrUaGXCYQKjHJZplDZ63G6Eb
	XYmm0BQKi9ixaeZegq3LgFLZjY7wz0s8=
X-Received: by 2002:a05:6a20:2588:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23814269fa7mr47543360637.31.1753173352912;
        Tue, 22 Jul 2025 01:35:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxQoVSL6iDytp5HaUmhxPmpFMPPetP7b0Xmv7yoM9vlNb9LHyBBh/GNPcPF++PFFEUqYTYnw==
X-Received: by 2002:a05:6a20:2588:b0:220:1ca5:957c with SMTP id adf61e73a8af0-23814269fa7mr47543312637.31.1753173352439;
        Tue, 22 Jul 2025 01:35:52 -0700 (PDT)
Received: from [10.133.33.45] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbd66eecsm7175486b3a.142.2025.07.22.01.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 01:35:52 -0700 (PDT)
Message-ID: <0b28bb5f-56b3-4be6-b4f4-89ca546a24d0@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:35:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k_pci: add a soft dependency on qrtr-mhi
To: Christoph Hellwig <hch@lst.de>, kvalo@kernel.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
References: <20221202130600.883174-1-hch@lst.de>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20221202130600.883174-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P7nxXM3QYzEDIHmKWbk5Mgn4KQJLQD5c
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f4d69 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=dBPL878wbgeN_2oxvkwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2OSBTYWx0ZWRfX02dA1qpviJft
 6B0eu4b3SWqSM/orzsAtuDuDpUgBjcngbS/NvuB4dut71d7nj/Xcbrcb7qWlcXd3KrmqINQmlZW
 ZZs77TU33xFUbUO1dTMWsCMT3dZb+3gK2GXy0vKC2BGXGXfOVsX2DQyvuOeaqlaNNqnaawfVSJ8
 bvt1nu4G2n7jdiFArsJpR/m+sGJHYnv30S0q+DaN+qnzpMvKI+PKQkOoYt18qPGFRiFUoXnfFkw
 c/4RAZl4PX0+z3uqG7u6MqlyzBwYK4dZNUAfygH9nLnRwoQvF1+nFAEXDsLG1AjH99BWfKJH2io
 Xhwsx5dGVswrECTWpIe7i4qJAsDbqTdVq/+MtxGWxCX34Wz9sk3gCOIxoZD5OVqMspN7Z+A4KFu
 sAt2aTO+mc9sn203pKkUAB4fT40h4AF87jcGts4ZSjMhPv6+agtPAzQkzqbWTPR3GeG+8wU7
X-Proofpoint-ORIG-GUID: P7nxXM3QYzEDIHmKWbk5Mgn4KQJLQD5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_013555_811556_EB35EA1A 
X-CRM114-Status: GOOD (  18.57  )
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



On 12/2/2022 9:06 PM, Christoph Hellwig wrote:
> While ath11k_pci can load without qrtr-mhi, probing the actual hardware
> will fail when qrtr and qrtr-mhi aren't loaded with
> 
>    failed to initialize qmi handle: -517
> 
> Add a MODULE_SOFTDEP statement to bring the module in (and as a hint
> for kernel packaging) for those cases where it isn't autoloaded already
> for some reason.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/net/wireless/ath/ath11k/pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index 99cf3357c66e16..9d58856cbf8a94 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -1037,6 +1037,8 @@ module_exit(ath11k_pci_exit);
>  MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11ax WLAN PCIe devices");
>  MODULE_LICENSE("Dual BSD/GPL");
>  
> +MODULE_SOFTDEP("pre: qrtr-mhi");
> +
>  /* QCA639x 2.0 firmware files */
>  MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_BOARD_API2_FILE);
>  MODULE_FIRMWARE(ATH11K_FW_DIR "/QCA6390/hw2.0/" ATH11K_AMSS_FILE);

Do we know why this patch is rejected?


