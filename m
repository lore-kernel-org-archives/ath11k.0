Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEFFD609CE
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 10:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmYabh9bIkIqigNzwGNBZx27RPDTRniJlyb8xtwhRCQ=; b=v+aLhSofRJh7U7cO1nawLyp+Mw
	R84TrZAlMU7kP1zdJgnI/ZTXgtlQnFrge3ZRZblDSSk1AOLpbmRmO6CeJyUodYpdQ36ulicoW50yF
	B0RkzKmd46flZkRH6Waa6o6HI4MVjOVXQ2AJ3XSd3k9ucNbNTq5lKvP6v5tZJ7JbWVr1bu+nNh/7A
	vRXTq9uws4SKoIgEPHo6CG7+jQ8AhwslOaLdrJJPfI+u1y5jxgn1jyVl+LVbMOK19hYFcOpOAsYNa
	hTLvL60o9sgP2xYroekZoWn/GpZgChFFbsGg0mx6UkHhLG9q6MEunZfkjYA/M/v/cLC2gOsZBG9Ug
	Sut4uNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFUG-0000000Ct1b-0UAY;
	Wed, 27 Nov 2024 10:41:36 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFPI-0000000CsA8-3MZc
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 10:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732703786; x=1733308586; i=markus.elfring@web.de;
	bh=TmYabh9bIkIqigNzwGNBZx27RPDTRniJlyb8xtwhRCQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QAdUcBC0zKYJ0m5e9Iimdf7z/gGuiIFpwQINi/whCC5uf9NKwwvLUl24y9zqJn6U
	 hDfHX+z47ODQgpVyO2HCqDex+TtjDnwtnwb8Csh0YkUEJuCGAsNpbxMhtAYSTtFbE
	 m9nrt2TUKCGRyG4IDTfMG9SoqojpQFA99Ln+KTR63UWEfm2/Wbt1KwbvyQ/H4/7uD
	 M8TJw77odM1dp65cqr9PakENtC2YoNB2zkfnjH7AgnEiW4o/GMDXHFppERwBDT2lS
	 24ifynlJcaQT8uuAIOZX5VOz0DU9WCKHzjKkCP5dw+8mUV7S31GdZpaoueEZ3LtXO
	 jxZFzSyoc1ZqWIdJIw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWzCt-1tEDDM3Wnp-00XC30; Wed, 27
 Nov 2024 11:36:25 +0100
Message-ID: <64d7fa52-b96c-4bff-b90c-98f0b1d15ac5@web.de>
Date: Wed, 27 Nov 2024 11:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4?] wifi: ath11k: Fix NULL pointer check in
 ath11k_ce_rx_post_pipe()
To: Baichuan Qi <zghbqbc@gmail.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Johnson <jjohnson@kernel.org>
References: <a77fe99d-079b-4ef3-a1ce-6aea10256860@web.de>
 <20241127094317.303815-1-zghbqbc@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241127094317.303815-1-zghbqbc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Py1c9kYazIOa97Bl2d5McnNdohl31kJr34k0xDQ15O+y6nlbgR8
 TkkQ/CWVDJvhg2ysptEWlnxDa+lzxLWBaXhM+2U5TvgEnPgjf3juhLIzUvmqf6BE6eIetei
 KvjXJ/S8m9UeGx1WeBsBFXWCAA1UcUqy68rBGpE/LG4B1eCS4R7z7b4+/tIQtJjYckqmYxY
 iywyvxayCWpA8pNpS6WDg==
UI-OutboundReport: notjunk:1;M01:P0:hORuV1YLnf0=;WUqF6ybSNBXeLmjb3Kxfr7OM+X9
 mWgiW/9ePL1dLqAsFTznkBZnZu3/CjJOkPqYe8L10PGSI3E+nKicsPCGoQaQcBreNPt9G8Mmi
 gDEV4uJTpyTIPbqH61LICPlwAdN9gXoFBOR03EGNRP+MH03I3qmSj9Y893nRUa0MkjqAZc48j
 Z86G7FA09bxhI/suwcLd24JGo1+PfZI7tJX87zQWffKe1JsrgZGzC//agUGfDjdIaAFeaekFp
 SxMarSWeuhReCnfw2M3o9vT0HWN7OnKhyoaNdeKS9toaiOOwj2CrVzQUzQ33FZ0AWhoL1dLdc
 xM9n5+n5ktmNOigA4bROY9oJSKCStdT+x5CZgdZRBavb/Bke1wa8OLsnaWgzcMr1c4Rewv9ve
 PJ9sRUcRgAnkAJzgyjLQ46KdX36tXyc/5yAq/BqMnjK0UKlFq5SDhyS6OT1Vhyv4/4EDOXhMv
 avLAUtZSmDSwDqK5dlcoP4Nu+GI1NlcPTF/wzw+OZeT5wjSDPqbfBsHeyAFcZbXiKRt/c3r5B
 ITfrCFPFfs2Lu6zkSYjYUpLVBPKKe055Dl4I0m/AMWbf7vDQ8m3mOxne7sR+Jch7sMznk434m
 NJC3JVfCTvms0xuBMFhJQazDgp50O5T3rrtY+moDJCqBlnPbxYl2QktinfS4SjG9PmRWjAmCj
 D4DbB4ScbmxoHktxdwlO+VW0ubfZNZBzLLV0Wv3tYtDbvR1LWe6jkaJwCM2wnevZVkcEAkORk
 Rija1hFOhuJrQk1jEpr0DEnLDFAXkAZkzN97PJJ7zftDBMDxXB6pwHM3iD9CmU4JSKNckKhTM
 vhooEJd1XrY3slNSdcRyBQqUDirY8v7hfI3Xcoq1y2W8iTvOfIqjG81Fw4JIK7oe/3ycsNZ9J
 8lUttXBaAif96txnij/59AD0gbHsHEMk72JcMgMTcyjpzFQDuOgj8Sfhd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_023629_204812_475D2281 
X-CRM114-Status: UNSURE (   4.67  )
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

> Fix the NON-NULL check by =E2=80=A6

How do you think about to reorder any information from paragraphs?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12#n45


=E2=80=A6
> ---
>  drivers/net/wireless/ath/ath11k/ce.c | 2 +-
=E2=80=A6

Will you become more familiar with patch version descriptions?
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12#n310

Regards,
Markus

