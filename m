Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC92BC55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jukmAepEItxoJN8i97/lVV56EabbQ+hdagvD7H46HpA=; b=l2ibAOganyAkt0JsQTrqT7VBmN
	nhZk9rapfGUFWv5oNU/OziXwp6m7rzhACIpARZYrOB1ZuLR/3JWdXVcomnzH9AEiPj/PM4Jr4S2OC
	0ykwDJMeUQE4eQdRmJ21IExW2udKT+Krmc2cscwpWV/i/vIrSMO+Qd/BW5CT5Pb8hhfrKzxJ19gga
	VKEXNXkabn0pbqbbWVQtfSBojHtpmmCajjiEAfz8/gh6cjDcbMWm6mVaYqrvMFtFoRmEmFwiyF5vs
	W/V/NAKF8e3uk/Y9GnQD5s5vScDWuAlntG6lu/eRSD2RnZah1b6ICJzk/dFYyp4Zf9Zq/Q4G7XSkf
	f36IcLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphhl-0000000BxvE-02cf;
	Fri, 31 Jul 2026 07:30:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphhf-0000000BxuY-2T39
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 07:30:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7Mdrl3605276
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 07:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jukmAepEItxoJN8i97/lVV56EabbQ+hdagvD7H46HpA=; b=i0qsr+6NL1EB7Hsy
	/zCmShLgoc3aq6iwEs8yk0f05xuqDds3rsYebsILRNXDIqZLKe004GSvhfnHo4PD
	zKElQ0MoQnWSkA7YTW6lXeXzsPekQJbLEanFL64L/Kz3FwBgP0gpIAifs7xJF7/Q
	H7tKFKQbROGft1mZ+YKKIPXfUbCbigb1O1W595B2lgnmA37w+V6b6e9EKQGl/Wf5
	sx8JEyDYMtttqSc/UMdY2I2Z4D8p6hpIdfLGcZ3IvYYAvT/Sj3GLQ8OpUfUXOekQ
	fvsaB0lTY6EzTFtcB0M8jFvunGg5gJpCA/LM/VUM2zYpATpxeUwU+jOHxmmYRR3D
	T/BphA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frq8vr134-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 07:30:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso8724075ad.0
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 00:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785483040; x=1786087840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jukmAepEItxoJN8i97/lVV56EabbQ+hdagvD7H46HpA=;
        b=F6UIDy8I7tIqoTRcpCW5uqXgUq42jp+plFJCchUE85PYu6OQ7NrJnOLKiIExHS9eRi
         +AVclhJJ/i82eIZWqsWhAkH/6B+431lMBf95FlHAKVtNZgdCtGnd4/kARtKohEkKKRbH
         KSFGLJIWPPEUQslm+zJ+x7u/Fw0/BHRyo9WXJF78ejqahnWtSOGfSSR6rBdTfKSSOnLp
         1lYyBIq+XvhmFgTVueRAibNu+k5VsTaofPtM7LfvGdfobm22n0soYzNktzhJAO9PUDaq
         CVk5mnDoBwmAIJ0Z4mtuC0DiMZ2CQbQhOKLHAICFPjWD2I4AWwFb0+kDj66Lwx3Tfe1N
         AnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483040; x=1786087840;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jukmAepEItxoJN8i97/lVV56EabbQ+hdagvD7H46HpA=;
        b=jjx8UydRLcIVj+JJyVGal7/hqwrufiiJwQrSdIejwHpotm4vGMcGgEVcftRZ0LA5Ci
         uUwwiVmWcSb8oKAcDbgpD95h9c8uycW8+dBfCjPSV5Db5b/UWNi1TEEr4wNI6l+DOwoZ
         J/GSor8N+fBgds/ENaCUI7x5DIO+Y3JGdUZ9iHTGYJomdLofPHzka9tdWqafL210yGWD
         zI12tmMGqMD45tfo1ZpNgC5JVEL9j9aMXNEWOtpnqhKMDgDW4Y0fivHl6C485oGBasBC
         2XeZsxsp7fZCVLFd9jDZWgUUiDVlabdbg0mjF/fpTKR9mmz4plHmVQzJx15bvJtABdt2
         uVSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFRKMnudg1n9wD9gpC6e/fszcpmdbm5bOxde6kezFWTXQoy3EiZ+jRx0rq9OmoliJAQb0z1HI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgxidocY/K3Eu48xXfefYvMshH2cRVkBQH3gaWbJGgN13pMvvy
	bTXW68MuG0G25O7RTFoY1yMAgJt/pea05SzVaa2U+uj5k538GAOHSbn8u7QiJbuW8fOZMUj04Hl
	hta9/y+ZJcGr4OmpBxFEzdq5DfeQCvGFJ8+lylI0w+AJ4nIOFxsRGYhWjPfFIDUm+
X-Gm-Gg: AR+sD10ifOzs20uWgef5ZxX8hVE0MTWJjQ9L1ObqshZrVFXOcKh963Cxq86kIixy4kg
	EBbGHwyBufTmuqWBYJCNiW/puY9xpbFYTIWEVK+Q8bII6vkQNgNpse0j4gH9V67KoQr4uufaoX5
	8qjvHy/ZjKr7Tv2n47MMXUHjC1HyYMdrPjg3WfpSb6mHYgdWQ/YOM0psVLe6Clqs0uVLuEZpk4t
	cnX1Pv6BPQGkMkd7V/Ru/+FofycEYdLKr9hlyllgKFiRyx3q4/A9u8AA1mSesoXFkPANQPxXw2b
	bfjCLNxwhS7UZlvNeN9WKXEJ7KZcjxQxb5UdlTV+mtiRU6yX9hJhnJYelK4Arx8Ocjwf7u5cckt
	To6julJyXRcI8rVXg0AU0aJgYh6cFC1E6G637IdCW4uuCZrM4r5DZpWtaJOdxfAAlrevZ9C7P6w
	==
X-Received: by 2002:a17:902:f78c:b0:2cc:d807:369c with SMTP id d9443c01a7336-2d046ef5899mr10209525ad.45.1785483039593;
        Fri, 31 Jul 2026 00:30:39 -0700 (PDT)
X-Received: by 2002:a17:902:f78c:b0:2cc:d807:369c with SMTP id d9443c01a7336-2d046ef5899mr10209155ad.45.1785483039005;
        Fri, 31 Jul 2026 00:30:39 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae60139sm1872645ad.29.2026.07.31.00.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 00:30:38 -0700 (PDT)
Message-ID: <e7aa133a-0d06-48f6-90e0-1255972bd462@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 15:30:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix possible memory leak in
 ath11k_dp_srng_setup()
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260727105532.118164-1-nihaal@cse.iitm.ac.in>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727105532.118164-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1MiBTYWx0ZWRfX3ezaSfXK3Nux
 sG3ix/XuhvjmxDfK5rUIAt6FJYl+dbIsUaeCoNkduYbMmL6/69Y3UZfHaUqKHgIu58Fvr48ty6X
 TBJ6yatuOd1bBHW4XIY5HDHyZi29FBHOnbOUNCseqNbUclylmdzXG9UPDm54m/Zx/YPDBicWfZe
 ph1M2yBt6cL13aQR0pWl0q4LMyePvjGKnHrw/Qyod/Gor4yWQRMMXQ2fHySVrTlSFu3KVqwwjYg
 To/ZSt2qzbY3+fn5UGinB9dL8kHTl0lvBaZDvdI6702lNQPjEehoZn2Q510CCKTa7nmKpifws4e
 0Akgm1NjDi5khM8BhbPZB/TF5pheI0oZZ14gr0Du5y+JCe3COJBGC90XnXFbjIOiEx32hniaLex
 An9FvgiU4OPNqsRWL0c9el0P5HxJkXPuXRew0Wzp2/xppRni1o8SZap3xtT9rfWfcclOF6A23VL
 8aff8k58pY0VuIdpgKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1MiBTYWx0ZWRfX7Sb1XXPJtH2R
 RuyF0t/rCPOVQ4SiCmoklsNJlyYHF3lEO/QrLE8H58u7ShaEBbb5mezJNHFgZDFOrtC7SZskR0W
 Xvi57bSdvQ2EDeLnj9O6pqrxP68vvlw=
X-Proofpoint-GUID: FHfbJuBW6Om7-vjd-MMr4klNaGDO-eed
X-Proofpoint-ORIG-GUID: FHfbJuBW6Om7-vjd-MMr4klNaGDO-eed
X-Authority-Analysis: v=2.4 cv=eq3vCIpX c=1 sm=1 tr=0 ts=6a6c4f25 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=45AEqwlmaGsIJYzuV-UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_003047_779582_225FF080 
X-CRM114-Status: GOOD (  14.64  )
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



On 7/27/2026 6:55 PM, Abdun Nihaal wrote:
> In ath11k_dp_srng_setup(), the memory allocated for
> ring->vaddr_unaligned is not freed when ath11k_hal_srng_setup() fails.
> Fix that by calling ath11k_dp_srng_cleanup() in that error path.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> ---
> Compile tested only. Issue found using static analysis.

this info is useful hence can be put in commit mesage

> 
>  drivers/net/wireless/ath/ath11k/dp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index f389b97acbdd..c3a16da1cba7 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -324,6 +324,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
>  
>  	ret = ath11k_hal_srng_setup(ab, type, ring_num, mac_id, &params);
>  	if (ret < 0) {
> +		ath11k_dp_srng_cleanup(ab, ring);
>  		ath11k_warn(ab, "failed to setup srng: %d ring_id %d\n",
>  			    ret, ring_num);
>  		return ret;

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

