Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6D7F54AB0
	for <ath11k@archiver.kernel.org>; Tue, 24 Mar 2026 13:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKVWxNgajjDfSEk0znsaaLuR+dYipGX+JnJkNm9MLrE=; b=NO/Jk2KIUW7PFirNsbr/V1IiDM
	8HzWcKI6tkMG1nQxJb4UCs/rGeaHG6StAZtgm9jvlUptUI9vvHh6ro8+cdl36a49WNC11fA9xefsi
	YD8+gV7c0l416GfuTd6xNXXuU4nIiGYhpV8d0+1tLikqYp73/IcaMrNj2Sk4ADNZ13xs4++dGKxIa
	8I2wkCQys3l5rnMkb4yF85n/qgrKOBZU1leJpuoDDzt6L7n+gdofDxP+tgxVfiGWjaxpY9EsJ9eG8
	6FkoNj3EYvq0hLedcmcHY5AtG8/XMojVwvrsl5yVp210ngMsaUKyJYBIhvYZo41fhfu1mnQza+IJt
	mXcaj7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w525b-00000001ZWc-2wgd;
	Tue, 24 Mar 2026 13:46:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w525Z-00000001ZVO-03Zh
	for ath11k@lists.infradead.org;
	Tue, 24 Mar 2026 13:46:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OBav6I1291309
	for <ath11k@lists.infradead.org>; Tue, 24 Mar 2026 13:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKVWxNgajjDfSEk0znsaaLuR+dYipGX+JnJkNm9MLrE=; b=DRQ97I8DkKS+ccJ0
	DDXt4PNCNz2H7AqmvVZDABEnu4jzj1qHFP/YAVkdR+YoiPvXYS9PxjSRNjG7jmLA
	jCOuoI2i4Nw9ter/6nI9Owy9ruxtQeezi4pWHpMzqwfuTZHGPPbA97hWRPASs0wZ
	I8gS8GTBBnNUF54R1L8i752fA3FL8OdiAewLdFbbkhiWsuBWEHrnHPnB3Yp5NbYx
	+8Vzv6c5ml09+9sAtllk4xf5gyb12IRE7mJLOYZqnZVip/0jX8ps8L57hfgSSqoI
	r13XsI8DNSY5rzlRZjPYjtR63XfRo9WPcGUgyXrx4C5ZzvnRHUlqQ37pX826ew4I
	aCC4ig==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw40hcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 24 Mar 2026 13:46:30 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12721cd1a2aso21564606c88.1
        for <ath11k@lists.infradead.org>; Tue, 24 Mar 2026 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774359989; x=1774964789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKVWxNgajjDfSEk0znsaaLuR+dYipGX+JnJkNm9MLrE=;
        b=RKUAtg9wDYzpwWqXYG4295Xyfd//8Ctyn0I//fAJV/DQ7VpV2Wq0j7JvVjSDwgrjhB
         sIjo5Seh0mcwpYr9IjMXgSrBbjof39L+eCMGYHBqjHaL/UKJ0VsQ7Usi2sjm1Ewx64sf
         qike9b0k64+hXa36YnoKhq8FKDHkq/NH+s5yPXW+NRnVrl8XvgaY+f7ekzJ+DhkOypkn
         lGmd1aPTmmVgWwmV4iI8MZ5pZr0ushv2osv9gLkpmgGVxEdPsdfo/y+moMEOMm6pCo1K
         miisVvG8m9TNO05xoWIKOfwx8LPa12rzXvj3xA8KzZsqOJ6Y/shXar9v9TnIzj88o9g8
         epSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359989; x=1774964789;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZKVWxNgajjDfSEk0znsaaLuR+dYipGX+JnJkNm9MLrE=;
        b=P5+sxAQsIt0RcNOtsx1efp+YHTyDzK9/uhb1VihDU6bvmjq4lU97V3f2a/gk8ip00a
         bmH3E+YUibSOrUrw5A7P6Y6q9oH7tSJ1PPe8eYAXJEL+7N31HaMITdGllgKUrhsBfRCo
         +Lmh6rnP4nks31YWOyrEwcY4UUukRhryvzLl97FvSxaHvkXZYrx7C9XZg+yTVoDrYv7I
         Bk2nQja4PjNZLOsz46tkkmgoI31tLfbFkyDMztz7xTcc5bh+sPGm2pe6aoqYS5W2fuwP
         M80yH19nXZ/jS5yLrVp2u4dyz3RUqNYtDXbheJJR21nHwmFS8wbBxMG+4r0yBP6XsqR/
         +kuw==
X-Gm-Message-State: AOJu0YxZf+FHxt+UsklffvaL1VVTw4DH7MyZzLxKSTZxwLVcV5yiUzxm
	GygTcfC6aVYW2p8amhtNgCnyE3L09udGnUgdVsJQCp8BDZZHQCfl7eykmO5lIDDFanwY59bcGC/
	1oine/1S9vA0xYAfLKO9OEJf8htCH9K8hnj2RLbm5AhPbKgigIm1InOspVO3PPpRQ2Mi8SWJF
X-Gm-Gg: ATEYQzyIv+UVoZqaW2Fbg+5IJVgXgTxxaFJUr2GoViKz1/Pg7ceX588O2Y9atcyezUR
	Cw6sLtFOFSaQbBSgRi3GxacVjeJSjgynENHzxRytLhabYZLHeQj7Dk3ua8UHmBa1w7ChrKvxN3+
	xR8EzfwJ9HzT38YuY7Pg9q1X5Kx3q4iE2DEfw2MhGs81QzOMlcLtnOrVLSbHyQeqCCqrEx8ag1O
	lU8F1sUGdOREyLHdSvknLFZ16qPzzfRRkutRYIkZzabPlsMUV6yhr2vxTD2RfT5pm6Av/QKGdbl
	IEPPVY3hTZoBLZxT9qNXrcyRJjTacvvlBxFr0bYQTSLa0xC5c7JJDJy6k2MAHeLnguC2pVwb9B7
	qf9eR/4bpgsI890nv2R3w2Qihj9G8R9+MllS+DmP2tGuOGzLAWokWFL/Hzn+gCx04kZypIq9UVR
	6n
X-Received: by 2002:a05:7022:1b09:b0:127:5cda:fb7d with SMTP id a92af1059eb24-12a72656424mr7994027c88.6.1774359989462;
        Tue, 24 Mar 2026 06:46:29 -0700 (PDT)
X-Received: by 2002:a05:7022:1b09:b0:127:5cda:fb7d with SMTP id a92af1059eb24-12a72656424mr7994005c88.6.1774359988859;
        Tue, 24 Mar 2026 06:46:28 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733e794esm11368447c88.6.2026.03.24.06.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:46:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org,
        Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260319065608.2408179-1-reshma.rajkumar@oss.qualcomm.com>
References: <20260319065608.2408179-1-reshma.rajkumar@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3] wifi: ath11k: Pass the correct value of
 each TID during a stop AMPDU session
Message-Id: <177435998825.2954589.4435953156706637235.b4-ty@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 06:46:28 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwOSBTYWx0ZWRfX5VjawJCnBu5v
 Dp8e0agVKVC08QwtYNhxPlj3TPEj9xC550M+WTmd5s9xwJPJYLgI2LN0eTuhhLPFFOsd0xWUBDI
 qpYf0zq9FpN6WH3tR8Ehvr5wpWFpVRAczMUEFlONBdzjNqX/WS9EiwqP+s9tKOmbVodL68xnggS
 6ZcEzgMrtPU6F1/sYqz/fHV/zKevnLzdxRg25qujFem/fdPA4d0VaZvi5GQYBDD8CLrQ88LZH9n
 MABJagWVCY4XKRdkGSXAfpGJQiH+t68QdkNF/yQ4a4zaUSa2DWXBu0tcJpRKztN1SspHhpyb5Y4
 pKC90ooYMVCxG8WLEGnm14ZFmCv5EwbYTEABFAuA8hbVbLO/iFv8j7VTYOZQVzgrxg5vfv+FapY
 xMRW5JUwBtKX3pyv6X5VkAcnGJF8+W/YxNKP1zoybE6sjsqruqZ89kINxVbv9rZ3oOPE4txWYlm
 e3trG4Ezcw4XUA1gZdQ==
X-Proofpoint-GUID: td6YzezJFQplIHhmxcka0gSQ1xfzA0-x
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c295b6 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vkfXM0Oplov9zySb:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9PWgfb-kKbfySk47rSMA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: td6YzezJFQplIHhmxcka0gSQ1xfzA0-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_064633_198733_6CC6BFEF 
X-CRM114-Status: GOOD (  10.44  )
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


On Thu, 19 Mar 2026 12:26:08 +0530, Reshma Immaculate Rajkumar wrote:
> During ongoing traffic, a request to stop an AMPDU session
> for one TID could incorrectly affect other active sessions.
> This can happen because an incorrect TID reference would be
> passed when updating the BA session state, causing the wrong
> session to be stopped. As a result, the affected session would
> be reduced to a minimal BA size, leading to a noticeable
> throughput degradation.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
      commit: e225b36f83d7926c1f2035923bb0359d851fdb73

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


