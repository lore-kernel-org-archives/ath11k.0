Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A9C4707B
	for <ath11k@archiver.kernel.org>; Thu, 18 Jan 2024 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy/0MT8KuX3xt4oViAwqdFskOSIEVfu3S6sTs5Q4whg=; b=XR3+eYvu4X6y/BwuOmq7jfTPg1
	Kpvv1PSh0vdq2KFwhT1xclZM27fobtbDucAq5Wl1h3ELH5fB8tu2UDZnCy/mjCKZorgnOVJCisqgG
	iGGxIQXfhirmRyglUF/L8154f4NT8yvKaDm/SbNm1943ikcVBjTVT8oGoXvW/Uzp/jT+G0Ot0QBgb
	1U1aLpcc83mx66BNl7a3qWedkK0rgUrnCMuafA5RznJP/0Ufo1SxsrRU+pZzMaDM1SO8Om0DRrcq2
	Z6thZIxXLKU6g4vvbToGLFn4hUPdXV1RmdMFNYy46WK1amMK1CWuuQqb9x4O7DLSIUanOoM2B/TJx
	T/oRJg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPlD-002Pbr-2i;
	Thu, 18 Jan 2024 10:36:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPlB-002PbJ-05
	for ath11k@lists.infradead.org;
	Thu, 18 Jan 2024 10:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A688CE1EFA;
	Thu, 18 Jan 2024 10:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EFBC433F1;
	Thu, 18 Jan 2024 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705574187;
	bh=V7SLY2WKm0BeySvWZxBq2SEwTs/OZEEQZ6MOE6yAWbg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mt6S1xRK8J9VQW8+KWcRHdIY0hVHkPIk35lYK+/gV0ejpbL8fnC6Qb4RfalNfQ1cx
	 T0GUYurWqL3IKmdHdMvE2j5sp3bYm5v89mJKAgYDuv5K1E5g9IwegaNrJOfWa6xFXZ
	 bdZEXIShtcrj40t4+kQQu5gdo1xIH17OxNV6FTEVrW7I3l0Znq4gbg2nwrKnsls1ls
	 7w2EwCgDRP5ECMcQYjqiCK9zLca3mgEBVUi0S2u45SgEKRSHn6UneQOkFGx8eN8xnX
	 k0fYDTatkjTaSU0wsIPthJUa6GWFjTsRAgN7gC2Bbrdeu6NkhSeAPpDRPgCNQmiHw9
	 Y/rgV3V1fD2fA==
From: Kalle Valo <kvalo@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: <ath11k@lists.infradead.org>
Subject: Re: ath11k: 512 client support on QCN9074
References: <d857016e-7bea-4f77-8931-97b0d56751f5@westermo.com>
Date: Thu, 18 Jan 2024 12:36:25 +0200
In-Reply-To: <d857016e-7bea-4f77-8931-97b0d56751f5@westermo.com> (Alexander
	Wilhelm's message of "Thu, 18 Jan 2024 11:30:06 +0100")
Message-ID: <87a5p33p3q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_023633_260760_F42317AD 
X-CRM114-Status: UNSURE (   7.73  )
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

Alexander Wilhelm <alexander.wilhelm@westermo.com> writes:

> The QCN9074 module with the ath11k driver currently only supports 128
> clients. It should actually be able to support 512, shouldn't it? If
> so, is there a firmware restriction because of this, etc?

IIRC increasing station limit means that we have to reduce memory usage
somewhere else and we don't have a good dynamic way to change those
values in ath11k right now. Hopefully someone else answers who knows
this better.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

