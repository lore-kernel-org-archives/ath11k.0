Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398BDC54F52
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yl4SkjwOHuqi6RO7BshtqcwKa8UMFH3u0MJsjjRIo6M=; b=q60dakPWvtlPIkexN+Zzd5OHrR
	PDMjCcI0iaRTR07vPqvMJ+ZwLB7xO6b5ZhJ8nJB7momTdP2vrHkC2o1UgNQKiPAiQKaCi7NjHCTfx
	kmHyZQeHc15jCI+5KtY113Aq26ASd6EYNno4fUXdF8JWyA9KdH+1rWA4APav4tiu5NovMY1hPuVPe
	6018s//ob4jmSm/ZYm0QpqMLQy6wrV07YkTLj1fcYsGXb1Jbqigf2KP8/LxXmTXFA0pW2n5CvfrhV
	clGy1HQF9+0rXtq/XrauxLNr/euG+OaB6fQsAqodGgJZZealKsZlsROSPF/fAhecPRkkkprCrt3iS
	K/hGzZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotHi-00000006ce7-2LNb;
	Wed, 29 Jul 2026 01:40:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotHf-00000006cdb-0HkK
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 01:40:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1HGgE526858
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 01:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yl4SkjwOHuqi6RO7BshtqcwKa8UMFH3u0MJsjjRIo6M=; b=VMJZ1tXm/vbsaqZg
	CRGnqEczqMyH/RsMUKYrqw+8sbSqu4Izqtqi9Am/VzH+KvnOZcrIz8gC7ZZdgt4c
	7ndQIcgv24ZVLvzaVizB2gcpxfLX50fBpJt5G62i9+9JwTimJyJ1wqth+Q2Q90Ae
	eX/V1UtMHKtzpIm9eZ1Gw0xQf9prHGuKU3oPp2pzBkCcxg2MlgF9ZFSdl0NILRPH
	GZMLxvyOWWnxW1XolRji84b19DkFU1F7s6HJoc2RjzTS8tt83WK5/pRnMI7Way1c
	/05f/c63xV2vCZX9k0oN5ug3urvguU0z9GXrHFfQORIvHIG2ODcwYyuYYfXpdhlw
	EpBzDw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q09kfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 01:40:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so313374a12.1
        for <ath11k@lists.infradead.org>; Tue, 28 Jul 2026 18:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785289233; x=1785894033; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yl4SkjwOHuqi6RO7BshtqcwKa8UMFH3u0MJsjjRIo6M=;
        b=PN1IebsAM48OyTjDFxg31/BMoQSrHIwkUzEEgM1oAcRhYNmrVklkER7oiJWGDQ9i9R
         MIkqoYf1BOHNMYxGkKepURDahg+yLZNivQIpILcIRvybPLxfzs9UgwPTvXCGyzYVJ0Kx
         7qVLH8bkth8FFXJD1xRuNFNel5RqyDePUx6IuWiPboG7eV31GygyXcabKUD2tfdEibHB
         jnNAbb7qYYEEQUXFJvMEnBDwMcvm4oxQifu8ecBXeg/kHRcSJ+CCzaPBekgZa38LSGQY
         HqxliQ+NUCs0432Q2lYxMuN0rB4leXe0JAWurJ6DUfE9mFjzuWP23eGR4jQwFmcNXOxy
         I7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785289233; x=1785894033;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl4SkjwOHuqi6RO7BshtqcwKa8UMFH3u0MJsjjRIo6M=;
        b=LIm59UPG+w1qJBsXqdlpvusCe53YHrdDGqcOR4x0N3uvIxfnl1MaHDAye/wKloawOQ
         wg8PCVjfgkvyHYYcGWyKA3T6fGTqCH1Xlvn2G1IQGykUQ9+S/qef4hxCtjBftihxKjrs
         n4TrJze5KhMDTc4gy1ZCRir+lT2K1G53aGwFB8icvjGE1o4EVRHHNSVIFJt3nb6COsKa
         pTtAdqZ/PJdctPDEiU0jgjJm+d/zAgp8w/MxlnVnmKlZ1QW8ykFKoFYQ7blS16hRZyyJ
         jOPUDn4d0PdKvdkkIVRpmfOZyv6CvrInQ2fyRL07H4nrg1/3xcPOVXaTwNX44kC39Tsc
         mJPw==
X-Forwarded-Encrypted: i=1; AHgh+RpGN3T/VKPmTCW5zzLdSvIMmxKHSNDqoQseejho6583ZEU/aLsvdwVTPo6drPkpzpi+4C6KjB0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9BYPGIQbO7LhZOad8M94Cf06r4SOFjyHdbZCJRMATCDqRIOIb
	vB8xWJRN/oW9JRoxmTajWV7/oVCiKIrgVL/x6bC4lN8pOaOsBawhmeVmFq9FwtGOUFSf99eLtIJ
	fpaZJJXp8jy2AgJ6vHemDf7Aq+xJ1o1mwDkhbrWM9cBO7/QksOfgO6qJbF8rK/Kfm
X-Gm-Gg: AR+sD12RCXmHN+r6S6W0B+NB5qt3kdh5xsPpW8+gF45Qb/k5LMWyMtKynOjWml8rQr9
	lPkOsZWeMsXNu9S58GZeX4mxx6sFBoC/6gsEQgJoxmdxcW2wReQxWODk9NDtoFDLVvYlNaF2opI
	+pWZ6//7odh+NBVb71/Z4sVCBAiIaAfpR/j3PqKhuKr0pQC9dkWhtmnORrx4IA5axOHCB6IZjA0
	5kT5IdDR93YfkJn4YGspOJ/6C97J5AUsYpqKnrlvzOfJpDfOypWGB1geQOTT+Z2iL173OmZYLVC
	mTUa9O0HOv9BH2L/+f8PayPhur3DB3D8n+zODnSNZs0PXJUuwdcm/7VkQjiE79djcVEQY3L2Std
	gaCvb1QU9q6qPOJg1XZgrd2gXKgGp75sXWKYngZEqD/RtUaKp5FSJMwkdn3pCwXs9MYBhL4gDlA
	==
X-Received: by 2002:a05:6300:2206:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3c8aafb6e6amr5808971637.11.1785289232880;
        Tue, 28 Jul 2026 18:40:32 -0700 (PDT)
X-Received: by 2002:a05:6300:2206:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3c8aafb6e6amr5808950637.11.1785289232431;
        Tue, 28 Jul 2026 18:40:32 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba7341c0sm194223a12.24.2026.07.28.18.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 18:40:32 -0700 (PDT)
Message-ID: <ef64b516-49e5-48b0-bdbd-5a62476d012f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 09:40:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: =?UTF-8?B?6LW16YeR5piO?= <zhaojinming@uniontech.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
        ath11k <ath11k@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20260728031335.3818736-1-zhaojinming@uniontech.com>
 <1e19adf8-d3cd-47c8-a986-05faae7af3c5@oss.qualcomm.com>
 <1C78A779F3AFA320+202607281410457939688@uniontech.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1C78A779F3AFA320+202607281410457939688@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a695a11 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=casdFaPNnGWWuao0AncA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Zaa68CUsd6Sb_J61AQv9nfobTQxRl4RK
X-Proofpoint-ORIG-GUID: Zaa68CUsd6Sb_J61AQv9nfobTQxRl4RK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxMCBTYWx0ZWRfX9rZeXxz/n5kO
 380xSFqIx5XcwTyP6rRAXckzbpaEcyDLoU5mjLNAr+8zChuYktHyTcKZz45IfwdBK8CjkwUCmot
 xPTQQBzfFlenGdcMZ6q/0+aT+H7rqXwuepQr0e+hP8c9WuBw/osTBdus642uJ73Edjlb/gAdOkq
 Uujd/2Ql0IRjvPlDC/XU+oNxKOeF+NF6qimFTsndh8uQLGfWVqJBI55QPaY1oqzZsXL5r6rI7hU
 6Xv+be1FG71fiB94JLGdnLcjTYwZ8nlp0IaAlbf3uw7r/xUbn4GtfSPfhUVOT0uO2I5JM8PS9oW
 rVtKN6l4AQmq9WvUDcP1+ljjPoOa/PqTjk4k1BHWB6P2ZwNJ2qgarm3uXVwOmiMMWVfjI1N0J6g
 C7h++uWKEmVR5hkPORsycZNrl8xYf2O/O953PtD1Uydfu2OgL7IXV9Qx7TOiScgytDwnFflEsZj
 Gt8NJj+s+qtCbR2iVfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxMCBTYWx0ZWRfXxspBFaqYeABk
 ZNWFqXHiM9SWuFAAKwo3RVrWOXxiq86ssE7Ph9rMZCgvBH27H6xqT3jSGQwPC8VRgRtvT3o6dIw
 q4rtfm7jXgoUXovZSxZ5z1WaSEHLctc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_184035_361233_7B8E5E8F 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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



On 7/28/2026 2:10 PM, 赵金明 wrote:
> Thanks for your review. 
> Do you mean the Link tag should be placed in the changelog section (below ---) rather than in the commit message body? 

exactly

> If so, I'll move it there. Or if b4 handles the tracking automatically, I can simply drop the Link tag.

b4 can automatically insert below tag in your changelog, e.g. for the v7 changelog:

Link to v6: <lore link>


> 

