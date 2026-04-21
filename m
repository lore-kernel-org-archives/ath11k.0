Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36062F8FA7A
	for <ath11k@archiver.kernel.org>; Tue, 21 Apr 2026 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=31zDPpsEw2Kk4UQszCKz16pggDtdmyyub4rGpp+IwBo=; b=Y/YqXzdLcGFPLijuFL8jPU9dBr
	UfiepSdUz7VUDW1xS3aAtt65iqhgCIgtRdVvhRspBmyfgQrgomTCFwIllEY3DPWwJS38EO2T8AFKv
	pYpw33WKjEUb2Y4B9R/weidNCLSnh7mAL/uUsTftM4BGrTmEusL229bQ5Eu7T9r+iM7HL6an6g2aX
	nqwfUYHI5s8scIFJGel5EKVw1Egbu8FwT0bPhY13l1NnNADz+dhiz45N3bp2NIeqkolUWkgDn2QLY
	Uq677rSrc3pgQcJppJp/gEXkZTJs67yK2jGmz55n7dzyhMhPJXnGR6oqMdEcGjTieX72WwpO0Ip9Z
	RK8N+5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBG8-00000008g1N-1nXD;
	Tue, 21 Apr 2026 13:35:24 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBG5-00000008g0d-2J7K
	for ath11k@lists.infradead.org;
	Tue, 21 Apr 2026 13:35:22 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-651d692e833so4231096d50.3
        for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 06:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776778520; cv=none;
        d=google.com; s=arc-20240605;
        b=G11HK7PJsiMROOLnx/uf0lRuwkvs3Xvue42OeiCKf6VVZcEo9W05mx2QqnAP7PlQK/
         V4lgDGpHZ+OOTMQmFNpM+Rjv5sx/p9L4yokrWHKly8fXrX6uV9DKxuopXVt4+P1lQto5
         QDn/eP2ze8jyx0RtwOs/nG4wfBX9lS4FKZMMrMbLhyV+vese1yDxP/ZIYeNh3CiqQW1u
         BsGBqRciNVkyWkFuAvGVQNjTVZoNj5qbSigAZdGbNWz4iHyfvnHFJFzLmWPMorIoZhja
         yIIrPcnH90PycRfa0XXEqyAk4BQOJ4/LHMGbbtdpbvxlmSEjoJ6aI4jb95MLmROcHAjK
         Lztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=31zDPpsEw2Kk4UQszCKz16pggDtdmyyub4rGpp+IwBo=;
        fh=e7cO/Kps5b+5KtoB5bGHz1sK14rkUgN8Tf9YoDCrNJg=;
        b=CdgJdC3XM53gaJe4cAst3Q1Sw/EjjYUoYR1oBNML7H8SOhUbyl4uCH1tBGvR11FnhU
         HmxmPkF9hhw2w7ivjFYc/9C6ALzr9KqVkkLMAtOq1pb1vEXR6LlizzyTOMvcorqx69uW
         aDs1og4F0EtAWEkMPaZUMGa4Fop99EfhYwgKvlS1xp1uk4a6GNQi+y4q3XXN79vN3CQT
         m/pNahr2HEz/DahjPTlrSLR9XNvktsJ2bVl0UjLMKoc4HDuKb16mPFgWri4mmwCyPSoI
         TW/J9J8PdYtn1/rRyp5wdRbvG81idLxDrn8X5ai6yW9KAJCcoqJT07ecB9OdKHy9CFXQ
         Qfmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776778520; x=1777383320; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=31zDPpsEw2Kk4UQszCKz16pggDtdmyyub4rGpp+IwBo=;
        b=cEqTcP3pNxXB8ovYR3UVUQuUYo+e5JLZJSCBeQLqWW1AwjmO8Wl8Rs8mreXvUPDZm4
         HGkr3GB5JSAJioEtAYjt2I5ePRfKoLIdb/oWj7IylrCUgOWvgX+2hFXdGgJxLD5IQh0X
         GAIDxWU4go9wd3oTmZAdqoADCSkPOdfR/qYVxi5W2Za40gMmltRsWBKvHtuwtpZJ3nHm
         Z7MV+2j7lVBiEzHkDF83Xr04R0QrWVYDx6MM8ZIdD3X7zuXsOd1HY7VopL+Fqpe6qOl6
         51S/+km2k8AL1O6Q7TyG8ytu2GXNdGEn3KqrtIOMdZZYgl5OFKArvte6MAW5Md5bfpU6
         ZMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776778520; x=1777383320;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31zDPpsEw2Kk4UQszCKz16pggDtdmyyub4rGpp+IwBo=;
        b=X991Wiobfmpbooo07nV21P7IXNI9ncJElK4fngEZiAHkCOJ/RKaQ7H6cYvgHPUpWRR
         Cobi7T44AdaGDvIKtMCo+DodCozJncnNU/R+/Cxk1S8w/hj6T1v637LOIHfUbi5YX4C2
         yXa8zkXYU3u6DPyTjjKqlLIwiNZ7uzjdo0N/fNrwZNXEgUdsOheOUxI9qNMwd/fs6Qdl
         5UzhPh8ae7bJqB3/LcuiklqzbdBmCZr1S+dBFhcBsWAn3Ew5DPAQvdqRTKldFuTlajOr
         NKIBOwgQ3Py6cZUfWFuUwmZkjmiLC7Y7rxWZwgQ/ee0Pn1g1xzvDNz/aFOZoO6/1FAKV
         8c6w==
X-Gm-Message-State: AOJu0YwgK2S6sZ6XWmeKEW9xr1GgV+kh22/ySyQEHDF04Hq50csNP818
	XYDyA20X0bllx/9wb821Zev8SidZM5M/3GF/MyA0ogfMKr3KUUmGV2il9sVKuEjXs9uFl6QA/1i
	6ZPSWLdWXMZk/tbp0c94mnwBr5yRlhuxb2Q==
X-Gm-Gg: AeBDiesFLKGhnds+4/GLIh/3AXFqr/kHX4dAvzYvXV5T6AXsZZ4ZkCnL4uUUGGcMSW9
	yH+KxtcY76zlfL9k42n45AIiHXO9HODfJAEYbUzmV2STiYdNCkUWImIJGIgzlKprXmRp+sNCQ7r
	F7PJWCnnsI2QVt/XOc78p3DJxfXIhY7o/J84rjkT06DWU8OpMl9LrX9CSUr9W45fZp56AUjmM7j
	DrN35tLAS78I7MQZgRAueuPB4Y/Q2YOjDMidJnFcTcneLFSspAMraxrqUg9QEwRbjL/pvEpEhIU
	UVAP1PkCG+NPlagBzD0iku+PeQq3Lks4etR1VfylGOqU0ZcV
X-Received: by 2002:a05:690e:4804:b0:651:d23c:3d70 with SMTP id
 956f58d0204a3-6531083ad40mr11306200d50.16.1776778520092; Tue, 21 Apr 2026
 06:35:20 -0700 (PDT)
MIME-Version: 1.0
From: Adam Hill <sidepipeuk@gmail.com>
Date: Tue, 21 Apr 2026 14:35:08 +0100
X-Gm-Features: AQROBzB55hmDPabc6pOybZhzRJs87P87fwQMdzbDBsZ7nUXE25cQYHNK6_T-l-o
Message-ID: <CALgbQMzF65j7n+R6MEftB-uSgmxtcH4dq7tSt4Os_jnwrZirVw@mail.gmail.com>
Subject: Multiple radios/single phy - should the wiphy struct radios[] be set?
To: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_063521_658303_2BBD668C 
X-CRM114-Status: GOOD (  10.05  )
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

I've been trying to get a WCN6856 card working as an AP on OpenWrt (
but using a custom kernel and build ) and was hitting a brick wall
getting DBDC to work. I was starting from almost zero knowledge of
Linux WiFi in general which made it harder ( and means I might be
barking up the wrong tree ) - however, it seems that OpenWrt ( at
least ) relies on netlink returning a radio array to detect devices
that have multiple radios on a single phy, which doesn't seem
unreasonable to me.

I've hacked my OpenWrt build to assume that num_channels = 2 on a
second interface combination is the same thing ( which is what ath11k
seems to do when support_dual_stations is true) and confirmed that the
DBDC setup works with this mod. Shouldn't the ath11k driver be changed
to populate the radio list the same way ath12k does? What I've done
with OpenWrt is a bit of a hack, and who knows what else relies on
radios being defined!

