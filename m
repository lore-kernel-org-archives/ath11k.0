Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89A0C36000
	for <ath11k@archiver.kernel.org>; Fri, 21 Mar 2025 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5KuILFsArzDnml8ZNWsQJ8DsMl/xcUsw5dgf52brGo=; b=WOAWdkwMQTKwcD83q+lIptSdPL
	MEog7Np7Tz3zrTaNzBzutmHMOFf6OqGFUgujCMdpPuXfKLmzjOoMzFB2SFteC1tLYl3SLhGThJaVE
	0QDrIqP8cIywvySE6q2dlDBQDLIUZHW5r8EHBHBJ4ytwbbg4CmuXeuR8NJvaURN5XTmXN50CGGz6L
	sM1GtptRS34dLmu6rJmz/2cLoBhM5nOYuNuqZZbVzc7ColmHXYGB+qcD0vlBOJ7aE8DywcjfXI7GW
	HOXkrq56qzHKmHrbR8SUTZrN6ZfFcRh8AosbY8YOxRH2qyHylb5Dti8Y02chXPZy8bBh/9djLu+Xz
	P01Edsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvi1h-0000000G2b6-18yi;
	Fri, 21 Mar 2025 19:27:29 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvi1e-0000000G2Zz-20sd
	for ath11k@lists.infradead.org;
	Fri, 21 Mar 2025 19:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1742585233; x=1743190033;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=o5KuILFsArzDnml8ZNWsQJ8DsMl/xcUsw5dgf52brGo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hDUMyOFb7n6nqUrTqx+gCwefRLtdj1hgKoOG5yWKgXxtKbeArMmlQWrnmQdOBL7a
	 DyKo6ALqFy5ie9AcTjCHrh1pnk1kCYVa1Qafrv4UTikQHID0gB2X1mOQ8x4Hr60HX
	 K9rkr1KRUB1InUtcQFJ/daMKMnLXHxbvFiadv6iSldegeahMqNHxuCOKxJc1IR3iu
	 i5CwkWwkr3D7iUYyIJxPmXXFfrMThN1w6mbq62Acy9x3riQa6GEZLIFXZuoBwpqTC
	 ZC1tklfNFgqaIb+TF0tXihLjp9QD0BQwbrQA257zXgaHun6JjnJpJOvGM9n0NGmtw
	 5lLRMy1cBsswLpMl0w==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MzhWp-1t09Nw2NdJ-00uqaa; Fri, 21 Mar 2025 20:27:13 +0100
Message-ID: <a2b2d743-42eb-4eb2-ac41-93d2ab0af939@oldschoolsolutions.biz>
Date: Fri, 21 Mar 2025 20:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix ring-buffer corruption
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
 Steev Klimaszewski <steev@kali.org>, Clayton Craft <clayton@craftyguy.net>,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250321094916.19098-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250321094916.19098-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4dfKNF8HgT0iUPiS0YLMuHQtP46Vjd5JnvB0drE83CaG3D+6MJ+
 Ity7CaC7MozQZQGLs5J33TTjO/+4CH/npxqtytEHAaXop+U+aoqo2ziHThoj4CmRCfcJnHK
 jkymob2jwwi+dFnWSEI1I8QsE3EX6qb4cdhSPxj+bM0sslfsIrcdXysf0IF4sr8de5x8qNP
 yMiNsDTi7QFMzj6Vfb4+w==
UI-OutboundReport: notjunk:1;M01:P0:JCJBpXcAC9M=;qGU8/OmRr/zBvjepw4Yfp4A0tWJ
 DxN21CZcqo/fruL3yB5jlVyDW+qNF5QA6upKW7ezDUq5PJbgP0Xrk0bfPpyXj8mwg20y6moUa
 mkMe0VgRh3Flkv0jcvPJ3J0rX+1WDTuo/kDksdERKuASIRNMatjD7TEzo6YRBXuqtPWtJAiH0
 tmz93Mgx0gY8m/mTnjnzZIORedmjiY9zRmLgpQk2DENIHfyk1tlwDhepPoqnPt0k9WdvRp7L0
 uExo4z5JObwExWgo2eQFyY1bj77m1CANtaTljLXKQnZcdP8PJilcuWsv5Vfw77gqCpfZOdzOl
 gj65XSqS/7MbFjDplwc40tLQ0WfroSttyg6mAeHnKRv9iTcogngSfiU6UIm7lOZj6U5jFvW7Y
 OcqyCv+9V74Bzg6B9Zo3Xgj7hWtpWm+Z+/vNSFparYcRK7PjP2f38/Q8HQJn42KtiUlsRPyHz
 KV6O8k0xLup2gJX/T/L488ZrIesUZzS3cxcv4qt5sNtC5pJAZwWVOO2RF6rALeTxJNnm9OBlf
 r6XItrFCQlh0W+6Y3WQI1eT/caSfrgzw6M0fp/3tJclBelbelvRwf9/jv+47tTebH1aSxeWXf
 tICGegt7GyylsPTpBHQsdVlSW7gmxfyLmFMdfu0nUkGJw9UL+fIdgriF406n5BuFVjViR4tvr
 X01UfXiIYxudRB5umNUpY/jBz+jNdy1jMHNInNmeKkptkF59YuWn154cNuqm6uYLw+YjlqfJ9
 JgpMJFF6oVatTuUDSbBct3HYzwEEoZ/nKAaz5Y8LaimdzvxaOiipXiGcplQQz0Qjpit+s81DK
 ocM4cSSsjq0Dx2q2lrYbkMbBtjpIYnOg/pLa0Q5qUpOgvFOAyQNGLrotMEXJPWVYoky2o61PR
 XDhmlnWJPpedK5mM0jHr4LkSKvXtaQpc6oPQLqnuNpzhIRZ94PNmbhrHEXJz83d70jropuqmm
 rc4Rbssr5ZUy64fTOokvyEQCy0sRKTxc+eVtAcjbHXFk/7cDtPo7iENfUbvBvD3vD5GZNGeC1
 KZFPAW5TRnrRA0f3gIKH6ICHZyOXE/mRFxM3R+q3+JrisrMBOpvy0Gvj1xMoULaM7h/Ja08ef
 oFcJT0g6gd6Q0tT4tGggBGTtChaidwgh+ON1h7ALbKLRgP22H9P1xTftFEvpa+uK2zII9/HBG
 46SrW3rdB9m8bKFJ8iwXqF7EL++uGi+HeiBtP6k7D3x0P+7a9gBrQOQMDYAOXZeN1WAZ2d5iT
 +j6PXJjXZuSuQQuWvFTEHsF9BPFKeJR14JbKua9h0gR7ZUmJ4OGcSLIlOLwW1e+Ir9HosoEIz
 dgDiI3r8aYIGSkFk04O4QWwj9DXSzRTJbRWXzZ3eu4md3mWZt3Of4xCI6NCEZNHH+YR5CNdKD
 Elbwuuf9FjdvLZfA1Qe1VifG7XzeYB/NUNOyE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_122726_973984_AB450AFA 
X-CRM114-Status: UNSURE (   7.57  )
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

On 3/21/25 10:49, Johan Hovold wrote:
> Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> breaks and the log fills up with errors like:
>
>      ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, exp=
ected 1492
>      ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, exp=
ected 1484
>
> which based on a quick look at the driver seemed to indicate some kind
> of ring-buffer corruption.
>
I had this issue on the Windows Dev Kit 2023 and X13s, interestingly
never on the HP Omnibook X14. With this patch there have been no
occurrences.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


