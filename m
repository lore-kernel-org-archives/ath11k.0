Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2333C982E1
	for <ath11k@archiver.kernel.org>; Mon, 21 Sep 2026 06:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezw3oz3pOs7dtmVE5AzB+SlQNlOgHO47M5+Fpf49XE4=; b=FnXkWeNgHcjYRnYJusllZri0eZ
	TbKCfX3DqTpSKBrrzwyqac8gR24HwhcUkx0tjbp85yPBji3KhBm4wD1fQICwuPTY0jQ1B0El+hXiH
	Mi99p2/mUdGTFaWDB89PRoie6atAdMO+ziJxkEUYfM1Ck4wycKGhmtpdRDSj46hZOTvyoR2oDNYx5
	qN1Qs2+oClFSI+dYn2qMU9LLfZiIdL1c1d12SS+Bl1K0byViMR6AMSPhHfwUqRqpH2wCwyTlhG170
	Q7sFfdu6HEvMplTXtDnzlLI4oqAu+bYLE64f462JgGdvUMN948jIU8RjKWRwiE+0bUvuSt8EbN8Z/
	xhCvzLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XaL-000000011Vm-089U;
	Mon, 21 Sep 2026 06:33:05 +0000
Received: from mail-yx2-x21.google.com ([2607:f8b0:4864:41::21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XaI-000000011VK-1GTT
	for ath11k@lists.infradead.org;
	Mon, 21 Sep 2026 06:33:03 +0000
Received: by mail-yx2-x21.google.com with SMTP id 00721157ae682-85d43da99easo21008557b3.1
        for <ath11k@lists.infradead.org>; Sun, 20 Sep 2026 23:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789972381; cv=none;
        d=google.com; s=arc-20260327;
        b=TRsakD7E2tXTfg+G6wipkWMd2TlgCIBST3RkIDKuWhmWrqZecwsYcboiztCNKMmyzj
         yFHC6gPlTu9UFAeE05vN/uwxMAz5sidtYowy0k06eaBDdzZZlUDKDLXDFfg7z1O+meY/
         Tb9rNvbBeSqLwAV/gJMNmfbAo4vE7rFyZnDm397tsuSunzr7Q06IYdxSvnjF8frKWJjS
         pE4l1EQD5g+d8S8rK8BU45Dg+VE8FbPhSdQbn+JH3rn7iaTEnUQgISlPs5k7oDdC2Ohv
         sQpUo3x90Kuf/DvSW710hN2VQ0XLPILHxHhM4gWOhoRmDB/CroOvZleoq7CjuBXSNAZ7
         29IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ezw3oz3pOs7dtmVE5AzB+SlQNlOgHO47M5+Fpf49XE4=;
        fh=JL3arTw8jWV/uobV3Vo52YYPdkn6tu4wGdBa66R0OF0=;
        b=q72+fc+Jdtc3Rkj9QUL9FMPJEoQ//BnkplNkVJk+KBl4vlUf51vZV0PiYSWwlDi5j0
         NQwoPo6qFg2Ss/9S4MqyjE808PihRK1G3ZhwCSCLpqXFgDPmz4bJVy5yXXPWawzAmGD6
         Hs/VrSJS3aBYiOS+p352GqwQ6qCnEElk7RQGCgZqzOIUdGXNdGovBe2mhHUmc/ckwqxd
         og1wKx+1IwC7G9t46wulcMedT3EYHvFRgcubNj3/apzvUmvZdSFR7gCtzIEat0YBtLgU
         +/axBGei9+X89N5WKJyZS+JKRjotFmRRO4UFKS3KmPoAaErjj1cJGUxuuYxRv567JRyW
         hq4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789972381; x=1790577181; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezw3oz3pOs7dtmVE5AzB+SlQNlOgHO47M5+Fpf49XE4=;
        b=uwGgbm5Q3ypExHV7ZMZEpDD0pu3JvA5NTxdAQmXy9S3Od2j5G6EtxjiWQ/6MVF1/eT
         BkpBvB+qbS27vp2G0FIKQDiPUd0AMjJCZI8SFlAxIaBM8YtdYX57/IQ72vRU2yxGnqTr
         H+0PGyPfxxqsAeGUEY347xALIZiu1/yqweFQ4MjmpuBjhRjyXdQ0sJRa+PRJ4w8edsjX
         tPucC1d6QHQUEJi3q2zcPgZnZu9h/Vq00uR/48vdPfmG+3rBguJw3Gxtw954Kvnm1K4e
         3UIFH+OuZMoWA7l4Db869W4kET/ULciSVMczb7HyIrSGbMl3RA4RslIXEnq0GfcjVXk9
         pYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972381; x=1790577181;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ezw3oz3pOs7dtmVE5AzB+SlQNlOgHO47M5+Fpf49XE4=;
        b=w6GKcOWAG2aFSViQFiRSbmGY9CdZDkkEGURvV8GM0jaXv/a6ChbZ5RuQ1QBCuAY+vw
         BHX2INh+Vh04W6lGtL3NzgumgUMV7q/L2h2H4zhAp3P/RJG4daf2xqMCgTu4pJl8XTfm
         qgKG5YysbnXgxIPs9/TGQm9g+gYnBCaon1H8aLiaVQYO+vVXy3Zmwa1WRUaYTbG1g7j9
         o0MFClpaNPpD+caQYB2tUI4zYWtHWlDZqc+2iAFX+NUkzasKU2gZwvH8RTlPjMtb5KjZ
         BrwngoqrWkSxkMjtaCNck5/gpXImRbxbqQBqGLbvu+xaDmOi1ZAT1A9IcYAR5UYW3IhK
         tepw==
X-Forwarded-Encrypted: i=1; AKwUvBz57pvHztW3YGCimgxPjrA1iWwF5v5xO/rYGbKVEG7XiYqTFKbZ20pxpxfWAF7FoI7QFPDmMZw=@lists.infradead.org
X-Gm-Message-State: AFuF++lD6erySFUwVT44w4HP7zDLGAS6Yg9tMeKBa6KAFPjYx7nepRNk
	RhrOSSeaSMMWzaRKJucHagtkdDEMUjIiXWwWQDvzEu2dTowMzJ713TbquBrZKtrsxK6cHpqhGAc
	OEmbq4nP4R47rIejWrmlvChsxJyvJ0YlU68rqAfhi
X-Gm-Gg: AYBFou3jCfwevOdN+0U86xMSpKqGmkhOnDfhr4zE8ScRDBvSBsGcwRp4u9lz2vO4Dhb
	yB1OPyu9e5djP/9jAK+mwmhwU2zzd5F+UbnoemjUlHrx1n/kfbi+YkitrwcH8IyZIdgBmB+guFQ
	azI45LaKBudPllCSg7fEaNt1NRiHZ7LYjEpBiz8/fZpA4ylRiuiZwf4NuyrSFuuiIO8j0V3hleo
	V2EpfR8vC9noVP6L4omZuP7u2xL3n/nAz8isTkPx6Ppc9nx6iax8EVMG6qhpYQEQhMfHG36jqa9
	OySjfOWNXGQLSgw13KhY/CgJOOkTfRg+W+OGiDbMn+19F7knLnzokg7+jOV+a6UUChOXG4FH6Ty
	OiJ39wXS2OFmc6sAfr+ysUJhVcO7V1aPCGVPoQt64R8QXVXx9dLkzO867j9VKIn95JRE7GCNYax
	S3JtfCS55CvzYX4kEJ0h4CjYBDfUuJDUMtKAArWdm1ZJww30Ekwbukgdg9wguU53U4crswsAcG9
	RRYxKfuJLTpGba2cNDlAdmooy49a122A4R58vJ9y1Du7UV3JeFbcSJWPXyGrFec0u8i+wVGF7NI
	VkCQ8Lch6dPmaQ==
X-Received: by 2002:a05:690c:6e84:b0:873:5bd1:98cb with SMTP id
 00721157ae682-89738590444mr27664057b3.61.1789972380819; Sun, 20 Sep 2026
 23:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de> <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com> <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
 <10491411-b500-4e89-bf85-5142ced60aaf@samsung.com> <CAC1t37Ltrh+BBaEPi8grXnMrDt3qGDH8BA56av-h7=yPCCk0Nw@mail.gmail.com>
 <358d7dd0-20b0-44ee-8b1e-a0cc6cb40abe@oss.qualcomm.com>
In-Reply-To: <358d7dd0-20b0-44ee-8b1e-a0cc6cb40abe@oss.qualcomm.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Mon, 21 Sep 2026 06:32:24 +0000
X-Gm-Features: AcwNN1VYrMKW7MY0qI4o0V65psGhOM1MxhN8fHN4VCpGkg_iFv4IKVsZlw5pgJE
Message-ID: <CAC1t37LqZCpnjfjpZUGDHOiMMEfGtZoSCPio737VFKs2vaOSEg@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, jjohnson@kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com, 
	rameshkumar.sundaram@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_233302_350719_05C95348 
X-CRM114-Status: UNSURE (   6.72  )
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

Yes, sure

Am Mo., 21. Sept. 2026 um 03:17 Uhr schrieb Baochen Qiang
<baochen.qiang@oss.qualcomm.com>:
>
>
>
> On 9/21/2026 12:42 AM, Julius Bairaktaris wrote:
> > Hi @Baochen,
> >
> > tested 5 times and it solves the problem. Thanks!
>
> Thanks. Can I have below tag when I submit the fix ?
>
> Tested-by: Julius Bairaktaris <julius@bairaktaris.de>

