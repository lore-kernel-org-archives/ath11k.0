Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98895CD3424
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 04:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApIhgmJhfKREvob8g8jJlOKGq0+fY73sRo3QUzHyn+c=; b=roZwNsKaaFbEmnyXd9fOfSN9C4
	Hg1BAaNyFjjfQ1V35FdlJFu7gn2i55D//3oSGarshHm8txHEtT4jD92blyaWR578VIXb6sO8hIiia
	uZZl1EWp4288aFTuw9bB5ab4vvU7K3ncmqTMlinHE1eN6byX9hbG2MZgqp1iA3ASkSfJkpZ+9EYu2
	2ivcKdkJNfsFk+MGRXKTF6bt/Pzd4eRT2sTbCxim7VdrqNnw9NWtee+5fD4QYPGJWYLnUDTJo1KyC
	CC6idtETXDmBv7Uwxwl5jzTqI1bJmKwvDFm8gbFfonTWtGn+vv8xEE7KmPnR00j1GW2HZDfwbYO/v
	mjXq4DzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKTcH-00000000gHd-4037;
	Wed, 06 May 2026 04:12:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKTcE-00000000gGv-4C7n
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 04:12:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6460JAfl2445853
	for <ath11k@lists.infradead.org>; Wed, 6 May 2026 04:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ApIhgmJhfKREvob8g8jJlOKGq0+fY73sRo3QUzHyn+c=; b=gAuw1tQYnvF2Ohb5
	YB98icsiAsuAr/ro9p0T/Fup5sArIJqGQkBJEyIMpCfqve1+QjmoYO3Z3CNAgbek
	CLXFnH0etSkcoat1aY8nWmxEJoF/04E4DQlQ95ytzSt2fDD+mVhGNzVixTmwwyeW
	4sjoKxRXYJsLtsEM+WHEHiaJ5pS7fjB4FzOQYGL0zd8SF9aRkCtvb2UNyE6g3PRZ
	sBlECmCwhiSiVCWfhluouMwFyoOH4/oPBWrArv6bdt9jvVvngkCevrCDmOlHbwKk
	fIZ+rWO/FKrDPYY51+9FJYnvjePq1DyDrfkhnExvF6CNkG86pZ2lBRZKpnyjvugZ
	gDPmwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dykmhtec1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 06 May 2026 04:12:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36512f223d8so7607294a91.3
        for <ath11k@lists.infradead.org>; Tue, 05 May 2026 21:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778040725; x=1778645525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApIhgmJhfKREvob8g8jJlOKGq0+fY73sRo3QUzHyn+c=;
        b=CPDvcD7ZeMBtMA6nXc8G51nJGj1Ivga0EjC3q4N+vdle6FaU2InPiIdFu6NAnRsS/Q
         w+gshCXl6JWQFbMfJ/1d8o7lXeLncqbT0M1S/ptmI34hmE3qON/4uEr/tLtm8t4TXYnN
         VICZR5FkR/n9DbD9RDVxQkrhJO7vx3247hQQesr6YCU3N/nbFasRNvv9IA01FmuywB5T
         NkB/zGwS5+beTOQzZ1vmX3wJLvSk7wy2AhfGSZlTRvn+HP15xFcKM4VpZpPUYhRdQLy5
         tW3MoLZM8jFhIAFYXHm5QgpE0ow1CgW2ABchymktKbLEh5XNV4HclFxA9tGZcStT8Uqz
         zX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778040725; x=1778645525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApIhgmJhfKREvob8g8jJlOKGq0+fY73sRo3QUzHyn+c=;
        b=Wo0HRfNHCNkLRFNn3x4TAZUlRfduczDEErh2eS74Tq0YbHOQEF5C0YBcSWb3GDLw9Q
         /FxdUwCWASvyC/lR024ueSapWBwDvE1ZMzdTfvFpcJKNpMXOgn0DovEUvLbspYEctCzD
         Vlw5r2YY9NX0inhbJIJ92S82LT36Veqo0xoAdIQwM6u0j8cT+SOgvtuKcL8iq9WX+KE4
         YQK6jvpL88FSBxzPZ8Xjzk2BZHiXvHdH5OzNezTUaOYKbIG7qj6HdQuXqqysTwuZHcHc
         Wm2XBg36lHLWoEJNmQf7aED3fDnWE2J/F2XOgXJ3gE/ZPW35KiW54AyMrlxWLD+I7bh+
         0tQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YUXw6oT1/R8vBwZZd4QdtUPOd6xQ8eO1Gl9l6sFSBqeAE1MRM+wHraljDzpQCWuymhZ5bDXg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzcl7LpImvtVaTLdHmhUNdoPzrZssEDrpIAwhRiHutHw8w6H2q
	jeLj3dwe6gFkbiB/TAxWSrP+HWzJEuwW5tUtT92SI0E19BXCiUGBX0vEByLT0xIl6OxwdnBku5p
	rGVhpxpHJtcS6fNEnuxqYW4qkwQz7HziGaIuW5W0mxH3Ad2uVYLR9eByspgqCRdvT
X-Gm-Gg: AeBDiesyC/hsg3BoHQ/N3pa9I1YJkIuBzHh04WEj+ER25GtFWcGc8SFcrgQpkEzPzah
	tvQPrT3C/3NlLypReHf4U/82wGTbrmRRLhdHdisn7Xhtl+CCfVD/QeZeka0BuxxXIYbbnapJIsq
	nKCyJa13x45812Fr9d1V9Ob0BxkBR30jtjnizr+vzRUxpHn1AIIc0UC+TPui3/R6pRGwrhSnhge
	syMrQLII1DkxSTSPNlRXYWYzDIQhDE/lV7TpTLNUe39CC7W+BSyN1i8gLchJVmaW0Z3DpkT4Z+P
	Oet2h6N6ewAeUU33wZlNty0MfesnKNo86m5zSTGr1PPzGJsqO/yH6Pg8LNQu9iLWsSSKrL9vKaq
	p4mQcSLYNPkCIOYZUzfWRmuCcAikuGLjpg6XxT8QPFs6sBQlCUXH689JBHAPlvmMO8ZePQbFv
X-Received: by 2002:a17:90b:254d:b0:35e:57cf:c0ae with SMTP id 98e67ed59e1d1-365ab9c8160mr1749882a91.7.1778040724633;
        Tue, 05 May 2026 21:12:04 -0700 (PDT)
X-Received: by 2002:a17:90b:254d:b0:35e:57cf:c0ae with SMTP id 98e67ed59e1d1-365ab9c8160mr1749854a91.7.1778040724184;
        Tue, 05 May 2026 21:12:04 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7b77cd50sm8485405ad.0.2026.05.05.21.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 21:12:03 -0700 (PDT)
Message-ID: <fe058e9b-4d59-4bf1-9fea-32a3ff256a8f@oss.qualcomm.com>
Date: Wed, 6 May 2026 09:42:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix use after free in
 ath11k_dp_rx_msdu_coalesce.
To: Willmar Knikker <willmar@met-dubbel-l.nl>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260505171709.547274-1-willmar@met-dubbel-l.nl>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260505171709.547274-1-willmar@met-dubbel-l.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X6Zi7mTe c=1 sm=1 tr=0 ts=69fabf95 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9B1uR9gGAAAA:8 a=EUspDBNiAAAA:8 a=ljBxYmjjx4en0H8xEuoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=8R3p93Tjo66ouot214C2:22
X-Proofpoint-ORIG-GUID: n-ndYSee_QirpZqkD4QbMpAWLLesW0hI
X-Proofpoint-GUID: n-ndYSee_QirpZqkD4QbMpAWLLesW0hI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDAzNyBTYWx0ZWRfXxAUx4l22qCBk
 JE9Motgk+F+HzAWNIkGGw2WClHpjupDKugfEti3ClykG/yxghScU1II6i69uCOl7vuM6Rr8zJCX
 au9dCwCU8QtZXFPppV927hyrPrKa7C1DY88YCeOlblqqjMN8bz0kcgELMKIF1k8c0J5PboRnP1V
 LSsd6R7x7C0BVETdthuQ08mxLt2zR1rNpqPM0clxCwu10x8PjlVDJ+TEADZby9Jnp/KKJJpMLmE
 9NMpC1WcGO4phiHTsHmU+vJNc6FhiYjg+yel5OrACaIlXS3ggL16Y5Mv7/aHc8T6tczppPe/tjJ
 3/uG0JGOII7AW2t4s0txk/N0p2bCXK2Ma5+7mtCa2VwLTWLGzxT2fBxY+NVn03YWmIhYbq6o82n
 3esBrx7e3YNnrhBRQGMgOEW4ngqvFDSm7Yn678zlp+Pl+JMuDbS/9tt7L33ChO8ej573dFb86XZ
 ZCytJslTv8Btk13xJMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_211207_195295_F401DB98 
X-CRM114-Status: UNSURE (   9.37  )
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

On 5/5/2026 10:47 PM, Willmar Knikker wrote:
> In ath11k_dp_rx_msdu_coalesce the loop uses ->is_continuation after
> the dev_kfree_skb_any. This can cause a use after free kfence.
> 
> Use flag for caching is_continuation for use after the
> dev_kfree_skb_any.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Willmar Knikker <willmar@met-dubbel-l.nl>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

