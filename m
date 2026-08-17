Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507B2C5B572
	for <ath11k@archiver.kernel.org>; Mon, 17 Aug 2026 02:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHSyTy7+lPt7jM9CyTGB+K/hqE93UVBEgfoJwKdc0GE=; b=dA5nfSaNPIuIdhiZkWCfIHQi+n
	nwxM83f9XMfNbGP5OTkR2ItQk2gRDmrADWFf4GFMOSYQMAZXmFM3eoAIA6yUZKKv9Kw8qP2tr36OE
	ZfTgNAH6VVoIRo1I2vznXIB1yDMLKVLmuquNSwAYz0wKyU4ORtHUTaVMJFm/aJcfD78zfZ3uvdER9
	4HFQCDmNlfIOcYicNFqz+S/C1MwoA8JLVicQ6UcYMGePop+8ZaZRtw58+dibZNjG2B6w54zpqUDwx
	FBjQMLrkjacldUngtBW5xU9j8q4ZbPZuNZchO/Vjz8CzkQUXSwK4iWwbVZkMSatv5AmQ9Xyow9QuM
	IxNNlAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvmso-00000005Ih2-2f1d;
	Mon, 17 Aug 2026 02:15:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvmsl-00000005IgR-43FT
	for ath11k@lists.infradead.org;
	Mon, 17 Aug 2026 02:15:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCgJm4126914
	for <ath11k@lists.infradead.org>; Mon, 17 Aug 2026 02:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHSyTy7+lPt7jM9CyTGB+K/hqE93UVBEgfoJwKdc0GE=; b=HbP/v6/Qsng61Ycb
	W4E+U53Bz8Bg06MKtXezb4OwLOVOLi74eqijtmyGQyxLSuessgF0szzUewdO1jW2
	l1SDOsqOey0+6/4xK0wjj56JcTD30Aj3ZkxJs508aWtrsxYhmpv9w5p4bj8dEhQ0
	H5XSUE26MnnzDIkyGbOgP4U2LU/zkHPk5E1AsXCk5Ma4//qow0FUQrcRQI77wguW
	j5OTaAK2UzJagR1M8tO6GAmElWRrNY39mYS4zMnizf2KsH639GBea5EsNT9nl+Zl
	NugdhQg6Ipa1+MWPRdHyLLv+WY6qw03WCLdt21t3Nh8NKKNRAWPIMi69i9GnsXlF
	54MmIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g322qafr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 17 Aug 2026 02:15:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso3264596a91.2
        for <ath11k@lists.infradead.org>; Sun, 16 Aug 2026 19:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786932921; x=1787537721; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHSyTy7+lPt7jM9CyTGB+K/hqE93UVBEgfoJwKdc0GE=;
        b=dOERWR43Xz23MMh9CQOpuoltOArCw8w4LBQPvHjNb/Zsn4PCbp8Z7LWywn/wyoCkbd
         lKJ/C+6CLdbaTdWXa/hBZCmRf2hQW9Ua8NZoX5fXMNo+IZVqoMBsDEV4mmyybV/kysTS
         ihWPAHZBXJPJ6RDCNT5wMxtIQF4dno6imbuKnYrBIhmlvlEwvDRXSMQJ7Oxi0ZRXWOQJ
         qc1sBzdKJvAh0ph6MxRc/EfcmbPvoGQ9DhsQeDAuwvnskA7wi3meANOsIpq9o9hBnfsc
         LPxPgLq0/uEkC07ufk9KNvUk27/O4i5wYmK5i3VE41znX/oKmiLQuV5ns6ytHxDDgXxe
         3Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786932921; x=1787537721;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHSyTy7+lPt7jM9CyTGB+K/hqE93UVBEgfoJwKdc0GE=;
        b=dNdGSsfpA+qv6xGB1F2I5sKw+6KeZVBxWr6omVV50QbpTu+Fj7Sh3BHxUVGkzDjElG
         g40SFAnZKIfu5+D83wOKX0Vf3ICbjg7WkAJJLTmpgVSC7Wf8hSWvyPxPQ074InBwV/2m
         ETqfiKMeeCuNGFTilcgDwL+TttvqHXJLaJeEhmyewjU4ITUnszftImdb9kfQAvb7fkYx
         juNk8FtwXjF4/fYqR4JQ7jCdC/o1rGuTHETfdvPBSfj7lq/VZwFK7PnpdLrjG2f6PCjF
         1p8JIUVd3oCQPiYZ9pf2r16OJ5ejZfcjKwfA41XaM38maSc1UTAFluGceuhXQaL/UDx9
         Rufw==
X-Forwarded-Encrypted: i=1; AHgh+RrekMxA4Ch3MMikgM82K+EzKJLgsnJzaS6CJp9ueXd2/vSSpnEaRYz9FJyOVPZbmhk+M5T2zS0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxILoBja6p9WiSUdI0O6HKyfktwGN00DcZ/u0R/UBBXMv/9VeJ1
	D5K/5Cfz8sn06Coi9udec8Zk4noxg9adS5FOMMaz8bAJNZwzSayDuFAgeks4YXlbcfjJeTsJ438
	2nnYw7Wdj8Ur7zTBjaDBvtDOsRxYQCnSR9rpd5vOsx1tF6r06CaDmAQiv32K7oiZZCVwmUGzE
X-Gm-Gg: AR+sD12NdQiXqO7ZH1qEazgQ3CVWwLTsin0uVWlFmp1qSAtJ3f4rJTGybaV1f2XDJPo
	FI/W+B+335otm7kj2qzcGdsHmRVYfUcTGBSVws3dwJIW+JRyzNPFzJKQ7MANISkRUYe/kgbSFrx
	O6HpGY78WkzpL1DDqBTEs4XFadQl2saZY68ScmY8EQoX0P0rPfwbi8UXNDL/1cqnnCRDOSmTC/n
	uUCduhcuFSa93r8JmB8nDVVKsjEWStIy/iRxw/TEaSJvgruwcugCL4GbrSzTORmbO7W82GB8kxm
	TfhGvt2bJ6OBF/627BaLtuoakY3bzoOb3bJ4fCzQW9Si2P+7JS3Bf1mfM1YSL2eG1+rZ0r8Jrv5
	nqgdysE6V5zIPPtpugpGvbIGYaGkdui1lG2O1ecDU0w0tk4JB/cA6nn+Dh5fpeYHAbL5wluUAwg
	==
X-Received: by 2002:a17:90b:4a8c:b0:381:bc4c:da56 with SMTP id 98e67ed59e1d1-3933b95158dmr20932985a91.19.1786932921429;
        Sun, 16 Aug 2026 19:15:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8c:b0:381:bc4c:da56 with SMTP id 98e67ed59e1d1-3933b95158dmr20932952a91.19.1786932920895;
        Sun, 16 Aug 2026 19:15:20 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e3184bsm2961046a91.1.2026.08.16.19.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 19:15:20 -0700 (PDT)
Message-ID: <1366848e-ed50-4584-a056-054459b75bed@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:15:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: fix locking problem in
 ath11k_dp_rx_tid_del_func()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260813-ath11k-locking-v2-1-f4113a0bd0f4@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813-ath11k-locking-v2-1-f4113a0bd0f4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAxNSBTYWx0ZWRfX8VZlTom54eIr
 CtUujFQq+zHcF5J02b7wko6wjkYEQnuVLhITiRMfI1pw3BzR54T4D9ptp/rfOihYOinpnbrgabq
 so3zn2zbyJBKnJmZKC+bnLaJ3zUEpzs=
X-Proofpoint-GUID: A3mWHLyVVVVzhMujYextnY2B67Nv2d0I
X-Authority-Analysis: v=2.4 cv=C5PZDwP+ c=1 sm=1 tr=0 ts=6a826eba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=27b5MfB6VpTch7MquCMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAxNSBTYWx0ZWRfXzz2yTzqLBRYo
 M10ICl9vydJSyGkd0J3m8i5eMHP2HtwFi47J7/CDyLgQbf6hxHdDTr+2uaVD/Z6cXElWhTY5DRB
 g1HP+mldd5cXIYY0dozOwx338ZqtnF1qIBEVyA0/qiHhaP1aO1rn0/BCED1T7hI2YL1zl22mibp
 3zpGNTuBNOqTnmfxfAp+ruFuLOYbVTyYPnlZKScx3fv7frvY2L26fR+DbnE0Qatu8TMi7B054yS
 RTScpWe2/68NmjiAybrY4aj8+rzqjoPLjpq2CZwWnivP36KpHSZskfBhu6+H9/fZtB9FQvI2a5f
 1Oe5tcrM3+EA26bpdS20ODq8Mw44snXUgeiA2FmQT6tdlEyMXgHCs0uu3US0qFHQrWbNdMwpzKi
 Cmd9f0Oy3I0T+i5e061vGNexH5EtLNvJn5pqdCBTZbuvE6uqR60h6iKCW4Sh5MJsjRRUU1rwJvl
 sGO5zTqweQmiyBx3/bw==
X-Proofpoint-ORIG-GUID: A3mWHLyVVVVzhMujYextnY2B67Nv2d0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_191524_025644_774B7280 
X-CRM114-Status: GOOD (  14.28  )
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



On 8/13/2026 8:15 PM, Nicolas Escande wrote:
> In this function, we iterate over dp->reo_cmd_cache_flush_list using
> list_for_each_entry_safe(), under dp->reo_cmd_lock for concurrent access,
> and for each expired entries we :
>   - drop the lock
>   - call ath11k_dp_reo_cache_flush()
>   - kfree() the entry
>   - retake the lock to keep on iterating
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
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

