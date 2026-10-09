Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2743CA5FED
	for <ath11k@archiver.kernel.org>; Fri,  9 Oct 2026 06:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/i8NmI7i8KDIOyDpCxYcf9EtRiTu5EYcsw8myqPflEg=; b=OtCrO+XYnOYtyqoJpia2WwG4WP
	XP3aXFT44Jqp+z6JsirV3NuXMEAKfUh/gPpMdxYU+lLX7d8yZz5X638zAl0qUg5i67rH/wgEJ4M+j
	z1hMtxwxA1/FBqDyiUXleY7rza1RWYuiU9DA92A060GqjjW//0FjTmNwUI5ZKvvnII9XLIkYYQFJJ
	v6E1r02pHVjjmI91K2zYjkI9jMbKRTUyhQtiWBLaykeJKyhddepDh54UwXXHd3ep/WJSyae1TK+w4
	78hACYGFWsa2iDD79653jk3puB76+acrKVI+9kVMVoFHfA6CDrEOgwAbrO7XrcYweXskgCq872551
	Iwda+SMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4YF-00000005fcF-31lJ;
	Fri, 09 Oct 2026 06:57:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4YD-00000005fbd-26ef
	for ath11k@lists.infradead.org;
	Fri, 09 Oct 2026 06:57:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HgjL594820
	for <ath11k@lists.infradead.org>; Fri, 9 Oct 2026 06:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/i8NmI7i8KDIOyDpCxYcf9EtRiTu5EYcsw8myqPflEg=; b=RS5fKhv4VL+Bwy9b
	ZZg3psc2JiyKmybpRSeKfUzHjhdhSEIytJh6dn9LAI9W0FyL+Olr3mSFZquqtgoI
	HNs9a++2Da1inLUV/6Hvi+zP7jDRrsrbEp8KisUDYqgwDY+SQtmhb3nsPn3Yq2Bt
	9fXzxwECcYq1yWt4nOAR9VYc0LpYaqn3Y7CAxJv4K6x1xPH0LQ5kFYZwnuf6OIBX
	lDiVSvXy6/fhuQNt29BvWE4OU2wD8qUEVPg/jjop1lOzm3lHs72NbPBHMwGfrN6S
	Yy6Ifqi2KtmJ4xLO+hVNGXJXczJkKur9eCIioHRYEO1wxX/NYxJw55Br0HEQZ81M
	4IBuTg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj3hym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 09 Oct 2026 06:57:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88b9d8c9e55so1184431b3a.1
        for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791529071; x=1792133871; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/i8NmI7i8KDIOyDpCxYcf9EtRiTu5EYcsw8myqPflEg=;
        b=GVyk0lPOF4qAPlZTQI1arpNamIlZh83ZNsu5zBF+AOQbSa39W4mD9d8NDrizK5s7WY
         7c34oGKdr4dEaA1axXL4yyZUfN1ZI+tO4w30JuIKENC7afKxUrTzSXThTPQgI5knBhNa
         WuMlNKjFOf9XFCjoIeahS6gLiuFsQmlZxBbuyTkLDHbn5LDKqHviax+yxo+IU5BwqJvN
         A9WXgin1iMC2MDkS1QcPkMq4gExYqMZbAfYdkPI9Pr6ZxGcvVfXvedlJ3uuOnryGMDvT
         ubIOctmseTys3AMyJK8SRCakNRWZ4x+jgbt5dGShMLTjWFdko0KgGNPuqWwYNnJB1e8m
         UxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529071; x=1792133871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/i8NmI7i8KDIOyDpCxYcf9EtRiTu5EYcsw8myqPflEg=;
        b=OdNUoeOIquE38vB2SjxGKGN55HZUT0q+aL4mhlyCMBH6SQNDNH3y5+uqGQCeNF/gwq
         NQNCpmvcIdxW9nGAJIjLV7Oz9x7YqUuMC1EJwBEcLOybKfqUYty2WddP0ZhznapHtoQ0
         MZh5rfG0sQ3ilA7nuyPzW33dIA+XCIqq0/YXL8qeUies/ToxYwDUAiSP6K1roiEbYRLr
         cLIfMDgQBnj5/VMkpie1u5o8ohThx8RbXHac3NxqTQ6nGxbeVQjmmaP/T4lXeCU+gLek
         ir5ydnzkEy/K9nCNRbtDsqvujQIvbNSdytEQCVRb1XBYvwMsiWDkjKEbKhFkZjn4K7Qw
         guaA==
X-Forwarded-Encrypted: i=1; AKwUvBwDoZDoH2pUntw+92YDRfwFbPrwb8/ZQ6WTZkEkLCcIw4iJd+PWVVRGkl2OCJ8xdTh5vfu3sf0=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4jS3URfE3uT+1CLwjVmIMW/nRN9z6rH6XVh6ZFqpXbgD9tAM4
	MkYTWjjewNU5UvcFVFWTL6MkraiE8XTutTguIWbpRdS62ZM787gCz4elAC9+iDd6OcT3zemL85g
	8tl1AX6i/OYvdfJ/NbzLRKBVxXsPDQVoJ77das3XDrV9YYbp6GauGHmR9qvCwmRPSTLNv66MM
X-Gm-Gg: AYBFou0kuVkIXEPUEL903VK0LudQLg/MP3OD/4nMV5DjKe0fw075DGwfOm3Nnikwn7/
	zjrOT6iUFUzT8mdKJdA3Mvi8ziv17kZH1v+DugyqGW9uovOU4Zl3nVip/S4dmPBrzxOo9zLtYyU
	zSmmN+BJ+m9kSVzejsV7ltgr/696vcN2e1GxCh0uFTB/NwddT2i8xTDDqsUn01lohvAwxHdGiIX
	aEvXhT756KaSsH0bRFoY0kNnjkNpG57Lf6feXMoGFlVaJVW6KS1Ce74HVRPdmBuGjXJBQbi/Nqi
	YH3gVHZtFQZxTdtoL8hW0oCfF64kWc8psBrKCPvp0oD3kRMWGjU1ISZ5zKbvoWLrlijQwmTxrD2
	foYwlt+rd7CK1/dp/j1IDYqVenl06h9Xm1EC0A5a5vOVrWZs=
X-Received: by 2002:a05:6a00:2b98:b0:881:66c:53e3 with SMTP id d2e1a72fcca58-896a3a512afmr968570b3a.32.1791529070836;
        Thu, 08 Oct 2026 23:57:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2b98:b0:881:66c:53e3 with SMTP id d2e1a72fcca58-896a3a512afmr968556b3a.32.1791529069467;
        Thu, 08 Oct 2026 23:57:49 -0700 (PDT)
Received: from [10.152.209.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c310737esm514809b3a.10.2026.10.08.23.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:57:49 -0700 (PDT)
Message-ID: <e6213779-bed7-4484-a230-ff3508e8ec65@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 12:27:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: initialize CFR locks before capability
 checks
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Jianhao Xu <jianhao.xu@seu.edu.cn>
References: <20261009060326.1162818-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261009060326.1162818-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfX2SYmNlg3rxwW
 g7hUXCpppSzYIjaow5de2V4pzac9bRbNfT9KsnBqQrE6SmS3/9SROkU/rOfF9mO79Gh+vyYRbQG
 N/GQS2RnDkXX5Cwmt3O0rIjDfYNE0hIlDs5rvn98bjSD2iXWgP64q5z2eEHgzsTZs+djeONB/Sq
 30TnRmzjVuRLur8faV8N2xCqxzg4vIP/Y/pEF4SIyIskk0DB2ZXUBVoWAMkul/evqWcIJlzs+jf
 lNkpTVMGOhfJwvbc8Hp5xYXWkCTJ7/GI8Tc2nsosYpVt6srDPHw2VBBaSTeG2ZjRx1TumD3Bz8c
 cUbbDF/wXRTwwJ6K+170KXdNbDP8WOVi9+idOJgQhfivdjirSlurMf6KsuM+i2yxjUE1fMO+Eda
 gpBGNSL7BJjnAtLk7U9TiV+8jWMvaOPYOSm7X2uOClONImxArMpE3zcV1sCD9jG6xIAI9edv2rJ
 i+x8W/dVGHRFlGPnO8w==
X-Proofpoint-GUID: wusUqVqnmL9sNdSNG9YYD_u6jCbGEXNd
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8906f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=ZH9U8Pc_akMW9uxFS8YA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: wusUqVqnmL9sNdSNG9YYD_u6jCbGEXNd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfX7rFCI16c9Cbx
 iDwYpml5tzLvyqF9zun1GPmFUuzjhyfQsUWONnozqgmjc8keK5trjPWDTgiTOSwstt9y2AGZKEP
 OZN+CjN46bht08MLxrY9md+yYapnJJw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_235753_549945_C45496C3 
X-CRM114-Status: GOOD (  17.08  )
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



On 10/9/2026 11:33 AM, Runyu Xiao wrote:
> ath11k_cfr_init() returns before initializing cfr->lock when CFR
> capability is absent.  However, station removal still calls
> ath11k_cfr_decrement_peer_count(), which unconditionally takes this
> lock.  This leaves a production path using an uninitialized spinlock.
> 
> Initialize cfr->lock for every radio before the capability check.  Keep
> the CFR ring and lookup-table lock initialization conditional, since
> those objects are only used after CFR capability setup.
> 
> Fixes: 9b2e3b4ebec7 ("wifi: ath11k: Add initialization and deinitialization sequence for CFR module")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>   drivers/net/wireless/ath/ath11k/cfr.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/cfr.c b/drivers/net/wireless/ath/ath11k/cfr.c
> index a91f25fb6..0708ca28b 100644
> --- a/drivers/net/wireless/ath/ath11k/cfr.c
> +++ b/drivers/net/wireless/ath/ath11k/cfr.c
> @@ -956,6 +956,9 @@ int ath11k_cfr_init(struct ath11k_base *ab)
>   	struct ath11k *ar;
>   	int i, ret;
>   
> +	for (i = 0; i < ab->num_radios; i++)
> +		spin_lock_init(&ab->pdevs[i].ar->cfr.lock);
> +
>   	if (!test_bit(WMI_TLV_SERVICE_CFR_CAPTURE_SUPPORT, ab->wmi_ab.svc_map) ||
>   	    !ab->hw_params.cfr_support)
>   		return 0;
> @@ -971,7 +974,6 @@ int ath11k_cfr_init(struct ath11k_base *ab)
>   
>   		idr_init(&cfr->rx_ring.bufs_idr);
>   		spin_lock_init(&cfr->rx_ring.idr_lock);
> -		spin_lock_init(&cfr->lock);
>   		spin_lock_init(&cfr->lut_lock);
>   
>   		num_lut_entries = min_t(u32, CFR_MAX_LUT_ENTRIES, db_cap.min_elem);


NAK. This can never happen.

