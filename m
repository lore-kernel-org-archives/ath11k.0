Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3C3CD4851
	for <ath11k@archiver.kernel.org>; Wed, 13 May 2026 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6GvVl+6cpP8I1yPQwl4Vl/23B5aHBjGvTjA/fvhC8I=; b=h3fW+yLE8KGxcZwfwPdapFLPp4
	1+qX8R98TvFjLKvLV+BEThmogKolqfVnGDvJQIgnMO0BCRjwQ68MCBH0SWoFEMoxRmlRerS5gmzrG
	mw3FLvpqNkCx77W7hwuTU4DClT3F8fGY3OzXXv2SMV7QLNOJ775r11jp7JVVvNRH5F8rlK/hndWGq
	s+DrzQbmZ+PqQyjqaNQUCmacYilP5jAxcgVRYEfhzeXHKtbPZSNwVIgZMpsvrIgRT2Wl5DzttXX1E
	DVm6N2XXRl6KebfE0sqhJicvWhpLq8xsil3HnTl4wq5H3XWobYcGE5XIdRw94ZC5LbUKr4abqLiP6
	tSzS3c2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNC6Z-000000039sV-1YeA;
	Wed, 13 May 2026 16:06:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNC6X-000000039s1-1V5p
	for ath11k@lists.infradead.org;
	Wed, 13 May 2026 16:06:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF4qNT2887823
	for <ath11k@lists.infradead.org>; Wed, 13 May 2026 16:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6GvVl+6cpP8I1yPQwl4Vl/23B5aHBjGvTjA/fvhC8I=; b=KUyP1R3gY5gOOv0v
	CG7h1+E69geAGvePm2vw/Bi7Hg9TlP3R85C4/o2hozG+Drm07FNJhUWlKU/9vMQ0
	aMGzT+DL1zIz9MeSTBnOAqkDBy0QVc1EzxmWBaVUlxzFz01r7xb83XCA0zCH+wuh
	OLhfGZmBZkbKL4Y0fp3dkDNWgmcxPNLMk2SZR+ttOtUPERQx9bWt0SELEX9jlq1m
	Sup0yNsIppO0vHKJsI2JhKl4nh8rLgKxEgFneywm/7nw8b5GDik/mtwVIxZBBPT9
	BhNrRATLoNpR5AitKo4zqgduw29rJ2HHQAIZCuN15AR06Nm3n1FsTF+Q/LVMXigm
	u+aZsA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghr81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 13 May 2026 16:06:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so13853404eec.0
        for <ath11k@lists.infradead.org>; Wed, 13 May 2026 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778688396; x=1779293196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6GvVl+6cpP8I1yPQwl4Vl/23B5aHBjGvTjA/fvhC8I=;
        b=iZKVVivs95iWwGbkZTuq3GlpZVOiSO6NZXW2E7u0/o3pEXzBWyxzYn9rdrbuXV4YHU
         94oGr0eemnHJ1ZnGXUO1oU0Iptw1egAw/joRm4WGoRB0M3fmJNhtjTVPNXAQM4VmWw5M
         SBY8y8f9yVqMJ0ybP94utdv7YcXlYpV5RYezPkJ2F1hnvZOLFKcCUm9Sd2q45CCC1wL0
         A/+W2KPeuwUT8CbRW+VBhgFiuCNiHUwyVTmgbj1L/pUEtpURQIiF9DBQh/cJvUhW42vn
         rvB/dNWyeOYrs+k5Lcttiya3D2BSBAmuz+Y2enoXYsX9VpdvFlyfE1DM8FQ4MENP8KlT
         Rc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688396; x=1779293196;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6GvVl+6cpP8I1yPQwl4Vl/23B5aHBjGvTjA/fvhC8I=;
        b=S5XpHxJMX5jP/sMm9NH2ozSA1Ln5zfvxaMQTh5U25D/W72YjlEMqHeXj9iyPnoUEk8
         DaaS+6u2UNKfGdzI/a2fSVaWGtQZDG1eLqsnZb2jSmUZg3EBG5SEwGWMAeK0SuB5VtTy
         3P0KJQlcbk9a5RYNGS/4yongULVZl0lY8Q9fiLn7tCtUeGsayBPHJaZ67K7p/HZg80ap
         kP/3fhyHoiUz1vCDpy0RNKJFFy77eLVzJPyBh7+ME7Pd1uuTXscLk4k+85sex/VB2fHh
         ef5xRvpl0jljTjpXFuovZI28RzdAZKAnCzAeQLwGtHFrJe5KbhrK4uCnZffRqmHPg9PY
         Nctw==
X-Forwarded-Encrypted: i=1; AFNElJ/dJgGU7O4Pxt2O/MqvPpqU8Dl8tKVECObVkz0RYABrI7F9TfeU2ldssfWTEhWN9n3BZmI2Sb8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsJj7RobNAGa72rQ72gXQiE8YInkgeUEolGhTGJlglyALZO22y
	Q5qBM30ebZeN/Q3uL0yJDJfJ/IN3A+YG2JKSOf82HXmuNEnjLOjs9Su2pSm7xHhvJ4IOVnHGqeV
	ZZQMmimzFsRQ06BEBSjLRnex3idVxRTcQvzmU2iq/z7dO1MOlplwtb7csA1MHaqWk
X-Gm-Gg: Acq92OFinaF9b9jTO2l+CL/P1NqM7dSXpQuQnFOqOzddBrwZP5nEKa7GTMMWUKzJz4g
	utlaoOfFj1d/uDMQgHntSpwo9agCLmVLAU8Y9b+4ZvlW39sHr0BXiv709CaySLF34sZywBaYxo3
	IgbLqr330igyuPSl734MnLcOX5nW00i3faWkH/DcNLLI2CPCoIgLBLVL7Fm+QS5tG5BAVlmo3SB
	ZeXjTXCiRlgrFRwrXqrFc2YusUyofdI6aM1/7emIROf+bh/QL0IzoNYLLtAbwq/8/X1HOMr7MgR
	Sg7jr6gNdta38Xsmv+k3U61ifp16riwiOXqr6Q5+sQA+iEc51fpLfFWK7ZDWmyWBENLgFdpqG1e
	fOX+pdHtLVmwarslrJlwboNxk9eFpR6357F2c5rH9kO7WpSzmx75vfyQOCHTWsJl1UyTrLCHQhj
	NEd2rwcIyK5nox5A==
X-Received: by 2002:a05:7300:6c21:b0:2e5:8ec2:82c9 with SMTP id 5a478bee46e88-30119391422mr2303792eec.26.1778688395937;
        Wed, 13 May 2026 09:06:35 -0700 (PDT)
X-Received: by 2002:a05:7300:6c21:b0:2e5:8ec2:82c9 with SMTP id 5a478bee46e88-30119391422mr2303764eec.26.1778688395163;
        Wed, 13 May 2026 09:06:35 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847506fsm27659739eec.18.2026.05.13.09.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 09:06:34 -0700 (PDT)
Message-ID: <3b56b221-29a2-450e-bcfa-1c929ee0be5e@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:06:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix txpower in ap mode for 6 Ghz
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath11k@lists.infradead.org
References: <20260512204851.2634163-1-s.gottschall@dd-wrt.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512204851.2634163-1-s.gottschall@dd-wrt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 30u9gkncGt9B665XuaiagZ5re4MKsxNA
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04a18c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Y5XITzagAAAA:8 a=4gm6xPFbWwVjzW7VRE4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=dfzBCs9aBJshU-flp7fy:22
X-Proofpoint-ORIG-GUID: 30u9gkncGt9B665XuaiagZ5re4MKsxNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2NCBTYWx0ZWRfXzFDIQMzYh3ej
 rP7M9lS71XdEHAFcDqy08n0nwfcJEcf38LbIjKjI5lHcXl74EyxwKz6aI/KPh16Kr2Ub5arvdir
 EXBSUCnL6Abe+WdiQHAh5kgNQJtfsg4cOa56PZl9RmEr0PLgMYVNoDD4T8qwjWjGt0ci7Wr2aJ+
 otrNtoH9VA+BZE3lWEZPjgDRF857BMqAqayDjs5cJmTgUCiPUlaDhaPDWupNUycr2PjXmOkGltQ
 Fok38Jb80D+awFkY0KNw9QfPO0TtjdBudxRerFN+Itvl5tF4jjJ3VJlESPw2Gvz2EBzmsQsEEUT
 eXFDyfmsKqkftjee/SWF/sGCKgIziJp3cGvDaGtYjpv00XbDsD45PrUb3LEuWYiMrB7uvlk62/m
 Cxx74rlareInlCNgd7N6DNxpOIGXJ78xqbbhNowedkUbF5QdesnmfM2aqqfRaHA6Y0VU8UcI7Dv
 mKc1LssnbGTVd/VTuqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_090637_408937_E63B3F40 
X-CRM114-Status: GOOD (  19.54  )
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

On 5/12/2026 1:48 PM, Sebastian Gottschall wrote:
> there is an issue which has been discovered a while ago while testing
> which killed txpower to 0dbm once scanning is triggered in AP mode
> on QCN9074 based chipsets if 6 Ghz is in use.

s/Ghz/GHz/ to align with SI (also in subject)
> ath11k_wmi_send_vdev_set_tpc_power must be set in AP mode in the same
> way is it is for STA as it is implemented in ath12k and in the
> qsdk version for ath11k.
> this patch must be considered to be backported (i discovered that issue
> already 2 years ago)

There needs to be a Fixes tag for any patch to be considered for backporting
by the stable team

> 
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index a48b6bf1f29a..dc192152b2e8 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3497,13 +3497,14 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
>  	return 0;
>  }
>  
> -static bool ath11k_mac_supports_station_tpc(struct ath11k *ar,
> +static bool ath11k_mac_supports_tpc(struct ath11k *ar,
>  					    struct ath11k_vif *arvif,
>  					    const struct cfg80211_chan_def *chandef)

CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

>  {
>  	return ath11k_wmi_supports_6ghz_cc_ext(ar) &&
>  		test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map) &&
> -		arvif->vdev_type == WMI_VDEV_TYPE_STA &&
> +		(arvif->vdev_type == WMI_VDEV_TYPE_STA ||
> +		arvif->vdev_type == WMI_VDEV_TYPE_AP) &&
>  		arvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE &&
>  		chandef->chan &&
>  		chandef->chan->band == NL80211_BAND_6GHZ;
> @@ -7647,8 +7648,8 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
>  	/* TODO: For now we only set TPC power here. However when
>  	 * channel changes, say CSA, it should be updated again.
>  	 */
> -	if (ath11k_mac_supports_station_tpc(ar, arvif, chandef)) {
> -		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, &arvif->chanctx);
> +	if (ath11k_mac_supports_tpc(ar, arvif, chandef)) {
> +		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, ctx);
>  		ath11k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
>  						   &arvif->reg_tpc_info);
>  	}


